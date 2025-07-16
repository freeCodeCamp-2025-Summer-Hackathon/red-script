import { Request, Response } from 'express';
import SkillsService from '../services/skills.service';

const getAllSkills = async (req: Request, res: Response) => {
  try {
    const skills = await SkillsService.getAllSkills();
    res.json(skills);
  } catch (error) {
    res.status(500).json({ message: 'Something went wrong' });
  }
};

export default { getAllSkills };
