# etcd

![circleci][circleci]

Alpine-based etcd image

## Bootstrapping a cluster

A `docker-compose` file is included with this repo to easily bootstrap an etcd cluster within a dedicated docker overlay network:

```bash
export ETCD_DISCOVERY=$(curl -s discovery.etcd.io/new)
docker-compose up -d && docker-compose scale etcd=3
```

[circleci]: https://img.shields.io/circleci/project/github/vektorcloud/etcd.svg "etcd"
