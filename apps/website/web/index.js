const STATIC_FILE = /.*\..*$/;

export default {
  async fetch(request, { STATIC }) {
    const url = new URL(request.url);
    if (url.pathname.match(STATIC_FILE)) {
      return new Response("Not Found", {
        status: 404,
      });
    }
    try {
      return await STATIC.fetch(request);
    } catch (error) {
      const path = url.pathname.split("/").at(1);
      console.error("Error fetching static file:", error);
      if (!path) {
        return new Response("Not Found", {
          status: 404,
        });
      }
      const notFoundResponse = await STATIC.fetch(`${path}/404/index.html`);
      return new Response(notFoundResponse.body, {
        status: 200,
        headers: notFoundResponse.headers,
      });
    }
  },
};
