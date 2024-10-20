import { Router } from 'express';
import { create, read, update } from "../controllers/player";

const router = Router();

router.post('/', create);
  
router.get('/', read);

router.patch("/:id", update)

export default router;
