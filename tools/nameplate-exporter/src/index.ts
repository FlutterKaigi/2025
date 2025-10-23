import { existsSync } from "node:fs";
import { appendFile, copyFile, mkdir, writeFile } from "node:fs/promises";
import { extname, join } from "node:path";
import { eq, getDatabase, ne, sql } from "@2025/database";
import * as v from "valibot";
import {
  profiles,
  ticketPurchases,
  ticketTypes,
  userSnsLinks,
  usersInAuth,
} from "../../../bff/database/drizzle/schema";

// エラーログに書き込む関数
async function logError(message: string) {
  const timestamp = new Date().toISOString();
  await appendFile("error.log", `[${timestamp}] ${message}\n`);
}

async function main() {
  const db = await getDatabase(
    v.parse(v.string(), process.env.DATABASE_CONNECTION_STRING)
  );

  console.log("Fetching nameplate data...");

  // normalを除くすべてのチケット購入者を取得
  // profiles, ticket_types, user_sns_links (X), auth.users をJOINで取得
  const results = await db
    .select({
      userId: ticketPurchases.userId,
      email: usersInAuth.email,
      profileName: profiles.name,
      ticketTypeName: ticketTypes.name,
      ticketPurchaseId: ticketPurchases.id,
      nameplateId: ticketPurchases.nameplateId,
      xAccount: userSnsLinks.value,
      avatarKey: profiles.avatarKey,
      rawUserMetaData: usersInAuth.rawUserMetaData,
    })
    .from(ticketPurchases)
    .innerJoin(ticketTypes, eq(ticketPurchases.ticketTypeId, ticketTypes.id))
    .innerJoin(profiles, eq(ticketPurchases.userId, profiles.id))
    .innerJoin(usersInAuth, eq(ticketPurchases.userId, usersInAuth.id))
    .leftJoin(
      userSnsLinks,
      sql`${ticketPurchases.userId} = ${userSnsLinks.userId} AND ${userSnsLinks.snsType} = 'x'`
    )
    .where(ne(ticketTypes.name, "normal"));

  console.log(`Found ${results.length} ticket purchases`);

  // outputディレクトリを作成
  const outputDir = "output";
  if (!existsSync(outputDir)) {
    await mkdir(outputDir, { recursive: true });
  }

  // プロフィール画像を処理
  console.log("Processing profile images...");
  let copiedCount = 0;
  let downloadedCount = 0;
  let skippedCount = 0;
  const avatarFileMap = new Map<string, string>(); // userId -> filename

  for (const row of results) {
    const userId = row.userId;

    try {
      if (row.avatarKey) {
        // avatar_keyがある場合、data/2025-production/{key} をコピー
        const sourcePath = join("data", "2025-production", row.avatarKey);
        if (existsSync(sourcePath)) {
          const ext = extname(row.avatarKey);
          const filename = `${userId}${ext}`;
          const destPath = join(outputDir, filename);
          await copyFile(sourcePath, destPath);
          avatarFileMap.set(userId, filename);
          copiedCount++;
          console.log(`Copied: ${sourcePath} -> ${destPath}`);
        } else {
          const errorMsg = `Source file not found: ${sourcePath} for user ${userId}`;
          console.warn(errorMsg);
          await logError(errorMsg);
          skippedCount++;
        }
      } else if (row.rawUserMetaData) {
        // raw_user_metadataのavatar_urlを確認
        const metadata = row.rawUserMetaData as { avatar_url?: string };
        if (metadata.avatar_url) {
          try {
            const response = await fetch(metadata.avatar_url);
            if (response.ok) {
              const buffer = await response.arrayBuffer();
              // URLから拡張子を推測（なければContent-Typeから）
              const urlExt = extname(new URL(metadata.avatar_url).pathname);
              const contentType = response.headers.get("content-type");
              let ext = urlExt || ".jpg";
              if (!urlExt && contentType) {
                if (contentType.includes("png")) ext = ".png";
                else if (
                  contentType.includes("jpeg") ||
                  contentType.includes("jpg")
                )
                  ext = ".jpg";
                else if (contentType.includes("webp")) ext = ".webp";
              }
              const filename = `${userId}${ext}`;
              const destPath = join(outputDir, filename);
              await writeFile(destPath, Buffer.from(buffer));
              avatarFileMap.set(userId, filename);
              downloadedCount++;
              console.log(`Downloaded: ${metadata.avatar_url} -> ${destPath}`);
            } else {
              const errorMsg = `Failed to download: ${metadata.avatar_url} (${response.status}) for user ${userId}`;
              console.warn(errorMsg);
              await logError(errorMsg);
              skippedCount++;
            }
          } catch (error) {
            const errorMsg = `Error downloading ${metadata.avatar_url} for user ${userId}: ${error}`;
            console.warn(errorMsg);
            await logError(errorMsg);
            skippedCount++;
          }
        } else {
          skippedCount++;
        }
      } else {
        skippedCount++;
      }
    } catch (error) {
      const errorMsg = `Unexpected error processing avatar for user ${userId}: ${error}`;
      console.error(errorMsg);
      await logError(errorMsg);
      skippedCount++;
    }
  }

  console.log(`\nProfile images processed:`);
  console.log(`  Copied: ${copiedCount}`);
  console.log(`  Downloaded: ${downloadedCount}`);
  console.log(`  Skipped: ${skippedCount}`);

  // CSVヘッダー
  const csvLines = [
    "Email,Profile Name,Ticket Type,Purchase ID,Nameplate ID,X Account,Avatar",
  ];

  // データ行を追加
  for (const row of results) {
    const avatarFilename = avatarFileMap.get(row.userId) || "";
    const line = [
      escapeCsv(row.email || ""),
      escapeCsv(row.profileName),
      escapeCsv(row.ticketTypeName),
      escapeCsv(row.ticketPurchaseId),
      escapeCsv(row.nameplateId || ""),
      escapeCsv(row.xAccount || ""),
      escapeCsv(avatarFilename),
    ].join(",");
    csvLines.push(line);
  }

  const csvContent = csvLines.join("\n");

  // CSVファイルに書き込み
  const outputPath = "nameplate_data.csv";
  await writeFile(outputPath, csvContent, "utf-8");

  console.log(`CSV exported to ${outputPath}`);
  console.log(`Total records: ${results.length}`);
}

// CSV用のエスケープ処理
function escapeCsv(value: string): string {
  if (value.includes(",") || value.includes('"') || value.includes("\n")) {
    return `"${value.replace(/"/g, '""')}"`;
  }
  return value;
}

main().catch((error) => {
  console.error("Error:", error);
  process.exit(1);
});
