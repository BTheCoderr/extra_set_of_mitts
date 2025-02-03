const Job = require('../models/job.model');

// Create a new job
const createJob = async (req, res) => {
    try {
        const job = new Job({
            ...req.body,
            cleaner: req.user._id // Assign job to current user
        });
        await job.save();
        res.status(201).json(job);
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
};

// Get all jobs for a cleaner
const getJobs = async (req, res) => {
    try {
        const match = { cleaner: req.user._id };
        const sort = { 'schedule.date': -1 };

        // Filter by status if provided
        if (req.query.status) {
            match.status = req.query.status;
        }

        // Filter by date range
        if (req.query.startDate && req.query.endDate) {
            match['schedule.date'] = {
                $gte: new Date(req.query.startDate),
                $lte: new Date(req.query.endDate)
            };
        }

        const jobs = await Job.find(match).sort(sort);
        res.json(jobs);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Get a specific job
const getJob = async (req, res) => {
    try {
        const job = await Job.findOne({
            _id: req.params.id,
            cleaner: req.user._id
        });

        if (!job) {
            return res.status(404).json({ message: 'Job not found' });
        }

        res.json(job);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Update job status and details
const updateJob = async (req, res) => {
    const updates = Object.keys(req.body);
    const allowedUpdates = ['status', 'tasks', 'notes', 'photos'];
    const isValidOperation = updates.every(update => allowedUpdates.includes(update));

    if (!isValidOperation) {
        return res.status(400).json({ message: 'Invalid updates' });
    }

    try {
        const job = await Job.findOne({
            _id: req.params.id,
            cleaner: req.user._id
        });

        if (!job) {
            return res.status(404).json({ message: 'Job not found' });
        }

        updates.forEach(update => job[update] = req.body[update]);
        await job.save();

        res.json(job);
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
};

// Start a job
const startJob = async (req, res) => {
    try {
        const job = await Job.findOne({
            _id: req.params.id,
            cleaner: req.user._id,
            status: 'pending'
        });

        if (!job) {
            return res.status(404).json({ message: 'Job not found or cannot be started' });
        }

        job.status = 'in_progress';
        job.startTime = new Date();
        await job.save();

        res.json(job);
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
};

// Complete a job
const completeJob = async (req, res) => {
    try {
        const job = await Job.findOne({
            _id: req.params.id,
            cleaner: req.user._id,
            status: 'in_progress'
        });

        if (!job) {
            return res.status(404).json({ message: 'Job not found or cannot be completed' });
        }

        // Verify all required tasks are completed
        const incompleteTasks = job.tasks.filter(task => !task.completed);
        if (incompleteTasks.length > 0) {
            return res.status(400).json({ 
                message: 'All tasks must be completed',
                incompleteTasks: incompleteTasks.map(task => task.name)
            });
        }

        job.status = 'completed';
        job.endTime = new Date();
        await job.save();

        res.json(job);
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
};

// Get earnings summary
const getEarningsSummary = async (req, res) => {
    try {
        const startDate = new Date(req.query.startDate || new Date().setDate(1)); // First day of current month
        const endDate = new Date(req.query.endDate || new Date());

        const completedJobs = await Job.find({
            cleaner: req.user._id,
            status: 'completed',
            'schedule.date': {
                $gte: startDate,
                $lte: endDate
            }
        });

        const summary = {
            totalEarnings: 0,
            totalHours: 0,
            jobCount: completedJobs.length,
            averageHourlyRate: 0
        };

        completedJobs.forEach(job => {
            summary.totalEarnings += job.payment.amount;
            summary.totalHours += job.schedule.duration;
        });

        summary.averageHourlyRate = summary.totalHours > 0 
            ? summary.totalEarnings / summary.totalHours 
            : 0;

        res.json(summary);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

module.exports = {
    createJob,
    getJobs,
    getJob,
    updateJob,
    startJob,
    completeJob,
    getEarningsSummary
}; 