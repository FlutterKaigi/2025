import { sql } from "drizzle-orm";
import type { NodePgDatabase } from "drizzle-orm/node-postgres";
import type { getDatabase } from "..";

export async function getTicketCount(
  db: ReturnType<typeof getDatabase>,
  ticketTypeId: string
) {
  const ticketCount = await db.execute<{
    sold_count: number;
    reserved_count: number;
  }>(sql`SELECT get_ticket_count(${ticketTypeId})`);
  return ticketCount.rows[0];
}
