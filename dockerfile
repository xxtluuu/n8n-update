# 基于官方 n8n:1.95.3 镜像
FROM n8nio/n8n:1.95.3

# 切到 root 安装 Python3、pip、yt-dlp
USER root
RUN apk add --no-cache python3 py3-pip ffmpeg \
    && pip3 install --break-system-packages yt-dlp \
    && apk del py3-pip \
    && rm -rf /var/cache/apk/*

# 把 cookies.txt 拷贝进容器，并给 node 用户权限
COPY cookies.txt /home/node/cookies.txt
RUN chown node:node /home/node/cookies.txt

# 切回非特权用户运行 n8n
USER node

# 暴露 n8n 默认端口
EXPOSE 5678