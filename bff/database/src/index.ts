import { drizzle } from "drizzle-orm/node-postgres";

export * from "drizzle-orm";
export * from "drizzle-orm/node-postgres";
export { drizzle } from "drizzle-orm/node-postgres";
export * from "./function/createTicketCheckout";
export * from "./function/getTicketCount";
export * from "./function/getTicketOptionCount";
import * as relations from "../drizzle/relations";
import * as schema from "../drizzle/schema";


export const databaseSchema = {
  ...relations,
  ...schema,
};

export function getDatabase(postgresUrl: string) {
  const db = drizzle(postgresUrl, { schema: databaseSchema, logger: true });
  return db;
}
