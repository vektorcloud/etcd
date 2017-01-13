FROM quay.io/vektorcloud/base:3.4

ENV VERSION v2.2.4

RUN apk add --no-cache ca-certificates openssl bash && \
    wget https://github.com/coreos/etcd/releases/download/${VERSION}/etcd-${VERSION}-linux-amd64.tar.gz && \
    tar xzvf etcd-${VERSION}-linux-amd64.tar.gz && \
    mv etcd-${VERSION}-linux-amd64/etcd* /bin/ && \
    rm -Rf etcd-${VERSION}-linux-amd64*

COPY run.sh /run.sh

VOLUME      /data
EXPOSE      2379 2380 4001 7001
ENTRYPOINT  ["/run.sh"]
