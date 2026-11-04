FROM nginxinc/nginx-unprivileged:1.28-alpine

LABEL org.opencontainers.image.title="Adeyemi Onibokun | Solutions Architect"
LABEL org.opencontainers.image.description="Static portfolio site served by nginx"
LABEL org.opencontainers.image.source="https://github.com/Babaseun/website"

COPY nginx/default.conf /etc/nginx/conf.d/default.conf

COPY --chown=nginx:nginx index.html /usr/share/nginx/html/
COPY --chown=nginx:nginx badges/ /usr/share/nginx/html/badges/
COPY --chown=nginx:nginx architectures/ /usr/share/nginx/html/architectures/

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://127.0.0.1:8080/healthz >/dev/null || exit 1