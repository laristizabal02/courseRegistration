import { Router } from 'express';
import { userRouter } from './user-routes.js';
import { coursesRouter } from './coursesRoutes.js';
import { studentRouter } from './studentRoutes.js';

const router = Router();

router.use('/users', userRouter);
router.use('/courses', coursesRouter);
router.use('/students', studentRouter);

export default router;
