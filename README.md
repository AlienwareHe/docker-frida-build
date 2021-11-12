# 使用方式
1. 构建docker-frida镜像
> docker build . -t alienhe/docker-frida
2. 创建docker-frida容器
> docker run -it alienhe/docker-frida /bin/bash
3. 进入docker容器后，执行sh下的patch_frida.sh应用补丁
4. 编译frida