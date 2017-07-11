FROM quay.io/vektorcloud/base:3.6

ENV ETCD_VER v3.2.2
ENV ETCD_DATA_DIR /data

RUN apk add --no-cache ca-certificates openssl && \
    wget https://github.com/coreos/etcd/releases/download/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz && \
    tar xzvf etcd-${ETCD_VER}-linux-amd64.tar.gz && \
    mv etcd-${ETCD_VER}-linux-amd64/etcd* /bin/ && \
    rm -Rf etcd-${ETCD_VER}-linux-amd64*

COPY etcd-wrapper /etcd-wrapper

VOLUME      /data
EXPOSE      2379 2380
ENTRYPOINT  ["/bin/etcd"]
