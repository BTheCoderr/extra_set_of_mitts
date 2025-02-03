const Job = require('../models/job.model');
const User = require('../models/user.model');
const cloudinary = require('../config/cloudinary.config');

// Upload job photo(s)
const uploadJobPhoto = async (req, res) => {
    try {
        const uploadedFiles = req.uploadedFiles || [req.uploadedFile];
        if (!uploadedFiles.length) {
            return res.status(400).json({ message: 'No files uploaded' });
        }

        const job = await Job.findById(req.params.jobId);
        if (!job) {
            // Delete the uploaded images since we won't be using them
            await Promise.all(uploadedFiles.map(file => 
                cloudinary.uploader.destroy(file.public_id)
            ));
            return res.status(404).json({ message: 'Job not found' });
        }

        const photoType = req.query.type || 'before';
        const photoData = uploadedFiles.map(file => ({
            url: file.url,
            public_id: file.public_id,
            type: photoType,
            uploadedAt: new Date(),
            variants: file.variants,
            metadata: {
                size: file.size,
                format: file.format,
                width: file.width,
                height: file.height,
                colors: file.colors,
                predominant: file.predominant
            }
        }));

        if (!job.photos) {
            job.photos = [];
        }
        job.photos.push(...photoData);
        await job.save();

        res.status(200).json(photoData);
    } catch (error) {
        console.error('Error in uploadJobPhoto:', error);
        res.status(500).json({ message: 'Error uploading photo', error: error.message });
    }
};

// Get job photos with comparison
const getJobPhotos = async (req, res) => {
    try {
        const job = await Job.findById(req.params.jobId);
        if (!job) {
            return res.status(404).json({ message: 'Job not found' });
        }

        // Group photos by type and task
        const groupedPhotos = {
            before: job.photos.filter(p => p.type === 'before'),
            after: job.photos.filter(p => p.type === 'after'),
            comparisons: []
        };

        // Generate before/after comparisons
        if (req.query.compare === 'true') {
            const beforePhotos = groupedPhotos.before;
            const afterPhotos = groupedPhotos.after;

            groupedPhotos.comparisons = beforePhotos.map(before => {
                const after = afterPhotos.find(a => 
                    a.metadata?.taskId === before.metadata?.taskId ||
                    a.metadata?.location === before.metadata?.location
                );
                
                if (after) {
                    return {
                        before: {
                            url: before.url,
                            thumbnail: before.variants?.thumbnail,
                            square: before.variants?.square
                        },
                        after: {
                            url: after.url,
                            thumbnail: after.variants?.thumbnail,
                            square: after.variants?.square
                        },
                        metadata: {
                            taskId: before.metadata?.taskId,
                            location: before.metadata?.location,
                            beforeTime: before.uploadedAt,
                            afterTime: after.uploadedAt
                        }
                    };
                }
                return null;
            }).filter(Boolean);
        }

        res.status(200).json(groupedPhotos);
    } catch (error) {
        console.error('Error in getJobPhotos:', error);
        res.status(500).json({ message: 'Error retrieving photos', error: error.message });
    }
};

// Delete job photo(s)
const deleteJobPhoto = async (req, res) => {
    try {
        const job = await Job.findById(req.params.jobId);
        if (!job) {
            return res.status(404).json({ message: 'Job not found' });
        }

        // Handle bulk delete if photoIds are provided in query
        const photoIds = req.query.photoIds ? req.query.photoIds.split(',') : [req.params.photoId];
        
        const deletedPhotos = [];
        const errors = [];

        for (const photoId of photoIds) {
            const photoIndex = job.photos.findIndex(photo => photo.public_id === photoId);
            if (photoIndex === -1) {
                errors.push({ id: photoId, error: 'Photo not found' });
                continue;
            }

            try {
                // Delete from Cloudinary
                await cloudinary.uploader.destroy(photoId);
                
                // Remove from job document
                const deletedPhoto = job.photos.splice(photoIndex, 1)[0];
                deletedPhotos.push(deletedPhoto);
            } catch (error) {
                errors.push({ id: photoId, error: error.message });
            }
        }

        await job.save();

        res.status(200).json({ 
            message: 'Photos processed',
            deleted: deletedPhotos,
            errors: errors.length > 0 ? errors : undefined
        });
    } catch (error) {
        console.error('Error in deleteJobPhoto:', error);
        res.status(500).json({ message: 'Error deleting photo', error: error.message });
    }
};

// Upload profile photo
const uploadProfilePhoto = async (req, res) => {
    try {
        if (!req.uploadedFile) {
            return res.status(400).json({ message: 'No file uploaded' });
        }

        const user = await User.findById(req.user.id);
        if (!user) {
            await cloudinary.uploader.destroy(req.uploadedFile.public_id);
            return res.status(404).json({ message: 'User not found' });
        }

        // If user already has a profile photo, delete it from Cloudinary
        if (user.profilePhoto && user.profilePhoto.public_id) {
            await cloudinary.uploader.destroy(user.profilePhoto.public_id);
        }

        user.profilePhoto = {
            url: req.uploadedFile.url,
            public_id: req.uploadedFile.public_id,
            updatedAt: new Date(),
            variants: req.uploadedFile.variants
        };

        await user.save();
        res.status(200).json(user.profilePhoto);
    } catch (error) {
        console.error('Error in uploadProfilePhoto:', error);
        res.status(500).json({ message: 'Error uploading profile photo', error: error.message });
    }
};

module.exports = {
    uploadJobPhoto,
    uploadProfilePhoto,
    getJobPhotos,
    deleteJobPhoto
}; 