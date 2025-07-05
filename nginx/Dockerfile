FROM alpine:latest

# Встановлення залежностей
RUN apk add --no-cache \
    build-base \
    pcre-dev \
    openssl-dev \
    zlib-dev \
    git \
    wget \
    linux-headers

# Встановлення nginx із rtmp-модулем
WORKDIR /build

# Завантажити NGINX і RTMP-модуль
ENV NGINX_VERSION=1.25.3
RUN wget http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz && \
    tar -zxvf nginx-${NGINX_VERSION}.tar.gz && \
    git clone https://github.com/arut/nginx-rtmp-module.git

# Збірка NGINX з RTMP
RUN cd nginx-${NGINX_VERSION} && \
    ./configure --with-http_ssl_module --add-module=../nginx-rtmp-module && \
    make && make install
    
# Додаємо ffmpeg 
RUN apk add --no-cache ffmpeg

# Копіюємо власний конфіг
COPY nginx.conf /usr/local/nginx/conf/nginx.conf

# Відкриті порти
EXPOSE 1935 80

# Запуск
CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]

