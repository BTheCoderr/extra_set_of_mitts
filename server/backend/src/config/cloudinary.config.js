const cloudinary = require('cloudinary').v2;
const config = require('./config');

// Log configuration (without sensitive data)
console.log('Cloudinary Configuration:', {
    cloud_name: config.cloudinary.cloudName,
    api_key: '***' + config.cloudinary.apiKey.slice(-4),
    secure: true
});

cloudinary.config({
    cloud_name: config.cloudinary.cloudName,
    api_key: config.cloudinary.apiKey,
    api_secret: config.cloudinary.apiSecret,
    secure: true
});

// Test Cloudinary connection
cloudinary.api.ping()
    .then(result => console.log('Cloudinary connection successful:', result))
    .catch(error => console.error('Cloudinary connection error:', error));

module.exports = cloudinary; 