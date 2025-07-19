import { Router} from "express";
import * as PostsController from "../controllers/posts.controller";

const router = Router();

router.get('/', PostsController.getAllPosts);
router.post('/:id', PostsController.deleteAPost);

export default router;