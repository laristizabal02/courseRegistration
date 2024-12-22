import apiRoutes from './api/index.js';
import express from 'express';
import authRoutes from './auth-routes.js';
import { authenticateToken } from '../middleware/auth.js';
const router = express.Router();
router.use('/auth', authRoutes);
router.use('/api', authenticateToken, apiRoutes);
export default router;
