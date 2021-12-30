# 介绍
由于Frida编译需要node.js/python/ndk，不同版本frida可能编译环境不一样，为了方便编译环境，通过docker一键进行编译，同时结合[hluda patch](https://github.com/feicong/strong-frida)对Frida特征进行一定程度的修改。

# 目前支持版本
由于各个版本Frida和patch文件都会有所变化，因此需要一定兼容。
- 14.2.3

# 使用方式
0. **选择版本分支，分支号对应frida版本**
1. 构建docker-frida镜像
> docker build . -t alienhe/docker-frida
2. 创建docker-frida容器
> docker run -it alienhe/docker-frida /bin/bash
3. 进入docker容器后，执行sh下的patch_frida.sh应用补丁
4. 编译frida


# 当前分支对应Frida版本
