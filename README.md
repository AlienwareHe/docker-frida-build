# 介绍
由于Frida编译需要node.js/python/ndk，不同版本frida可能编译环境不一样，为了方便编译环境，通过docker一键进行编译，同时结合[hluda patch](https://github.com/feicong/strong-frida)对Frida特征进行一定程度的修改。

# 使用方式
1. 构建docker-frida镜像
> docker build . -t alienhe/docker-frida
2. 创建docker-frida容器
> docker run -it alienhe/docker-frida /bin/bash
3. 进入docker容器后，执行sh下的patch_frida.sh应用补丁
4. 编译frida