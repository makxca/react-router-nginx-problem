# React-router-dom for multiple apps on a same domain trouble

I am preoccupied, that if I use `Link` from `react-router-dom` for navigation between multiple apps without setting `target="_blank"`, then the navigation will not work, and when I move from /app1/page to /app2/page, although the browser's URL will say I am at /app2/page, the app1 UI will be rendered.

For checking this I created a nginx-server (check [nginx.conf](./nginx.conf)) and two apps (check [app1](./packages/app1) and [app2](./packages/app2))

## Deploy

### Prerequisites

- pnpm@7.33.6
- yc utility: [ru](https://yandex.cloud/ru/docs/storage/tools/yc-cli#macos_1), [en](https://yandex.cloud/en/docs/storage/tools/yc-cli#macos_1)

### Upload to Yandex Cloud

```Bash
pnpm i
pnpm yc:upload
```

### Deploy to a distant server via ssh

```Bash
pnpm server:upload
```

The script will install nginx on the server, download the built app there and start the server. The script will require your username and the ip address of the server. It assumes, that you use ssh-keys for authentication (password authentication is _bad_).
