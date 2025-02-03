const multer = require('multer');
const path = require('path');
const cloudinary = require('../config/cloudinary.config');
const { Readable } = require('stream');

// Configure multer for memory storage
const storage = multer.memoryStorage();

// Enhanced file validation for cleaning job photos
const fileFilter = (req, file, cb) => {
    console.log('Processing file:', file.originalname, 'Type:', file.mimetype);
    
    // Check file type
    if (!file.mimetype.startsWith('image/')) {
        cb(new Error('Not an image! Please upload only images.'), false);
        return;
    }

    // Check file extension
    const allowedExtensions = ['.jpg', '.jpeg', '.png', '.heic'];
    const ext = path.extname(file.originalname).toLowerCase();
    if (!allowedExtensions.includes(ext)) {
        cb(new Error('Invalid file type. Only JPG, PNG, and HEIC images are allowed.'), false);
        return;
    }

    // Additional validation based on upload type (profile vs job)
    const isProfileUpload = req.baseUrl.includes('profile');
    const maxSize = isProfileUpload ? 5 * 1024 * 1024 : 10 * 1024 * 1024; // 5MB for profile, 10MB for job photos

    if (file.size > maxSize) {
        cb(new Error(`File too large. Maximum size is ${maxSize / (1024 * 1024)}MB`), false);
        return;
    }

    cb(null, true);
};

// Initialize multer with configuration
const upload = multer({
    storage: storage,
    fileFilter: fileFilter,
    limits: {
        fileSize: 10 * 1024 * 1024, // 10MB max file size for job photos
        files: 10 // Maximum 10 files per upload
    }
});

// Separate middleware for single and multiple uploads
const uploadSingle = upload.single('photo');
const uploadMultiple = upload.array('photos', 10);

// Wrapper for better error handling
const uploadMiddleware = (req, res, next) => {
    const uploadFn = req.query.batch === 'true' ? uploadMultiple : uploadSingle;
    
    uploadFn(req, res, (err) => {
        if (err instanceof multer.MulterError) {
            console.error('Multer error:', err);
            return res.status(400).json({
                message: 'File upload error',
                error: err.message
            });
        } else if (err) {
            console.error('Unknown upload error:', err);
            return res.status(500).json({
                message: 'Unknown upload error',
                error: err.message
            });
        }
        next();
    });
};

// Function to get upload options based on photo type
const getUploadOptions = (folder, metadata, photoType = 'general') => {
    const baseOptions = {
        folder: folder,
        resource_type: 'auto',
        quality: 'auto',
        fetch_format: 'auto',
        eager_async: true,
        ...metadata
    };

    // Define moderation and advanced features based on environment
    const useAdvancedFeatures = process.env.CLOUDINARY_ADVANCED_FEATURES === 'true';

    switch (photoType) {
        case 'before':
            return {
                ...baseOptions,
                width: 2000,
                height: 2000,
                crop: 'limit',
                eager: [
                    { width: 200, height: 200, crop: 'thumb', gravity: 'auto' }, // Thumbnail
                    { width: 800, height: 800, crop: 'limit' }, // Medium
                    { width: 1600, height: 1600, crop: 'limit' }, // Large
                ],
                tags: ['before', 'job_photo'],
                colors: true, // Basic color extraction is available in free plan
                ...(useAdvancedFeatures && {
                    moderation: 'aws_rek',
                    colors: true
                })
            };
        case 'after':
            return {
                ...baseOptions,
                width: 2000,
                height: 2000,
                crop: 'limit',
                eager: [
                    { width: 200, height: 200, crop: 'thumb', gravity: 'auto' }, // Thumbnail
                    { width: 800, height: 800, crop: 'limit' }, // Medium
                    { width: 1600, height: 1600, crop: 'limit' }, // Large
                    { width: 800, height: 800, crop: 'fill', gravity: 'auto' }, // Square for comparisons
                ],
                tags: ['after', 'job_photo'],
                colors: true,
                ...(useAdvancedFeatures && {
                    moderation: 'aws_rek'
                })
            };
        case 'profile':
            return {
                ...baseOptions,
                width: 500,
                height: 500,
                crop: 'fill',
                gravity: 'face',
                eager: [
                    { width: 100, height: 100, crop: 'thumb', gravity: 'face' }, // Small thumbnail
                    { width: 300, height: 300, crop: 'fill', gravity: 'face' }, // Medium
                ],
                tags: ['profile'],
                ...(useAdvancedFeatures && {
                    moderation: 'aws_rek'
                })
            };
        default:
            return {
                ...baseOptions,
                width: 1200,
                height: 1200,
                crop: 'limit',
                eager: [
                    { width: 200, height: 200, crop: 'thumb', gravity: 'auto' },
                    { width: 800, height: 800, crop: 'limit' }
                ]
            };
    }
};

// Function to upload to Cloudinary with optimization
const uploadToCloudinary = async (buffer, folder, metadata = {}, photoType = 'general') => {
    console.log('Uploading to Cloudinary...', { folder, metadata, photoType });
    return new Promise((resolve, reject) => {
        const uploadOptions = getUploadOptions(folder, metadata, photoType);
        const uploadStream = cloudinary.uploader.upload_stream(
            uploadOptions,
            (error, result) => {
                if (error) {
                    console.error('Cloudinary upload error:', error);
                    return reject(error);
                }
                
                // Extract relevant metadata
                const imageInfo = {
                    public_id: result.public_id,
                    url: result.secure_url,
                    format: result.format,
                    width: result.width,
                    height: result.height,
                    size: result.bytes,
                    created_at: result.created_at,
                    variants: {
                        thumbnail: result.eager?.[0]?.secure_url,
                        medium: result.eager?.[1]?.secure_url,
                        large: result.eager?.[2]?.secure_url,
                        square: photoType === 'after' ? result.eager?.[3]?.secure_url : undefined
                    },
                    colors: result.colors, // Color information if available
                    predominant: result.predominant, // Predominant colors
                    moderation: result.moderation, // Moderation results if enabled
                    exif: result.exif, // EXIF data if available
                };

                console.log('Cloudinary upload success:', imageInfo);
                resolve(imageInfo);
            }
        );

        const bufferStream = new Readable();
        bufferStream.push(buffer);
        bufferStream.push(null);
        bufferStream.pipe(uploadStream);
    });
};

// Middleware to handle the upload to Cloudinary
const processUpload = async (req, res, next) => {
    console.log('Processing upload...');
    
    // Handle both single and multiple file uploads
    const files = req.files || (req.file ? [req.file] : []);
    
    if (files.length === 0) {
        console.log('No files in request');
        return res.status(400).json({ message: 'No files uploaded' });
    }

    try {
        const folder = req.baseUrl.includes('profile') ? 'profiles' : 'jobs';
        const photoType = req.baseUrl.includes('profile') ? 'profile' : (req.query.type || 'general');

        const uploadPromises = files.map(async (file) => {
            console.log('Processing file:', {
                originalname: file.originalname,
                size: file.size,
                mimetype: file.mimetype,
                folder: folder,
                type: photoType
            });

            return await uploadToCloudinary(
                file.buffer,
                folder,
                {
                    user_id: req.user.id,
                    job_id: req.params.jobId,
                    original_filename: file.originalname
                },
                photoType
            );
        });

        const results = await Promise.all(uploadPromises);
        req.uploadedFiles = results;
        next();
    } catch (error) {
        console.error('Error in processUpload:', error);
        res.status(500).json({
            message: 'Error uploading to Cloudinary',
            error: error.message
        });
    }
};

module.exports = {
    upload: uploadMiddleware,
    processUpload
}; 