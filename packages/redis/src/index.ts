import { Redis } from "@upstash/redis";

// 1. Runtime validation of environment variables
const redisUrl = process.env.REDIS_URL;
const redisWriteToken = process.env.KV_REST_API_TOKEN;
const redisReadOnlyToken = process.env.KV_REST_API_READ_ONLY_TOKEN;

if (!redisUrl) {
  throw new Error("REDIS_URL environment variable not defined.");
}
if (!redisWriteToken) {
  throw new Error("KV_REST_API_TOKEN environment variable not defined.");
}
if (!redisReadOnlyToken) {
  // A warning is also an option if a read-only client is not always required.
  throw new Error(
    "KV_REST_API_READ_ONLY_TOKEN environment variable not defined.",
  );
}

/**
 * A Redis client with read and write permissions.
 *
 * Use this client for operations that modify data (e.g., SET, DEL, HSET).
 * For read-only operations, prefer the `redisReadOnly` client to enforce
 * the principle of least privilege.
 */
export const redis = new Redis({
  url: redisUrl,
  token: redisWriteToken,
});

/**
 * A Redis client with read-only permissions.
 *
 * Use this client for operations that only read data (e.g., GET, HGET, SMEMBERS).
 * This prevents accidental data modification and reduces the application's attack surface.
 */
export const redisReadOnly = new Redis({
  url: redisUrl,
  token: redisReadOnlyToken,
});