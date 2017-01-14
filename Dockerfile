FROM quay.io/vektorcloud/base:3.4

ENV ETCD_VER v3.0.16

RUN apk add --no-cache ca-certificates openssl bash && \
    wget https://github.com/coreos/etcd/releases/download/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz && \
    tar xzvf etcd-${ETCD_VER}-linux-amd64.tar.gz && \
    mv etcd-${ETCD_VER}-linux-amd64/etcd* /bin/ && \
    rm -Rf etcd-${ETCD_VER}-linux-amd64*

COPY run.sh /run.sh

VOLUME      /data
EXPOSE      2379 2380 4001 7001
ENTRYPOINT  ["/run.sh"]
