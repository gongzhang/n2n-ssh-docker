# SSH with n2n connection

> 在 macOS 11 以前，可以直接使用 [n2n](https://github.com/ntop/n2n) 的 `edge` 命令。不过由于其依赖的 [TunTap](http://tuntaposx.sourceforge.net/) 无法在 macOS 11 上继续使用，所以利用 Docker 临时解决一下，做了这个镜像。

## Usage

```sh
# example:
docker run --rm -it --privileged \
  -e ADDRESS=10.1.1.8 \
  -e COMMUNITY=mynetwork \
  -e KEY=encryptme \
  -e SUPERNODE=a.b.c.d:xyw \
  -e PINGCHECK=10.1.1.1 \
  -v $HOME/.ssh:/root/.ssh \
  gongzhang/n2n-ssh ssh root@10.1.1.1


# equivalent to:
edge -c mynetwork -k encryptme -a 10.1.1.8 -l a.b.c.d:xyw
ping 10.1.1.1
ssh root@10.1.1.1
```
