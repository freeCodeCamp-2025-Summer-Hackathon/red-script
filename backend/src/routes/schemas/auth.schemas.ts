import { z } from "zod";

const email = z.string().email();
const pwd   = z.string().min(8, "Password must be ≥ 8 chars");

const lat = z.number().min(-90).max(90);
const lng = z.number().min(-180).max(180);

const tzOff = z
  .number()
  .int()
  .min(-720)
  .max( 840);

const short = (min = 1, max = 100) => z.string().min(min).max(max);

export const registerSchema = z.object({
  email,
  password: pwd,
  username: short(3, 30),
  fullName: short(1, 100),

  timezoneOffset: tzOff,
  zip:   short(1, 20),
  city:  short(1, 100),
  state: short(1, 100),
  country: z.number().int(),

  latitude:  lat.optional(),
  longitude: lng.optional(),
});

export const loginSchema = z.object({
  email,
  password: z.string().min(1),
});

export type RegisterDTO = z.infer<typeof registerSchema>;
export type LoginDTO    = z.infer<typeof loginSchema>;
