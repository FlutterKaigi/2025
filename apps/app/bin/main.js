// Worker script for Flutter web app static asset hosting
// This script handles routing and serves static assets from the build/web directory

export default {
  async fetch(request, env, ctx) {
    try {
      const url = new URL(request.url);
      
      // Debug: Check if STATIC binding exists
      if (!env.STATIC) {
        return new Response('STATIC binding not found', { status: 500 });
      }
      
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
      
      // Handle static assets (JS, CSS, images, etc.)
      // Check if the path has a file extension
      if (url.pathname.includes('.')) {
        const asset = await env.STATIC.get(url.pathname);
        if (asset) {
          // Set appropriate content type based on file extension
          const contentType = getContentType(url.pathname);
          return new Response(asset, {
            headers: {
              'Content-Type': contentType,
            },
          });
        }
      }
      
      // For all other paths (including /event), serve index.html for SPA routing
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
    } catch (error) {
      return new Response(`Error: ${error.message}`, { status: 500 });
    }
  },
};

// Helper function to determine content type based on file extension
function getContentType(pathname) {
  const extension = pathname.split('.').pop().toLowerCase();
  
  switch (extension) {
    case 'html':
      return 'text/html; charset=utf-8';
    case 'css':
      return 'text/css';
    case 'js':
      return 'application/javascript';
    case 'json':
      return 'application/json';
    case 'png':
      return 'image/png';
    case 'jpg':
    case 'jpeg':
      return 'image/jpeg';
    case 'gif':
      return 'image/gif';
    case 'svg':
      return 'image/svg+xml';
    case 'webp':
      return 'image/webp';
    case 'ico':
      return 'image/x-icon';
    case 'woff':
      return 'font/woff';
    case 'woff2':
      return 'font/woff2';
    case 'ttf':
      return 'font/ttf';
    case 'eot':
      return 'application/vnd.ms-fontobject';
    default:
      return 'application/octet-stream';
  }
}
