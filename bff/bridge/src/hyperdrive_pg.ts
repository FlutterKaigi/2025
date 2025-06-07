import { Client } from "pg";

export class HyperdrivePg {
  private readonly connectionString: string;

  constructor(connectionString: string) {
    this.connectionString = connectionString;
  }

  private client: Client | null = null;

  async connect(): Promise<Client> {
    const client = new Client({
      connectionString: this.connectionString,
    });
    await client.connect();
    this.client = client;
    return client;
  }

  async query(query: string, values?: unknown[]): Promise<PgResult<string>> {
    try {
      if (!this.client) {
        throw new Error("Client is not connected");
      }

      console.log(
        JSON.stringify({
          type: "debug",
          query,
          values,
        })
      );

      const result = await this.client.query(query, values);
      const json = JSON.stringify(result.rows);
      return {
        type: "success",
        value: json, // Record<string, unknown>[]
      };
    } catch (e) {
      return {
        type: "error",
        error: JSON.stringify(e), // Record<string, unknown>
      };
    }
  }

  async close(): Promise<void> {
    if (!this.client) {
      throw new Error("Client is not connected");
    }
    return this.client.end();
  }
}

type PgResult<T> =
  | {
      type: "success";
      value: T;
    }
  | {
      type: "error";
      error: unknown;
    };
