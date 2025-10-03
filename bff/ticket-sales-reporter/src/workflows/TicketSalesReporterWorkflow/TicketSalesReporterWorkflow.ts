import {
  WorkflowEntrypoint,
  type WorkflowEvent,
  type WorkflowStep,
} from "cloudflare:workers";
import { databaseSchema, getDatabase } from "@2025/database";
import { and, eq, isNotNull } from "drizzle-orm";
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
    step: WorkflowStep
  ) {
    const params = event.payload;
    const sales = await step.do("get_sales", async () => {
      const db = getDatabase(this.env.HYPERDRIVE.connectionString);
      const sales = await db
        .select({
          ticketTypeName: databaseSchema.ticketTypes.name,
          soldCount: databaseSchema.vTicketCounts.soldCount,
          maxQuantity: databaseSchema.ticketTypes.maxQuantity,
        })
        .from(databaseSchema.ticketTypes)
        .leftJoin(
          databaseSchema.vTicketCounts,
          eq(
            databaseSchema.ticketTypes.id,
            databaseSchema.vTicketCounts.ticketTypeId
          )
        )
        .where(
          and(
            eq(databaseSchema.ticketTypes.isActive, true),
            isNotNull(databaseSchema.vTicketCounts.soldCount)
          )
        )
        .orderBy(databaseSchema.ticketTypes.createdAt);

      return sales;
    });

    const optionSales = await step.do("get_option_sales", async () => {
      const db = getDatabase(this.env.HYPERDRIVE.connectionString);

      // v_ticket_option_countsビューを使用してチケットオプションの販売数を1つのクエリで取得
      const optionSalesWithCounts = await db
        .select({
          optionId: databaseSchema.ticketOptions.id,
          optionName: databaseSchema.ticketOptions.name,
          ticketTypeName: databaseSchema.ticketTypes.name,
          maxQuantity: databaseSchema.ticketOptions.maxQuantity,
          soldCount: databaseSchema.vTicketOptionCounts.soldCount,
        })
        .from(databaseSchema.ticketOptions)
        .leftJoin(
          databaseSchema.ticketTypes,
          eq(
            databaseSchema.ticketOptions.ticketTypeId,
            databaseSchema.ticketTypes.id
          )
        )
        .leftJoin(
          databaseSchema.vTicketOptionCounts,
          eq(
            databaseSchema.ticketOptions.id,
            databaseSchema.vTicketOptionCounts.ticketOptionId
          )
        )
        .where(
          and(
            eq(databaseSchema.ticketTypes.isActive, true),
            isNotNull(databaseSchema.ticketOptions.id)
          )
        )
        .orderBy(databaseSchema.ticketOptions.createdAt);

      return optionSalesWithCounts;
    });

    await step.do("send_slack_message", async () => {
      const slackWebhookUrl = params?.webhookUrl || this.env.SLACK_WEBHOOK_URL;

      // データをgrouped形式に変換
      const grouped: Record<string, number> = {};
      const ticketTypesWithMaxCount: Record<string, number> = {};

      for (const sale of sales) {
        grouped[sale.ticketTypeName] = sale.soldCount || 0;
        ticketTypesWithMaxCount[sale.ticketTypeName] = sale.maxQuantity || 0;
      }

      // チケットオプション用のデータ整理
      const optionsByTicketType: Record<
        string,
        Array<(typeof optionSales)[number]>
      > = {};
      for (const option of optionSales) {
        const ticketTypeName = option.ticketTypeName ?? "";
        if (!optionsByTicketType[ticketTypeName]) {
          optionsByTicketType[ticketTypeName] = [];
        }
        optionsByTicketType[ticketTypeName].push(option);
      }

      // 販売状況に応じて色を決定する関数
      const getColorBySalesRatio = (
        soldCount: number,
        maxCount: number
      ): string => {
        if (maxCount === 0) return "#808080";
        const salesRatio = soldCount / maxCount;
        if (salesRatio >= 0.9) return "#dc3545";
        if (salesRatio >= 0.7) return "#ffc107";
        return "#28a745";
      };

      const attachments = Object.entries(grouped).map(
        ([ticketTypeName, count]) => {
          const maxCount = ticketTypesWithMaxCount[ticketTypeName];
          const relatedOptions = optionsByTicketType[ticketTypeName] || [];

          // メインのチケット情報
          let text = `*${ticketTypeName}*\n${getProgressBarText(
            count,
            maxCount
          )}`;

          // オプション情報を追加
          if (relatedOptions.length > 0) {
            text += "\n\n*オプション:*";
            relatedOptions.forEach((option) => {
              const soldCount = option.soldCount || 0;
              const maxQuantity = option.maxQuantity;

              text += `\n• ${option.optionName}`;
              if (maxQuantity && maxQuantity > 0) {
                text += `\n  ${getProgressBarText(soldCount, maxQuantity)}`;
              } else {
                text += `\n  ${soldCount}枚 販売済み`;
              }
            });
          }

          return {
            color: getColorBySalesRatio(count, maxCount),
            text: text,
            mrkdwn_in: ["text"],
          };
        }
      );

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
