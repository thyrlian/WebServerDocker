# WebServerDocker

Uninteresting web server to serve files or folders for personal purposes.

This project uses the official Alpine-based [**Caddy**](https://hub.docker.com/_/caddy) image directly with Docker Compose.

## How To

Copy the [example environment file](.env.example):

```console
cp .env.example .env
```

Update `SHARE_DIR` in `.env`:

```env
SHARE_DIR=/path/to/share
```

Optionally update `HOST_PORT` to change the exposed local port.

Start the web server:

```console
docker compose up -d
```

Check the logs:

```console
docker compose logs -f webserver
```

Open the web server: [http://localhost:8080](http://localhost:8080) or the port configured by `HOST_PORT`.

If the shared directory contains an `index.html`, it will be served as the homepage. Otherwise, Caddy will show a browsable directory listing.

Stop the web server:

```console
docker compose down
```

## Configuration

The server is configured by [`Caddyfile`](Caddyfile).

## Notes

This setup is intended for **LAN**, **private mesh/VPN access** (such as Tailscale), or **reverse-proxy-backed** usage.

For public exposure, put it behind a proper gateway such as **Traefik**, or let **Caddy** itself handle HTTPS and authentication in a dedicated public setup.
