import indexHtml from "./index.html";

function isStaticFile({ pathname }) {
  return pathname.startsWith("/assets/") ||
    pathname.endsWith(".js") ||
    pathname.endsWith(".css");
}

export default {
  async fetch(request, env) {
    const url = new URL(request.url);
    if (isStaticFile(url)) {
      return env.STATIC.fetch(request);
    }

    return new Response(indexHtml, {
      headers: {
        "Content-Type": "text/html; charset=UTF-8",
      },
    });
  },
};
