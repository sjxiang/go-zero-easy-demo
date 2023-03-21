# 环境搭建

一个基于 `docker` 的 `go-zero` 本地开发运行环境。


## 使用
### 1. 按需修改 .env 配置

### 2. 启动服务
- 启动全部服务
```bash
docker-compose up -d
```
- 按需启动部分服务
```bash
docker-compose up -d etcd golang mysql redis
```

### 3.运行代码
将项目代码放置 `CODE_PATH_HOST` 指定的本机目录，进入 `golang` 容器，运行项目代码。（实在不行，换成容器 ID）
~~~bash
docker exec -it deploy-golang  bash
~~~


### 4. 结束
~~~bash
docker-compose -f ./docker-compose.yml down
~~~


### 5. 补充
~~~bash
镜像拉不下来，就去 https://hub.docker.com/ 搜，挨个手动操作。 
~~~