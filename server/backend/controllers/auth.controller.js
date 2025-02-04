const jwt = require('jsonwebtoken');
const User = require('../models/user.model');
const config = require('../config/config');

// Generate JWT token
const generateToken = (userId) => {
    return jwt.sign({ userId }, config.jwtSecret, { expiresIn: '7d' });
};

// Register new user
const register = async (req, res) => {
    try {
        const { email, password, name, address } = req.body;

        // Check if user already exists
        const existingUser = await User.findOne({ email });
        if (existingUser) {
            return res.status(400).json({ message: 'Email already registered' });
        }

        // Create new user
        const user = new User({
            email,
            password,
            name,
            address
        });

        await user.save();

        // Generate token
        const token = generateToken(user._id);

        res.status(201).json({
            token,
            user: {
                id: user._id,
                email: user.email,
                name: user.name,
                role: user.role
            }
        });
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
};

// Login user
const login = async (req, res) => {
    try {
        const { email, password } = req.body;

        // Find user
        const user = await User.findOne({ email });
        if (!user) {
            return res.status(401).json({ message: 'Invalid credentials' });
        }

        // Check password
        const isMatch = await user.comparePassword(password);
        if (!isMatch) {
            return res.status(401).json({ message: 'Invalid credentials' });
        }

        // Generate token
        const token = generateToken(user._id);

        res.json({
            token,
            user: {
                id: user._id,
                email: user.email,
                name: user.name,
                role: user.role
            }
        });
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
};

// Get current user profile
const getProfile = async (req, res) => {
    try {
        const user = await User.findById(req.user._id).select('-password');
        res.json(user);
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
};

// Update user profile
const updateProfile = async (req, res) => {
    const updates = Object.keys(req.body);
    const allowedUpdates = ['name', 'email', 'password', 'address'];
    const isValidOperation = updates.every(update => allowedUpdates.includes(update));

    if (!isValidOperation) {
        return res.status(400).json({ message: 'Invalid updates' });
    }

    try {
        updates.forEach(update => req.user[update] = req.body[update]);
        await req.user.save();
        
        const user = req.user.toObject();
        delete user.password;
        
        res.json(user);
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
};

module.exports = {
    register,
    login,
    getProfile,
    updateProfile
}; 