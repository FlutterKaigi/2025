import { instantiate, invoke } from "../engine-artifact/main.mjs";
import mod from "../engine-artifact/main.wasm";

declare global {
  function __dart_cf_workers(): {
    request: Request;
    response: (response: Response) => void;
    env: Env;
    ctx: ExecutionContext;
  };
}

// dart wasmを保持
// リクエスト間で使い回す
// See: https://developers.cloudflare.com/workers/runtime-apis/webassembly/javascript/#use-from-javascript
let dartInstance: unknown | null = null;

export default {
  async fetch(request, env, ctx): Promise<Response> {
    try {
      if (!dartInstance) {
        dartInstance = await instantiate(mod);
      }

      const result = await new Promise<Response>((resolve) => {
        globalThis.__dart_cf_workers = () => ({
          response: (response: Response) => resolve(response),
          request: request,
          fetch: (request: Request, requestInit?: RequestInit) =>
            fetch(request, requestInit),
          env: env,
          ctx: ctx,
        });
        invoke(dartInstance, request, env, ctx);
      });
      return result;
    } catch (e) {
      console.error(e);
      return new Response("Internal Server Error", {
        status: 500,
      });
    }
  },
} satisfies ExportedHandler<Env>;
