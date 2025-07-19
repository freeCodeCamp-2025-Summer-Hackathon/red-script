import { Router} from "express";
import PostsController from "../controllers/posts.controller";

const router = Router();

router.get('/', PostsController.getAllPosts);

export default router;