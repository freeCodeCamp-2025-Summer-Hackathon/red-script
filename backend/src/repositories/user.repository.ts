import { prisma } from "../config/prisma";
import { Prisma } from "../../generated/prisma";

export const UserRepository = {
  findByEmail: (email: string) => prisma.users.findUnique({ where: { email } }),

  findByEmailOrUsername: (email: string, username: string) =>
    prisma.users.findFirst({
      where: { OR: [{ email }, { username }] },
    }),

  create: (data: Prisma.UsersCreateInput) => prisma.users.create({ data }),

  list: () =>
    prisma.users.findMany({
      select: { id: true, email: true, username: true, fullName: true },
    }),
};
