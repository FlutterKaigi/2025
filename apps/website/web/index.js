const STATIC_FILE = /.*\..*$/;

export default {
  async fetch(request, { STATIC }) {
    const url = new URL(request.url);
    if (url.pathname.match(STATIC_FILE)) {
      return new Response("Not Found", {
        status: 404,
      });
    }

    return await STATIC.fetch(request);
  },
};
