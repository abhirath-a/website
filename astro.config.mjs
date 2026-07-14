import { defineConfig } from "astro/config";
import tailwindcss from "@tailwindcss/vite";

// https://astro.build/config
export default defineConfig({
  integrations: [],
  prefetch: true,
  markdown: {
    syntaxHighlight: "shiki",
    shikiConfig: {
      theme: "kanagawa-dragon",
      wrap: true,
      transformers: [],
    },
  },
  vite: {
    plugins: [tailwindcss()],
  },
});
