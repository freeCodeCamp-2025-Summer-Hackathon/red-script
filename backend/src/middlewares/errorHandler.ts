import { ErrorRequestHandler } from "express";
import { AppError } from "../errors/AppError";
import { prismaToApp } from "../errors/prismaToApp";
import { zodToApp } from "../errors/zodToApp";

export const errorHandler: ErrorRequestHandler = (err, _req, res, _next): void => {
  err = prismaToApp(zodToApp(err));

  if (err instanceof AppError) {
    res.status(err.status).json({ message: err.message });
    return;
  }

  console.error(err);
  res.status(500).json({ message: "Internal server error" });
};
