import indexHtml from "./index.html";

const STATIC_FILE = /.*\..*$/;

export default {
  async fetch(request, { STATIC }) {
    if (request.url.match(STATIC_FILE)) {
      return new Response("Not Found", {
        status: 404,
      });
    }

    return new Response(indexHtml, {
      headers: {
        "Content-Type": "text/html; charset=UTF-8",
      },
    });
  },
};
