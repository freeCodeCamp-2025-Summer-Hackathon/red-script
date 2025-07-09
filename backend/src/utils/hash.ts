import bcrypt from "bcryptjs";

export const hash = (pwd: string) => bcrypt.hash(pwd, 10);
export const compare = (pwd: string, hash: string) => bcrypt.compare(pwd, hash);
