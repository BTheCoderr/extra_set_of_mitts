const express = require('express');
const router = express.Router();
const { auth } = require('../middleware/auth.middleware');
const {
    register,
    login,
    getProfile,
    updateProfile
} = require('../controllers/auth.controller');

// Public routes
router.post('/signup', register);
router.post('/signin', login);

// Protected routes
router.get('/profile', auth, getProfile);
router.patch('/profile', auth, updateProfile);

module.exports = router; 