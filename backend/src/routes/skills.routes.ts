import { Router } from "express";
import skillsController from "../controllers/skills.controller"

const router = Router();

router.get('/', skillsController.getAllSkills)

export default router