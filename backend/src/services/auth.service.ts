import { UserRepository } from "../repositories/user.repository";
import { hash, compare } from "../utils/hash";
import { sign } from "../utils/jwt";
import { RegisterDTO } from "../routes/schemas/auth.schemas";
import { randomUUID } from "crypto";
import { AppError } from "../errors/AppError";
import { prismaToApp } from "../errors/prismaToApp";

export async function register(data: RegisterDTO) {
  const {
    email,
    password: rawPwd,
    username,
    fullName,
    ...rest
  } = data;

  if (await UserRepository.findByEmailOrUsername(email, username))
    throw new AppError(400, "Credentials invalid");

  try {
    const user = await UserRepository.create({
      guid: randomUUID(),
      email,
      username,
      fullName,
      password: await hash(rawPwd),
      isActive: true,
      ...rest,
    });

    return sign({ id: user.id, email: user.email });
  } catch (err) {
    throw prismaToApp(err);
  }
}

export async function login(email: string, rawPwd: string) {
  const user = await UserRepository.findByEmail(email);

  if (!user || !(await compare(rawPwd, user.password)))
    throw new AppError(400, "Credentials invalid");

  return sign({ id: user.id, email: user.email });
}
