import { Router } from "express";
import { authGuard } from "../middlewares/authguard";
import * as PostController from "../controllers/post.controller";

const router = Router();

router.get("/", PostController.getAllPosts);
router.get("/:id", PostController.getPostById);

router.post("/", authGuard, PostController.createPost);
router.put("/:id", authGuard, PostController.updatePost);
router.delete("/:id", authGuard, PostController.deletePost);

export default router;
