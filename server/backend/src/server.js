const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const config = require('./config/config');

// Import routes
const authRoutes = require('./routes/auth.routes');
const jobsRoutes = require('./routes/jobs.routes');
const photosRoutes = require('./routes/photos.routes');

// Initialize Express app
const app = express();

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Database connection
mongoose.connect(config.mongoUri)
    .then(() => console.log('Connected to MongoDB'))
    .catch(err => console.error('MongoDB connection error:', err));

// Routes
app.use('/api/v1/auth', authRoutes);
app.use('/api/v1/jobs', jobsRoutes);
app.use('/api/v1/photos', photosRoutes);

// Basic route
app.get('/', (req, res) => {
    res.send(`
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Extra Set of Mitts API</title>
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
            <style>
                body {
                    font-family: 'Inter', sans-serif;
                    line-height: 1.6;
                    max-width: 800px;
                    margin: 0 auto;
                    padding: 2rem;
                    background-color: #f8f9fa;
                    color: #333;
                }
                .container {
                    background: white;
                    padding: 2rem;
                    border-radius: 8px;
                    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                }
                h1 {
                    color: #2563eb;
                    margin-bottom: 1rem;
                }
                .endpoint {
                    background: #f1f5f9;
                    padding: 1rem;
                    border-radius: 4px;
                    margin: 1rem 0;
                }
                .method {
                    display: inline-block;
                    padding: 0.25rem 0.5rem;
                    border-radius: 4px;
                    font-size: 0.875rem;
                    font-weight: 600;
                    margin-right: 0.5rem;
                }
                .get { background: #22c55e; color: white; }
                .post { background: #3b82f6; color: white; }
                .put { background: #f59e0b; color: white; }
                .delete { background: #ef4444; color: white; }
                .version {
                    font-size: 0.875rem;
                    color: #64748b;
                    margin-bottom: 2rem;
                }
            </style>
        </head>
        <body>
            <div class="container">
                <h1>Extra Set of Mitts API</h1>
                <div class="version">Version: 1.0.0 | Port: ${config.port}</div>
                
                <h2>Available Endpoints</h2>
                
                <div class="endpoint">
                    <span class="method post">POST</span>
                    <code>/api/v1/auth/signup</code>
                    <p>Register a new user account</p>
                </div>
                
                <div class="endpoint">
                    <span class="method post">POST</span>
                    <code>/api/v1/auth/signin</code>
                    <p>Authenticate existing user</p>
                </div>
                
                <div class="endpoint">
                    <span class="method get">GET</span>
                    <code>/api/v1/jobs</code>
                    <p>List all available cleaning jobs</p>
                </div>
                
                <div class="endpoint">
                    <span class="method post">POST</span>
                    <code>/api/v1/jobs</code>
                    <p>Create a new cleaning job</p>
                </div>

                <div class="endpoint">
                    <span class="method get">GET</span>
                    <code>/api/v1/profile</code>
                    <p>Get user profile information</p>
                </div>

                <p style="margin-top: 2rem; color: #64748b;">
                    For detailed API documentation and integration guides, please refer to our documentation.
                </p>
            </div>
        </body>
        </html>
    `);
});

// Error handling middleware
app.use((err, req, res, next) => {
    console.error(err.stack);
    res.status(500).json({ message: 'Something went wrong!' });
});

// Start server
const PORT = config.port;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
    console.log(`API Documentation available at http://localhost:${PORT}`);
}); 