import * as relations from "../drizzle/relations";
import * as schema from "../drizzle/schema";

export const databaseSchema = {
  ...relations,
  ...schema,
};
