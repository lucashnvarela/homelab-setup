FROM caddy:builder AS builder

RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=~/.cache/go-build \
    xcaddy build \
    --with github.com/caddy-dns/porkbun

FROM caddy

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s \
    CMD caddy validate --config /etc/caddy/Caddyfile || exit 1