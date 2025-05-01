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

      // __dart_cf_workers.response関数経由で Promiseが完了するのを待つ
      return new Promise<Response>((resolve) => {
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
    } catch (e) {
      console.error(e);
      return new Response("Internal Server Error", {
        status: 500,
      });
    }
  },
} satisfies ExportedHandler<Env>;
