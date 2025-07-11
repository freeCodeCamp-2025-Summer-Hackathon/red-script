import { Router } from "express";
import auth from "./auth.routes";
import users from "./user.routes";
import posts from "./post.routes";

const router = Router();
router.use("/auth", auth);
router.use("/users", users);
router.use("/posts", posts);

export default router;
