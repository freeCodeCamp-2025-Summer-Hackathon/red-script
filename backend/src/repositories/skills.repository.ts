import { prisma } from "../config/prisma";

const findAll = async () => {
  return await prisma.skills.findMany({
    select: {
      guid: true,
      name: true,
    },
  });
};

export default { findAll };
