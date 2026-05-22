# Dugong Gas Planner - 单文件离线打包
# 使用说明：先在有网络的机器上拉取 nginx:alpine 镜像，然后导出，在目标机器导入

# 1. 在有网络的机器上拉取基础镜像
docker pull nginx:alpine

# 2. 导出镜像为 tar 文件
docker save -o dugong-nginx-alpine.tar nginx:alpine

# 3. 传输到目标机器后导入
docker load -i dugong-nginx-alpine.tar

# 4. 在项目根目录构建镜像
docker build -t dugong-gasplanner:latest .

# 5. 启动容器
docker run -d -p 8080:8080 --name gasplanner dugong-gasplanner:latest

# 6. 访问应用
echo "应用已启动: http://localhost:8080"

# 停止容器
docker stop gasplanner

# 重新启动已停止的容器
docker start gasplanner

# 查看运行日志
docker logs -f gasplanner

# 完全删除
docker rm -f gasplanner