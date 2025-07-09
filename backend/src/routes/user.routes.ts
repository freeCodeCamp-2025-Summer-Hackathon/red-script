import { Router } from "express";
import { authGuard } from "../middlewares/authguard";
import * as UserController from "../controllers/user.controller";

const router = Router();

router.get("/", authGuard, UserController.list);

export default router;
