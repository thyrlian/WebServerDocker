# WebServerDocker

Uninteresting web server to serve files or folders for personal purposes.

This project uses the official Alpine-based [**Caddy**](https://hub.docker.com/_/caddy) image directly with Docker Compose.

## How To

Update the volume mapping in [`compose.yaml`](compose.yaml) to point to the directory you want to share:

```yaml
volumes:
  - /path/to/share:/srv:ro
```

Start the web server:

```console
docker compose up -d
```

Check the logs:

```console
docker compose logs -f webserver
```

Open the web server: [http://localhost:8080](http://localhost:8080)

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
