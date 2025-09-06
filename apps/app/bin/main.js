// Worker script for Flutter web app static asset hosting
// This script handles static assets and SPA routing

export default {
  async fetch(request, env) {
    try {
      // Try to serve static assets first
      return await env.ASSETS.fetch(request);
    } catch (e) {
      // If static asset not found, serve index.html for SPA routing
      const url = new URL(request.url);
      url.pathname = '/index.html';
      return await env.ASSETS.fetch(new Request(url, request));
    }
  },
};
