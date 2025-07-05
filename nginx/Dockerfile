FROM alpine:latest

# Потрібні пакети
RUN apk add --no-cache \
    nginx \
    nginx-mod-rtmp \
    ffmpeg \
    bash

# Копіюємо свій конфіг
COPY nginx.conf /etc/nginx/nginx.conf

# Створимо потрібну директорію
RUN mkdir -p /opt/data/hls

EXPOSE 1935 80

# Запускаємо nginx у foreground
CMD ["nginx", "-g", "daemon off;"]
