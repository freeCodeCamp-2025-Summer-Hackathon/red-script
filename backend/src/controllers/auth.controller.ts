import { Request, Response } from "express";
import * as AuthService from "../services/auth.service";

export async function register(req: Request, res: Response) {
  const token = await AuthService.register(req.body);
  res.status(201).json({ token });
}

export async function login(req: Request, res: Response) {
  const { email, password } = req.body;
  const token = await AuthService.login(email, password);
  res.json({ token });
}
