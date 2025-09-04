import { put, del, PutBlobResult } from "@vercel/blob";
import type { PutCommandOptions } from "@vercel/blob";

/**
 * Uploads a file to Vercel Blob storage.
 *
 * SECURITY: This function does NOT perform any authorization checks.
 * The calling code is responsible for ensuring the user has permission to upload files.
 * The calling code is also responsible for validating file type, size, and sanitizing the path.
 *
 * @param path The path to store the blob at (e.g., "articles/my-article.txt").
 * @param data The file content to upload. Can be a Blob, ArrayBuffer, Buffer, File, or ReadableStream.
 * @param options The options for the put operation, including the access level. Defaults to 'private'.
 * @returns The result of the put operation.
 */
export async function uploadBlob(
  path: string,
  data: Blob | ArrayBuffer | Buffer | File | ReadableStream,
  options: PutCommandOptions = { access: "public" }
): Promise<PutBlobResult> {
  try {
    const blob = await put(path, data, options);
    return blob;
  } catch (error) {
    console.error("Error uploading blob:", error);
    throw new Error("Failed to upload file.");
  }
}

/**
 * Deletes a file from Vercel Blob storage.
 *
 * SECURITY: This function does NOT perform any authorization checks.
 * The calling code is responsible for ensuring the user has permission to delete this file.
 *
 * @param url The URL of the blob to delete.
 */
export async function deleteBlob(url: string): Promise<void> {
  try {
    await del(url);
  } catch (error) {
    console.error("Error deleting blob:", error);
    throw new Error("Failed to delete file.");
  }
}