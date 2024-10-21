import { Router } from 'express';
import { create, read, readByDate } from "../controllers/duoMatch";

const router = Router();

router.post('/', create);

router.get('/date/:startDate/:endDate', readByDate);

router.get('/', read);

export default router;