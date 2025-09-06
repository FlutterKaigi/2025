// Worker script for Flutter web app static asset hosting
// This script handles routing and serves static assets from the build/web directory

export default {
  async fetch(request, env, ctx) {
    const url = new URL(request.url);
    
    // Handle root path - serve index.html
    if (url.pathname === '/') {
      const indexHtml = await env.STATIC.get('index.html');
      if (indexHtml) {
        return new Response(indexHtml, {
          headers: {
            'Content-Type': 'text/html; charset=utf-8',
          },
        });
      }
    }
    
    // Handle other static assets
    const asset = await env.STATIC.get(url.pathname);
    if (asset) {
      return new Response(asset);
    }
    
    // Fallback to index.html for SPA routing
    const fallbackHtml = await env.STATIC.get('index.html');
    if (fallbackHtml) {
      return new Response(fallbackHtml, {
        headers: {
          'Content-Type': 'text/html; charset=utf-8',
        },
      });
    }
    
    // If no assets found, return 404
    return new Response('Not Found', { status: 404 });
  },
};
