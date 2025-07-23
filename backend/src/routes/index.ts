import { Router } from "express";
import auth from "./auth.routes";
import users from "./user.routes";
import skillsRouter from "./skills.routes";
import postsRouter from "./posts.routes";

const router = Router();
router.use("/auth", auth);
router.use("/users", users);
router.use("/skills", skillsRouter);
router.use("/posts", postsRouter);

export default router;
