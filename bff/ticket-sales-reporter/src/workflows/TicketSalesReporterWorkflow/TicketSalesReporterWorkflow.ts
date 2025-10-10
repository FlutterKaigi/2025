import {
	WorkflowEntrypoint,
	type WorkflowEvent,
	type WorkflowStep,
} from "cloudflare:workers";
import { databaseSchema, getDatabase } from "@2025/database";
import { eq, isNotNull } from "drizzle-orm";
import type { TicketSalesReporterWorkflowParams } from "./TicketSalesReporterWorkflowParams";

function getProgressBarText(current: number, max: number): string {
	const percentage = Math.round((current / max) * 100);
	const barLength = 20;
	const filledLength = Math.round((barLength * current) / max);
	const bar = "█".repeat(filledLength) + "░".repeat(barLength - filledLength);

	return `${bar} ${current}/${max} (${percentage}%)`;
}

export class TicketSalesReporterWorkflow extends WorkflowEntrypoint<
	Cloudflare.Env,
	TicketSalesReporterWorkflowParams | undefined
> {
	async run(
		event: WorkflowEvent<TicketSalesReporterWorkflowParams | undefined>,
		step: WorkflowStep,
	) {
		const params = event.payload;
		const allSales = await step.do("get_all_sales", async () => {
			const db = getDatabase(this.env.HYPERDRIVE.connectionString);
			const sales = await db
				.select({
					ticketTypeName: databaseSchema.ticketTypes.name,
					soldCount: databaseSchema.vTicketCounts.soldCount,
					maxQuantity: databaseSchema.ticketTypes.maxQuantity,
					isActive: databaseSchema.ticketTypes.isActive,
				})
				.from(databaseSchema.ticketTypes)
				.leftJoin(
					databaseSchema.vTicketCounts,
					eq(
						databaseSchema.ticketTypes.id,
						databaseSchema.vTicketCounts.ticketTypeId,
					),
				)
				.orderBy(
					databaseSchema.ticketTypes.isActive,
					databaseSchema.ticketTypes.createdAt,
				);

			return sales;
		});

		const allOptionSales = await step.do("get_all_option_sales", async () => {
			const db = getDatabase(this.env.HYPERDRIVE.connectionString);

			// v_ticket_option_countsビューを使用してチケットオプションの販売数を1つのクエリで取得
			const optionSalesWithCounts = await db
				.select({
					optionId: databaseSchema.ticketOptions.id,
					optionName: databaseSchema.ticketOptions.name,
					ticketTypeName: databaseSchema.ticketTypes.name,
					maxQuantity: databaseSchema.ticketOptions.maxQuantity,
					soldCount: databaseSchema.vTicketOptionCounts.soldCount,
					isActive: databaseSchema.ticketTypes.isActive,
				})
				.from(databaseSchema.ticketOptions)
				.leftJoin(
					databaseSchema.ticketTypes,
					eq(
						databaseSchema.ticketOptions.ticketTypeId,
						databaseSchema.ticketTypes.id,
					),
				)
				.leftJoin(
					databaseSchema.vTicketOptionCounts,
					eq(
						databaseSchema.ticketOptions.id,
						databaseSchema.vTicketOptionCounts.ticketOptionId,
					),
				)
				.where(isNotNull(databaseSchema.ticketOptions.id))
				.orderBy(
					databaseSchema.ticketTypes.isActive,
					databaseSchema.ticketOptions.createdAt,
				);

			return optionSalesWithCounts;
		});

		await step.do("send_slack_message", async () => {
			const slackWebhookUrl = params?.webhookUrl || this.env.SLACK_WEBHOOK_URL;

			// アクティブとインアクティブで分離
			const activeSales = allSales.filter((sale) => sale.isActive);
			const inactiveSales = allSales.filter((sale) => !sale.isActive);

			// チケットオプション用のデータ整理
			const optionsByTicketType: Record<
				string,
				Array<(typeof allOptionSales)[number]>
			> = {};
			for (const option of allOptionSales) {
				const ticketTypeName = option.ticketTypeName ?? "";
				if (!optionsByTicketType[ticketTypeName]) {
					optionsByTicketType[ticketTypeName] = [];
				}
				optionsByTicketType[ticketTypeName].push(option);
			}

			// 販売状況に応じて色を決定する関数
			const getColorBySalesRatio = (
				soldCount: number,
				maxCount: number,
			): string => {
				if (maxCount === 0) return "#808080";
				const salesRatio = soldCount / maxCount;
				if (salesRatio >= 0.9) return "#dc3545";
				if (salesRatio >= 0.7) return "#ffc107";
				return "#28a745";
			};

			// チケットタイプ情報を作成する関数
			const createTicketAttachment = (sale: (typeof allSales)[number]) => {
				const soldCount = sale.soldCount || 0;
				const maxCount = sale.maxQuantity || 0;
				const relatedOptions = optionsByTicketType[sale.ticketTypeName] || [];

				// メインのチケット情報
				let text = `*${sale.ticketTypeName}*\n`;
				if (sale.soldCount !== null) {
					text += getProgressBarText(soldCount, maxCount);
				} else {
					text += "販売データなし";
				}

				// オプション情報を追加
				if (relatedOptions.length > 0) {
					text += "\n\n*オプション:*";
					relatedOptions.forEach((option) => {
						const optionSoldCount = option.soldCount || 0;
						const maxQuantity = option.maxQuantity;

						text += `\n• ${option.optionName}`;
						if (maxQuantity && maxQuantity > 0) {
							text += `\n  ${getProgressBarText(optionSoldCount, maxQuantity)}`;
						} else {
							text += `\n  ${optionSoldCount}枚 販売済み`;
						}
					});
				}

				// 販売終了のチケットは専用の色を使用
				const color = sale.isActive
					? getColorBySalesRatio(soldCount, maxCount)
					: "#6c757d"; // グレー色で販売終了を表現

				return {
					color: color,
					text: text,
					mrkdwn_in: ["text"],
				};
			};

			// アクティブなチケットのattachments
			const activeAttachments = activeSales.map(createTicketAttachment);

			// インアクティブなチケットのattachments（存在する場合のみ）
			const inactiveAttachments =
				inactiveSales.length > 0
					? [
							{
								color: "#6c757d",
								text: "*販売終了・停止中のチケット*",
								mrkdwn_in: ["text"],
							},
							...inactiveSales.map(createTicketAttachment),
						]
					: [];

			const attachments = [...activeAttachments, ...inactiveAttachments];

			const dateTime = new Date().toLocaleString("ja-JP", {
				timeZone: "Asia/Tokyo",
			});
			const json = {
				response_type: "in_channel",
				text: "チケット販売状況",
				attachments: [
					{
						color: "#2F2F2FFF",
						text: `\`${dateTime}\``,
						mrkdwn_in: ["text"],
					},
					...attachments,
				],
			};

			await fetch(slackWebhookUrl, {
				method: "POST",
				body: JSON.stringify(json),
				headers: {
					"Content-Type": "application/json",
				},
			});
		});
	}
}
