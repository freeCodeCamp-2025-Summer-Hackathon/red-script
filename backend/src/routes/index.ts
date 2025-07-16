import { Router } from "express";
import auth from "./auth.routes";
import users from "./user.routes";
import skillsRouter from "./skills.routes";

const router = Router();
router.use("/auth", auth);
router.use("/users", users);
router.use("/skills", skillsRouter);

export default router;
