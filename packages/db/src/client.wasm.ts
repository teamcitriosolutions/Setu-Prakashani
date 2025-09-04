import { PrismaClient } from "@prisma/client/wasm";

const globalForPrisma = globalThis as unknown as { prismaWasm?: PrismaClient };

export const prismaWasm = globalForPrisma.prismaWasm ?? new PrismaClient();

if (process.env.NODE_ENV !== "production") {
  globalForPrisma.prismaWasm = prismaWasm;
}