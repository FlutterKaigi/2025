import notFound from "../build/_404/ja/index.html";
import notFoundEn from "../build/_404/en/index.html";

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
