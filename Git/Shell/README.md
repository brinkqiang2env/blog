# 自述



## create_git_server.sh

> 一键创建git中心仓库并自动部署 (输出文件到指定目录)

### 要求

- 已安装 git
- 已安装并启动 openssh-server **(linux桌面版)**

### 使用

> 添加可执行权限并运行即可
>
> [注意] 输出的目录必须是git用户和git组, 且不能低于755的权限

```bash
chmod +x create_git_server.sh && sh create_git_server.sh
```

