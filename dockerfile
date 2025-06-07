# Dockerfile
# 基于官方 n8n 镜像，不做额外修改也能跑出标准的 n8n 服务
FROM n8nio/n8n:1.95.3

# 暴露 n8n 默认端口
EXPOSE 5678