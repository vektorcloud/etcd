FROM quay.io/vektorcloud/base:latest

ENV ETCD_VERSION v2.2.4

RUN apk add --no-cache ca-certificates openssl && \
    wget https://github.com/coreos/etcd/releases/download/${ETCD_VERSION}/etcd-${ETCD_VERSION}-linux-amd64.tar.gz && \
    tar xzvf etcd-${ETCD_VERSION}-linux-amd64.tar.gz && \
    mv etcd-${ETCD_VERSION}-linux-amd64/etcd* /bin/ && \
    rm -Rf etcd-${ETCD_VERSION}-linux-amd64*

COPY run.sh /run.sh

VOLUME      /data
EXPOSE      2379 2380 4001 7001
ENTRYPOINT  ["/run.sh"]
