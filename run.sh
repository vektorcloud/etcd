#!/bin/bash

function output() {
  echo -ne '[\033[34metcd-wrapper\033[m] '
  echo $@
}

output "starting etcd..."
/bin/etcd $@
output "exited"
