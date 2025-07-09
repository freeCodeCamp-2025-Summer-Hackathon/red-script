import { Router } from "express";
import { validate } from "../middlewares/validate";
import { loginSchema, registerSchema } from "./schemas/auth.schemas";
import * as AuthController from "../controllers/auth.controller";

const router = Router();

router.post("/login", validate(loginSchema), AuthController.login);
router.post("/register", validate(registerSchema), AuthController.register);

export default router;
