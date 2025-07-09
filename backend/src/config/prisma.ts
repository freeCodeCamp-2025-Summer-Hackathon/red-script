// This file is meant to help us avoid issues related to hot-reloading
import { PrismaClient } from "../../generated/prisma";

declare global {
  var prisma: PrismaClient | undefined;
}

export const prisma =
  global.prisma ||
  new PrismaClient({
    log: ["query", "error", "info"],
  });
