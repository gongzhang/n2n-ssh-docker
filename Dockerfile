FROM gongzhang/n2n:v2.4-alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk --no-cache --update add openssh

WORKDIR /root
COPY entrypoint.sh ./
RUN chmod +x entrypoint.sh

ENV MTU=1200 \
    ADDRESS=n2n_local_ip \
    COMMUNITY=n2n_community \
    KEY=n2n_encrypt_key \
    SUPERNODE=n2n_supernode \
    PINGCHECK=

VOLUME [ "/root/.ssh" ]

ENTRYPOINT [ "./entrypoint.sh" ]
CMD [ "sh" ]
