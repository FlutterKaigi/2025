import * as fs from "fs/promises";
import * as v from "valibot";

const DataSchema = v.object({
  email: v.pipe(v.string(), v.email()),
  companyName: v.string(),
  ticketType: v.pipe(
    v.string(),
    v.union([
      v.literal("スポンサーセッション登壇者"),
      v.literal("スポンサーブース運営スタッフ・学生支援スポンサー運営スタッフ"),
      v.literal("無料招待チケット"),
    ])
  ),
});
export type DataSchema = v.InferOutput<typeof DataSchema>;

export async function readData(path: string) {
  const data = await fs.readFile(path, "utf-8");
  return data
    .split("\n")
    .map((line) => line.split("|"))
    .filter((line) => line.length === 3)
    .map((line) => {
      const [email, companyName, ticketType] = line;
      return v.parse(DataSchema, { email, companyName, ticketType });
    });
}
