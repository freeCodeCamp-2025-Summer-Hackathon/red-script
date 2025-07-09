import { Router } from "express";
import auth from "./auth.routes";
import users from "./user.routes";

const router = Router();
router.use("/auth", auth);
router.use("/users", users);

export default router;
