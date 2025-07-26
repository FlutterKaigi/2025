import { drizzle } from "drizzle-orm/node-postgres";

export * from "drizzle-orm/node-postgres";

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
