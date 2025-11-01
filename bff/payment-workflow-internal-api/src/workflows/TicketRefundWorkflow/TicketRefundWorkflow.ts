import {
	WorkflowEntrypoint,
	type WorkflowEvent,
	type WorkflowStep,
} from "cloudflare:workers";
import { databaseSchema, eq, getDatabase } from "@2025/database";
import * as v from "valibot";
import { TicketRefundWorkflowParam } from "./TicketRefundWorkflowParam";

export class TicketRefundWorkflow extends WorkflowEntrypoint<
	Cloudflare.Env,
	TicketRefundWorkflowParam
> {
	async run(
		event: WorkflowEvent<TicketRefundWorkflowParam>,
		step: WorkflowStep,
	) {
		console.log(`Start refund workflow:`);
		const parameter = v.parse(TicketRefundWorkflowParam, event.payload);

		// ticket_purchaseを取得
		const ticketPurchase = await step.do("get_ticket_purchase", async () => {
			const db = getDatabase(this.env.HYPERDRIVE.connectionString);
			const result = await db.query.ticketPurchases.findFirst({
				where: eq(databaseSchema.ticketPurchases.id, parameter.ticketPurchaseId),
			});
			if (result === undefined) {
				throw new Error("Ticket purchase not found");
			}
			return result;
		});

		// 既にrefundedステータスの場合はスキップ（冪等性）
		if (ticketPurchase.status === "refunded") {
			console.log("Ticket purchase is already refunded. Skipping refund.");
			return {
				ticketPurchaseId: parameter.ticketPurchaseId,
				status: "already_refunded",
				message: "Ticket purchase was already refunded",
			};
		}

		// Stripe APIで返金処理を実行
		const refundResult = await step.do("refund_stripe_payment", async () => {
			if (!ticketPurchase.stripePaymentIntentId) {
				throw new Error("Stripe payment intent ID not found");
			}

			const response = await fetch(
				`${this.env.STRIPE_INTERNAL_API_URL}/internal/payment/refund`,
				{
					method: "POST",
					headers: {
						"Content-Type": "application/json",
						"x-api-key": this.env.X_API_KEY,
					},
					body: JSON.stringify({
						payment_intent_id: ticketPurchase.stripePaymentIntentId,
					}),
				},
			);

			if (!response.ok) {
				const errorData = await response.json();
				throw new Error(
					`Failed to refund payment: ${JSON.stringify(errorData)}`,
				);
			}

			return await response.json();
		});

		console.log("Refund result:", refundResult);

		// ticket_purchaseのステータスをrefundedに更新
		const updatedTicketPurchase = await step.do(
			"update_ticket_purchase_status",
			async () => {
				const db = getDatabase(this.env.HYPERDRIVE.connectionString);
				const result = await db
					.update(databaseSchema.ticketPurchases)
					.set({
						status: "refunded",
						updatedAt: new Date().toISOString(),
					})
					.where(
						eq(databaseSchema.ticketPurchases.id, parameter.ticketPurchaseId),
					)
					.returning();

				if (result.length === 0) {
					throw new Error("Failed to update ticket purchase status");
				}

				return result[0];
			},
		);

		console.log("Updated ticket purchase:", updatedTicketPurchase);

		// TODO(YumNumm): Emailを送信する
		// TODO(YumNumm): FCMで通知を送信する

		return {
			ticketPurchaseId: parameter.ticketPurchaseId,
			status: "refunded",
			refundResult,
		};
	}
}
