# 生产镜像 - 直接使用预构建的静态文件
FROM nginx:alpine

# 复制构建产物
COPY dist/planner /usr/share/nginx/html

# 复制 nginx 配置
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]