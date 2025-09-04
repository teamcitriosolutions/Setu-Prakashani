"use client";

import React from "react";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";

// Factory function to create a new QueryClient instance
function makeQueryClient() {
  return new QueryClient({
    defaultOptions: {
      queries: {
        // Your default options
        staleTime: 1000 * 30, // 30 seconds
        gcTime: 1000 * 60 * 10, // 10 minutes
        retry: 1,
        refetchOnWindowFocus: false,
      },
    },
  });
}

// Singleton client for client-side use
let browserQueryClient: QueryClient | undefined = undefined;

export type QueryProviderProps = {
  children: React.ReactNode;
};

/**
 * Provides a TanStack Query client to its children.
 *
 * In Server-Side Rendering (SSR) contexts, a new client is created for each request
 * to prevent data leakage between users.
 * In the browser, a single client is reused across the application lifecycle.
 */
export function QueryProvider({ children }: QueryProviderProps) {
  // On the server, always create a new client.
  // On the client, create a new client once and reuse it.
  const queryClient =
    typeof window === "undefined"
      ? makeQueryClient()
      : (browserQueryClient ??= makeQueryClient());

  return <QueryClientProvider client={queryClient}>{children}</QueryClientProvider>;
}

// It's often better to export the provider and hooks, but not the client itself,
// to prevent accidental misuse. If you need the client instance, use the hook.
// export { QueryClient };