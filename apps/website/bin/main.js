import notFound from "../build/jaspr/404/index.html";
import notFoundEn from "../build/jaspr/en/404/index.html";

export default {
  async fetch(request, { STATIC }) {
    const url = new URL(request.url);

    return new Response(
      url.pathname.startsWith("/en/") ? notFoundEn : notFound,
      {
        status: 404,
        headers: {
          "Content-Type": "text/html; charset=utf-8",
        },
      },
    );
  },
};
