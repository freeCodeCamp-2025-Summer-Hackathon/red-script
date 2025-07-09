import { ZodError } from "zod";
import { AppError } from "./AppError";

export const zodToApp = (err: unknown): unknown =>
  err instanceof ZodError ? new AppError(400, "Validation failed") : err;