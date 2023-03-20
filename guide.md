
# go-zero 使用指南


# 前提：go-zero 脚手架工具

1. 安装命令行工具 - goctl
2. 安装 gRPC 相关依赖 - protoc、protoc-gen-go、protoc-gen-go-grpc 
   或者一键 `goctl env check -i -f --verbose`
3. 安装 vscode goctl 插件，语法高亮


# 前提：环境搭建

docker-compose


# 入手（代码生成）

model
api （比 swagger 直观，就差测试）
rpc




# 模板生成命令
~/user$ goctl model mysql ddl -src ./model/user.sql -dir ./model -c
~/user$ goctl api go -api ./api/user.api -dir ./api



# api 服务

    - api 编写及自动生成代码
	- 配置文件 yaml
	- 依赖 serviceContext
	- 数据库操作 model
	- 中间件 middleware
	- 日志 log


# rpc 服务 - protobuf 编写及自动生成代码
# rpc 服务 - serviceContext
# rpc 服务 - handler
# rpc 服务 - logic
# rpc 服务 - model
# rpc 服务 - interceptor
# rpc 服务 - 源码解读
# 服务发现三种方式（直连、etcd、k8s）
# api 与 rpc 基于 grpc 的 metadata 传值
# api 错误处理
# rpc 错误处理
# 使用 template 来自定义生成代码


=======

# go-zero 杀手锏 - goctl 

1. 生成业务代码
  $ goctl api go -api *.api -dir ../  --style=go_zero
  $ goctl rpc protoc *.proto --go_out=../ --go-grpc_out=../  --zrpc_out=../ --style=go_zero



2. 生成 dockerfile
  $ goctl docker -go user.go


3. 生成 k8s yaml 文件
  $ goctl kube deploy user-api -mamespace go-zero-looklook -image user-api:v1.0 -o user-api.yaml -port 1001

4. 生成 Model 
  tips：先建库建表


5. 生成 doc 文档
  $ goctl api doc --dir ./


# api 服务 - api 编写及自动生成代码

参考文档


  $ tree ./user-api/ -d
./user-api/
├── api
├── etc
└── internal
    ├── config   # 配置管理
    ├── handler  # 拼装
    ├── logic    # 业务逻辑
    ├── svc      # 依赖
    └── types    # 定义 struct


# api 服务 - 数据库操作

  $ sh genModel.sh zero-demo user
  $ sh genModel.sh zero-demo user_data

错误处理很棒（数据库查询失败 & 数据不存在）

gorm find 和 first 

事务处理很烂，保持一个 session 

各种实现，都是处理过脏活换来的


# api 服务 - 中间件
局部中间件 - api 文件，要分组
全局中间件

两者先后，前全局后局部


# api 服务 - 日志

配置

type Config struct {
  zrpc.RpcConf   // rpc
  rest.RestConf  // api 相关配置，日志配置项包含在其中
}


太垃圾，直接写就完了





链路追踪
这些都写完了，只不过不配置的话，默认基本配置 nil 处理



### gRPC

# 生成业务代码
  
  pb/ 目录下
  $ goctl rpc protoc *.proto --go_out=../ --go-grpc_out=../  --zrpc_out=../ --style=go_zero


# 独立调试 gRPC

  BloomRPC

# 