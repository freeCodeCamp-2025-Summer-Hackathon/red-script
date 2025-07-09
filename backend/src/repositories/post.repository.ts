import { prisma } from "../config/prisma";
import { Prisma } from "../../generated/prisma";

export const PostRepository = {
  create: (data: Prisma.PostsCreateInput) => {
    return prisma.posts.create({ data });
  },
  delete: (id: number) => {
    return prisma.posts.delete({
      where: { id },
    });
  },
  update: (id: number, data: Prisma.PostsUpdateInput) => {
    return prisma.posts.update({
      where: { id },
      data,
    });
  },
  findById: (id: number) => {
    return prisma.posts.findUnique({
      where: { id },
    });
  },
  findAll: () => {
    return prisma.posts.findMany({
      include: {
        user: true,
        type: true,
        tags: true,
      },
    });
  },
};
