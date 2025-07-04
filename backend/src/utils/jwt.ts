import jwt from "jsonwebtoken";
import { env } from "../config/env";

export const sign = (payload: object) =>
  jwt.sign(payload, env.JWT_SECRET, { expiresIn: "1h" });

export const verify = <T>(token: string) =>
  jwt.verify(token, env.JWT_SECRET) as T;