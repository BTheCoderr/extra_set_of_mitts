const express = require('express');
const router = express.Router();
const { auth } = require('../middleware/auth.middleware');
const {
    createJob,
    getJobs,
    getJob,
    updateJob,
    startJob,
    completeJob,
    getEarningsSummary
} = require('../controllers/jobs.controller');

// All routes require authentication
router.use(auth);

// Job routes
router.post('/', createJob);
router.get('/', getJobs);
router.get('/earnings', getEarningsSummary);
router.get('/:id', getJob);
router.patch('/:id', updateJob);
router.post('/:id/start', startJob);
router.post('/:id/complete', completeJob);

module.exports = router; 