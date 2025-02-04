#!/bin/bash

# Exit on error
set -e

echo "🚀 Starting deployment process..."

# Load environment variables
if [ -f .env ]; then
    echo "Loading environment variables..."
    export $(cat .env | grep -v '^#' | xargs)
fi

# Install dependencies
echo "📦 Installing dependencies..."
npm install --production

# Run database migrations (if any)
if [ -f ./src/utils/migrate.js ]; then
    echo "🔄 Running database migrations..."
    node ./src/utils/migrate.js
fi

# Build process (if needed)
if [ "$NODE_ENV" = "production" ]; then
    echo "🏗️ Running build process..."
    npm run build
fi

# Run tests
if [ "$SKIP_TESTS" != "true" ]; then
    echo "🧪 Running tests..."
    npm test
fi

# Start the application
echo "🌟 Starting the application..."
if [ "$NODE_ENV" = "production" ]; then
    # Use PM2 in production
    pm2 restart ecosystem.config.js --env production
else
    # Use nodemon in development
    npm run dev
fi

echo "✅ Deployment completed successfully!" 