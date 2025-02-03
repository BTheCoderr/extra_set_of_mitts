const express = require('express');
const router = express.Router();
const { auth } = require('../middleware/auth.middleware');
const { upload, processUpload } = require('../middleware/upload.middleware');
const {
    uploadJobPhoto,
    uploadProfilePhoto,
    getJobPhotos,
    deleteJobPhoto
} = require('../controllers/photos.controller');

// All routes require authentication
router.use(auth);

// Job photo routes
router.post('/jobs/:jobId', upload, processUpload, uploadJobPhoto);
router.get('/jobs/:jobId', getJobPhotos);
router.delete('/jobs/:jobId/:photoId', deleteJobPhoto);

// Profile photo routes
router.post('/profile', upload, processUpload, uploadProfilePhoto);

module.exports = router; 