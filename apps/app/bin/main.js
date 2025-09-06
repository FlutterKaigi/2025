// Worker script for Flutter web app static asset hosting
// This script handles routing and serves static assets from the build/web directory

export default {
  async fetch(request, env, ctx) {
    const url = new URL(request.url);
    
    // Handle root path - serve index.html
    if (url.pathname === '/') {
      return new Response(env.STATIC.get('index.html'), {
        headers: {
          'Content-Type': 'text/html; charset=utf-8',
        },
      });
    }
    
    // Handle other static assets
    const asset = env.STATIC.get(url.pathname);
    if (asset) {
      return new Response(asset);
    }
    
    // Fallback to index.html for SPA routing
    return new Response(env.STATIC.get('index.html'), {
      headers: {
        'Content-Type': 'text/html; charset=utf-8',
      },
    });
  },
};
