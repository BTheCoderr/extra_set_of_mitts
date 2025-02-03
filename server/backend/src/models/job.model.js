const mongoose = require('mongoose');

const jobSchema = new mongoose.Schema({
    customer: {
        name: {
            type: String,
            required: true
        },
        address: {
            street: String,
            city: String,
            state: String,
            zipCode: String
        },
        notes: String
    },
    cleaner: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
        required: true
    },
    schedule: {
        date: {
            type: Date,
            required: true
        },
        startTime: {
            type: String,
            required: true
        },
        endTime: {
            type: String,
            required: true
        },
        duration: {
            type: Number,  // in hours
            required: true
        }
    },
    status: {
        type: String,
        enum: ['pending', 'in_progress', 'completed', 'cancelled'],
        default: 'pending'
    },
    payment: {
        amount: {
            type: Number,
            required: true
        },
        status: {
            type: String,
            enum: ['pending', 'completed'],
            default: 'pending'
        },
        hourlyRate: {
            type: Number,
            required: true
        }
    },
    tasks: [{
        name: {
            type: String,
            required: true
        },
        completed: {
            type: Boolean,
            default: false
        },
        notes: String
    }],
    photos: [{
        url: String,
        type: {
            type: String,
            enum: ['before', 'after'],
            required: true
        },
        timestamp: {
            type: Date,
            default: Date.now
        }
    }],
    requiresKey: {
        type: Boolean,
        default: false
    },
    notes: String,
    rating: {
        score: {
            type: Number,
            min: 1,
            max: 5
        },
        comment: String,
        timestamp: Date
    }
}, {
    timestamps: true
});

// Index for efficient queries
jobSchema.index({ 'schedule.date': 1, 'cleaner': 1 });
jobSchema.index({ status: 1 });

const Job = mongoose.model('Job', jobSchema);

module.exports = Job; 