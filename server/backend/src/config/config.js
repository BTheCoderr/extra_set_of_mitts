require('dotenv').config();

const config = {
    env: process.env.NODE_ENV || 'development',
    port: process.env.PORT || 3000,
    jwtSecret: process.env.JWT_SECRET || 'your-secret-key',
    mongoUri: process.env.MONGODB_URI || 'mongodb://localhost:27017/extra_set_of_mitts',
    
    cloudinary: {
        cloudName: process.env.CLOUDINARY_CLOUD_NAME,
        apiKey: process.env.CLOUDINARY_API_KEY,
        apiSecret: process.env.CLOUDINARY_API_SECRET,
        folder: process.env.CLOUDINARY_FOLDER || 'extra_set_of_mitts',
        useAdvancedFeatures: process.env.CLOUDINARY_ADVANCED_FEATURES === 'true'
    },

    email: {
        service: process.env.EMAIL_SERVICE || 'gmail',
        user: process.env.EMAIL_USER,
        pass: process.env.EMAIL_PASS,
        from: process.env.EMAIL_FROM || 'noreply@extrasetofmitts.com'
    },

    aws: {
        accessKeyId: process.env.AWS_ACCESS_KEY_ID,
        secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY,
        region: process.env.AWS_REGION || 'us-east-1',
        bucket: process.env.AWS_BUCKET
    },

    cors: {
        origin: process.env.CORS_ORIGIN || 'http://localhost:3000',
        credentials: true
    },

    security: {
        bcryptRounds: 10,
        sessionSecret: process.env.SESSION_SECRET || 'your-session-secret',
        tokenExpiration: '7d'
    }
};

module.exports = config; 