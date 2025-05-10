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

export default {
  async fetch(request, env, ctx): Promise<Response> {
    try {
      const dartInstance = await instantiate(mod);

      // __dart_cf_workers.response関数経由で Promiseが完了するのを待つ
      return await new Promise<Response>((resolve) => {
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
