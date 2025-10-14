import { eq, getDatabase } from "@2025/database";
import { readData } from "./data/data";
import * as v from "valibot";
import {
  companies,
  companyMembers,
  ticketPurchases,
  ticketTypes,
  users,
  usersInAuth,
} from "../../../bff/database/drizzle/schema";

async function insertSponsorSessionTicketType(
  db: ReturnType<typeof getDatabase>
) {
  return await db
    .insert(ticketTypes)
    .values([
      {
        id: "sponsor-session-speaker",
        name: "スポンサーセッション登壇者",
        price: 0,
        isActive: false,
        stripePriceId: "",
        description: "スポンサーセッジ登壇者 [非売品]",
        maxQuantity: 0,
      },
      {
        id: "sponsor-session-staff",
        name: "スポンサーブース運営スタッフ・学生支援スポンサー運営スタッフ",
        price: 0,
        isActive: false,
        stripePriceId: "",
        description:
          "スポンサーブース運営スタッフ・学生支援スポンサー運営スタッフ [非売品]",
        maxQuantity: 0,
      },
      {
        id: "sponsor-session-free",
        name: "無料招待チケット",
        price: 0,
        isActive: false,
        stripePriceId: "",
        description: "無料招待チケット [非売品]",
        maxQuantity: 0,
      },
    ])
    .onConflictDoNothing()
    .returning();
}

async function main() {
  const data = await readData("src/data/data.tsv");
  console.log(`Data: ${data.length}`);

  const db = await getDatabase(
    v.parse(v.string(), process.env.DATABASE_CONNECTION_STRING)
  );

  // check all company is exists
  const allCompanies = await db.select().from(companies);
  console.log(`All companies: ${allCompanies.length}`);
  const allTicketTypes = await db.select().from(ticketTypes);
  console.log(`All ticket types: ${allTicketTypes.length}`);
  const entries = data.map((item) => {
    const company = allCompanies.find(
      (company) => company.name === item.companyName
    );
    if (!company) {
      console.error(`Company ${item.companyName} not found`);
      throw Error(`Company ${item.companyName} not found`);
    }

    const ticketType = allTicketTypes.find(
      (ticketType) => ticketType.name === item.ticketType
    );
    if (!ticketType) {
      console.error(`Ticket type ${item.ticketType} not found`);
      throw Error(`Ticket type ${item.ticketType} not found`);
    }

    return {
      email: item.email,
      company: company,
      ticketType: ticketType,
    };
  });

  for (const entry of entries) {
    // ユーザ検索
    const users = await db
      .select()
      .from(usersInAuth)
      .where(eq(usersInAuth.email, entry.email));
    console.log(`Users: ${users}`);
    if (!users || users.length === 0 || users.length > 1) {
      console.error(`User ${entry.email} not found`);
      throw Error(`User ${entry.email} not found`);
    }
    const user = users[0];
    // 会社に所属させる
    await db
      .insert(companyMembers)
      .values([
        {
          companyId: entry.company.id,
          userId: user.id,
        },
      ])
      .returning();
  console.log(`Company member inserted: ${companyMembers}`);

    // チケットを購入する
    await db.insert(ticketPurchases).values([
      {
        userId: user.id,
        ticketTypeId: entry.ticketType.id,
        status: "completed",
      },
    ]).returning();
    console.log(`Ticket purchased: ${ticketPurchases}`);
  }
}

main();
