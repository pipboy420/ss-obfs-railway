FROM debian:bullseye-slim

RUN apt update && apt install -y shadowsocks-libev simple-obfs && apt clean

ENV SERVER_ADDR=0.0.0.0
ENV SERVER_PORT=8388
ENV PASSWORD=your_password
ENV METHOD=aes-256-gcm
ENV OBFS=tls
ENV OBFS_HOST=www.bing.com

CMD ss-server \
    -s $SERVER_ADDR \
    -p $SERVER_PORT \
    -k $PASSWORD \
    -m $METHOD \
    --fast-open \
    --plugin obfs-server \
    --plugin-opts "obfs=$OBFS;obfs-host=$OBFS_HOST"