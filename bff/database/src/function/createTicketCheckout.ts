import { sql } from "drizzle-orm";
import type { getDatabase } from "..";

export async function createTicketCheckout(
	db: ReturnType<typeof getDatabase>,
	userId: string,
	ticketTypeId: string,
	ticketOptionIds: string[],
	stripeCheckoutSessionId: string,
	stripeCheckoutUrl: string,
) {
	const ticketCheckout = await db.execute<{
		id: string;
	}>(
		sql`SELECT create_ticket_checkout(${userId}, ${ticketTypeId}, ${ticketOptionIds}, ${stripeCheckoutSessionId}, ${stripeCheckoutUrl})`,
	);
	return ticketCheckout.rows[0];
}
