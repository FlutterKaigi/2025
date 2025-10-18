import { DurableObject, type env } from "cloudflare:workers";
import * as v from "valibot";
import { UserWebsocketPayload } from "./payload/user_websocket_payload";

type Env = typeof env;

export class UserWebsocketObject extends DurableObject<typeof env> {
  websockets: Set<WebSocket>;

  constructor(ctx: DurableObjectState, env: Env) {
    super(ctx, env);
    this.websockets = new Set();

    for (const websocket of this.ctx.getWebSockets()) {
      this.websockets.add(websocket);
    }

    this.ctx.setWebSocketAutoResponse(
      new WebSocketRequestResponsePair("ping", "pong")
    );
  }

  async fetch(request: Request): Promise<Response> {
    console.log(
      "Connection established",
      request.headers.get("cf-connecting-ip")
    );
    const websocketPair = new WebSocketPair();
    const [client, server] = Object.values(websocketPair);

    this.ctx.acceptWebSocket(server);

    this.websockets.add(client);
    return new Response(null, {
      status: 101,
      webSocket: client,
    });
  }

  async broadcast(message: v.InferOutput<typeof UserWebsocketPayload>) {
    // validation
    const validated = v.parse(UserWebsocketPayload, message);
    const jsonStr = JSON.stringify(validated);

    for (const websocket of this.websockets) {
      websocket.send(jsonStr);
    }

    return {
      code: "OK",
      count: this.websockets.size,
    };
  }

  async webSocketMessage(
    ws: WebSocket,
    message: ArrayBuffer | string
  ): Promise<void> {
    console.log("message", message, ws);
  }

  async webSocketClose(
    ws: WebSocket,
    code: number,
    reason: string,
    wasClean: boolean
  ) {
    this.websockets.delete(ws);
    ws.close(code, `Closed by the server: ${reason}`);
    console.log("websocket closed", code, reason, wasClean);
  }

  async webSocketError(ws: WebSocket, error: unknown) {
    console.error("websocket error", error);
    this.websockets.delete(ws);
    ws.close(1011, "Internal server error");
  }
}
