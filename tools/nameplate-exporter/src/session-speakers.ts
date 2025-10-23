import { existsSync } from "node:fs";
import { appendFile, mkdir, writeFile } from "node:fs/promises";
import { join } from "node:path";
import * as v from "valibot";

// エラーログに書き込む関数
async function logError(message: string) {
  const timestamp = new Date().toISOString();
  await appendFile("session-speakers-error.log", `[${timestamp}] ${message}\n`);
}

// CSV用のエスケープ処理
function escapeCsv(value: string | undefined | null): string {
  if (!value) return "";
  if (value.includes(",") || value.includes('"') || value.includes("\n")) {
    return `"${value.replace(/"/g, '""')}"`;
  }
  return value;
}

// valibotスキーマ定義
const speakerSchema = v.object({
  uuid: v.string(),
  display_name: v.string(),
  avatar_url: v.optional(v.string()),
  twitter_account: v.optional(v.string()),
});

const proposalSchema = v.object({
  uuid: v.string(),
  title: v.string(),
  speaker: v.optional(speakerSchema),
});

const proposalsResponseSchema = v.object({
  result: v.any(),
  proposals: v.array(proposalSchema),
});

type Proposal = v.InferOutput<typeof proposalSchema>;

async function main() {
  // 環境変数からcookieを取得
  const sessionCookie = v.parse(v.string(), process.env.FORTEE_SESSION);
  const cookieAuth = v.parse(v.string(), process.env.FORTEE_COOKIE_AUTH);

  console.log("Fetching session proposals from fortee.jp...");

  try {
    const response = await fetch(
      "https://fortee.jp/flutterkaigi-2025/organizer/proposals/api-proposals?sort=score&options=accepted",
      {
        headers: {
          accept: "application/json, text/plain, */*",
          "accept-language": "ja,en-US;q=0.9,en;q=0.8",
          "sec-ch-ua":
            '"Google Chrome";v="141", "Not?A_Brand";v="8", "Chromium";v="141"',
          "sec-ch-ua-mobile": "?0",
          "sec-ch-ua-platform": '"macOS"',
          "sec-fetch-dest": "empty",
          "sec-fetch-mode": "cors",
          "sec-fetch-site": "same-origin",
          cookie: `session=${sessionCookie}; CookieAuth=${cookieAuth}`,
          Referer:
            "https://fortee.jp/flutterkaigi-2025/organizer/proposals/index?options=accepted",
        },
        method: "GET",
      }
    );

    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    const data = await response.json();

    // valibotでレスポンスをバリデーション
    const parsedData = v.parse(proposalsResponseSchema, data);
    const proposals = parsedData.proposals;

    console.log(`Found ${proposals.length} accepted proposals`);

    // outputディレクトリを作成
    const outputDir = "session-speakers-output";
    if (!existsSync(outputDir)) {
      await mkdir(outputDir, { recursive: true });
    }

    // アバター画像をダウンロード
    console.log("Processing speaker avatars...");
    let downloadedCount = 0;
    let skippedCount = 0;
    const avatarFileMap = new Map<string, string>();
    const baseUrl = "https://fortee.jp";

    for (const proposal of proposals) {
      const speakerId = proposal.speaker?.uuid || proposal.uuid;
      const speaker = proposal.speaker;

      if (speaker?.avatar_url) {
        try {
          // 相対パスを完全なURLに変換
          const avatarUrl = speaker.avatar_url.startsWith("http")
            ? speaker.avatar_url
            : `${baseUrl}${speaker.avatar_url}`;

          const avatarResponse = await fetch(avatarUrl, {
            headers: {
              cookie: `session=${sessionCookie}; CookieAuth=${cookieAuth}`,
            },
          });

          if (avatarResponse.ok) {
            const buffer = await avatarResponse.arrayBuffer();
            const contentType = avatarResponse.headers.get("content-type");
            let ext = ".jpg";
            if (contentType) {
              if (contentType.includes("png")) ext = ".png";
              else if (
                contentType.includes("jpeg") ||
                contentType.includes("jpg")
              )
                ext = ".jpg";
              else if (contentType.includes("webp")) ext = ".webp";
            }
            const filename = `${speakerId}${ext}`;
            const destPath = join(outputDir, filename);
            await writeFile(destPath, Buffer.from(buffer));
            avatarFileMap.set(speakerId, filename);
            downloadedCount++;
            console.log(`Downloaded: ${avatarUrl} -> ${destPath}`);
          } else {
            const errorMsg = `Failed to download avatar: ${avatarUrl} (${avatarResponse.status}) for speaker ${speakerId}`;
            console.warn(errorMsg);
            await logError(errorMsg);
            skippedCount++;
          }
        } catch (error) {
          const errorMsg = `Error downloading avatar for speaker ${speakerId}: ${error}`;
          console.warn(errorMsg);
          await logError(errorMsg);
          skippedCount++;
        }
      } else {
        skippedCount++;
      }
    }

    console.log(`\nSpeaker avatars processed:`);
    console.log(`  Downloaded: ${downloadedCount}`);
    console.log(`  Skipped: ${skippedCount}`);

    // CSVヘッダー
    const csvLines = [
      "Proposal ID,Title,Speaker UUID,Speaker Name,Twitter,Avatar",
    ];

    // データ行を追加
    for (const proposal of proposals) {
      const speakerId = proposal.speaker?.uuid || proposal.uuid;
      const avatarFilename = avatarFileMap.get(speakerId);
      const avatarPath = avatarFilename ? `${outputDir}/${avatarFilename}` : "";
      const line = [
        escapeCsv(proposal.uuid),
        escapeCsv(proposal.title),
        escapeCsv(proposal.speaker?.uuid),
        escapeCsv(proposal.speaker?.display_name),
        escapeCsv(proposal.speaker?.twitter_account),
        escapeCsv(avatarPath),
      ].join(",");
      csvLines.push(line);
    }

    const csvContent = csvLines.join("\n") + "\n";

    // CSVファイルに書き込み
    const outputPath = "session_speakers.csv";
    await writeFile(outputPath, csvContent, "utf-8");

    console.log(`CSV exported to ${outputPath}`);
    console.log(`Total proposals: ${proposals.length}`);
  } catch (error) {
    console.error("Error fetching proposals:", error);
    await logError(`Fatal error: ${error}`);
    throw error;
  }
}

main().catch((error) => {
  console.error("Error:", error);
  process.exit(1);
});
