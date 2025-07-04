import "dotenv/config";
import { z } from "zod";

const schema = z.object({
  PORT: z.string().default("4000"),
  FRONTEND_PORT: z.string().default("3000"),
  JWT_SECRET: z.string(),
});

export const env = schema.parse(process.env);