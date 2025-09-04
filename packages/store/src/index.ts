import { create } from "zustand";
import { persist, createJSONStorage } from "zustand/middleware";

export type User = {
  id: string;
  name: string;
  email: string;
  imageUrl?: string;
  roles?: string[];
};

type UserStoreState = {
  currentUser: User | null;
  setCurrentUser: (user: User | null) => void;
  clear: () => void;
};

/**
 * A persistent store for the current user's state.
 *
 * NOTE: This is client-side state and should NEVER be trusted for authorization.
 * Always verify user permissions on the server.
 */
export const useUserStore = create<UserStoreState>()(
  persist(
    (set) => ({
      currentUser: null,
      setCurrentUser: (user) => set({ currentUser: user }),
      clear: () => set({ currentUser: null }),
    }),
    {
      name: "user-session-storage", // unique name for the storage item
      storage: createJSONStorage(() => sessionStorage), // use sessionStorage
    },
  ),
);

export type { UserStoreState };