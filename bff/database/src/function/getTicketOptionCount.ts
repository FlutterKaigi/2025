import { sql } from "drizzle-orm";
import type { getDatabase } from "..";

export async function getTicketOptionCount(
  db: ReturnType<typeof getDatabase>,
  ticketOptionId: string
) {
  const ticketOptionCount = await db.execute<{
    sold_count: number;
    reserved_count: number;
  }>(sql`SELECT get_ticket_option_count(${ticketOptionId})`);
  return ticketOptionCount.rows[0];
}
