import { compileStreaming, instantiate, invoke } from "./main.mjs";

const instance = await instantiate(
  compileStreaming(fetch(new URL("./main.wasm", import.meta.url))),
);

invoke(instance);
