import { PrismaClient } from "@prisma/client/edge";

const globalForPrisma = globalThis as unknown as { prismaEdge?: PrismaClient };

export const prismaEdge = globalForPrisma.prismaEdge ?? new PrismaClient();

if (process.env.NODE_ENV !== "production") {
  globalForPrisma.prismaEdge = prismaEdge;
}


