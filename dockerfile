# 基于官方 n8n:1.95.3 镜像
FROM n8nio/n8n:1.107.4

# 切到 root 安装 Python3、pip、yt-dlp
USER root
RUN apk add --no-cache python3 py3-pip ffmpeg \
    && pip3 install --break-system-packages yt-dlp \
    && apk del py3-pip \
    && rm -rf /var/cache/apk/*

# 加载自定义字体
RUN mkdir -p /home/node/.n8n/fonts
COPY HYFengBoMoJiTuo-75U.ttf /home/node/.n8n/fonts/HYFengBoMoJiTuo-75U.ttf
RUN chown node:node /home/node/.n8n/fonts/HYFengBoMoJiTuo-75U.ttf

# 切回非特权用户运行 n8n
USER node

# 暴露 n8n 默认端口
EXPOSE 5678