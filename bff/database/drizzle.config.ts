// https://orm.drizzle.team/docs/drizzle-config-file
import { defineConfig } from "drizzle-kit";

export default defineConfig({
  dialect: "postgresql",
  out: "./drizzle",
  schema: "./drizzle",
  schemaFilter: [
    "public",
    "internal",
    "auth"
  ],
  dbCredentials: {
    url:
      process.env.POSTGRES_URL ??
      (() => {
        throw new Error("POSTGRES_URL is not set");
      })(),
  },
});
