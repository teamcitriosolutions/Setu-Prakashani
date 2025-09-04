import { Client, type Schedule } from "@upstash/qstash";
import { verifySignatureAppRouter } from "@upstash/qstash/nextjs";
import type { NextRequest, NextResponse } from "next/server";

export const qstash = new Client({
  token: process.env.QSTASH_TOKEN!,
});

export type QStashPublishOptions = {
  url: string;
  body?: unknown;
  headers?: Record<string, string>;
  delay?: number | `${bigint}s` | `${bigint}m` | `${bigint}h` | `${bigint}d`;
};

/**
 * Publishes a message to QStash.
 *
 * SECURITY: The calling code is responsible for validating the URL to prevent SSRF vulnerabilities
 * and ensuring the user is authorized to publish the message.
 *
 * @param options - The options for publishing the message.
 * @returns The result of the publish operation.
 */
export async function publishMessage(options: QStashPublishOptions) {
  const { url, body, headers, delay } = options;
  try {
    return await qstash.publishJSON({
      url,
      body,
      headers,
      delay,
    });
  } catch (error) {
    console.error("Error publishing message to QStash:", error);
    throw new Error("Failed to publish message.");
  }
}

/**
 * Creates a new schedule in QStash.
 *
 * SECURITY: The calling code is responsible for validating the destination URL to prevent SSRF vulnerabilities
 * and ensuring the user is authorized to create the schedule.
 *
 * @param options - The options for the schedule, including the cron expression.
 * @returns The created schedule.
 */
export async function scheduleMessage(
  options: QStashPublishOptions & { cron: string },
): Promise<Schedule> {
  const { url, body, headers, cron } = options;
  try {
    const { scheduleId } = await qstash.schedules.create({
      destination: url,
      body: JSON.stringify(body),
      headers: {
        "Content-Type": "application/json",
        ...headers,
      },
      cron,
    });

    const schedule = await qstash.schedules.get(scheduleId);
    if (!schedule) {
      throw new Error(`Failed to retrieve created schedule with ID: ${scheduleId}`);
    }
    return schedule;
  } catch (error) {
    console.error("Error creating QStash schedule:", error);
    throw new Error("Failed to create schedule.");
  }
}

/**
 * Wraps a Next.js API route handler to verify the request signature from QStash.
 *
 * Use this to protect any endpoint that is called by QStash.
 *
 * @param handler The Next.js API route handler to wrap.
 * @returns A new handler that first verifies the signature before executing the original handler.
 */
export function verifyRequest(
  handler: (req: NextRequest) => Promise<NextResponse> | NextResponse,
) {
  return verifySignatureAppRouter(handler);
}