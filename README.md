# React-router-dom for multiple apps on a same domain trouble

I am preoccupied, that if I use `Link` from `react-router-dom` for navigation between multiple apps without setting `target="_blank"`, then the navigation will not work, and when I move from /app1/page to /app2/page, although the browser's URL will say I am at /app2/page, the app1 UI will be rendered.

For checking this I created a nginx-server (check [nginx.conf](./nginx.conf)) and two apps (check [app1](./packages/app1) and [app2](./packages/app2))
