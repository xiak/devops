#!/bin/bash

# Copyright 2021 xiak.com
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file creates release artifacts (tar files, container images) that are
# ready to distribute to install or distribute to end users.


#if [ "$#" -lt 1 ] || [ "${1}" == "--help" ]; then
#  cat <<EOF
#
#Description:
#Init kubernetes cluster
#
#Usage: $(basename "$0") <loadblancer VIP>
#  <loadblancer VIP>          etcd and kubernetes api server loadblancer
#
#Examples:
#  $(basename "$0") 10.10.10.10
#
#EOF
#  exit 1
#fi

function new::etchosts() {
    fmt::info "Write kubernetes infra into /etc/hosts"
    cat > /etc/hosts <<EOF
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
10.198.137.91    k8s-bastion
10.198.137.93    k8s-master-1
10.198.137.94    k8s-master-2
10.198.137.95    k8s-master-3
10.198.137.96    k8s-slb-1
10.198.137.97    k8s-slb-2
10.198.137.98    k8s-slb-3
10.198.137.171   k8s-etcd-1
10.198.137.172   k8s-etcd-2
10.198.137.173   k8s-etcd-3
10.198.151.55    k8s-ceph-1
10.198.151.56    k8s-ceph-2
10.198.151.65    k8s-ceph-3
10.198.151.66    k8s-ceph-4
10.198.151.75    k8s-ceph-5
10.198.151.76    k8s-ceph-6
10.198.151.85    k8s-ceph-7
10.198.138.96    k8s-report
10.198.138.150   k8s-dnd
10.198.138.151   k8s-cp
10.198.138.152   k8s-dp
10.198.138.153   k8s-dash
10.198.138.154   k8s-ceph-dashboard
10.198.138.155   k8s-git
10.198.138.156   k8s-hub
10.198.138.158   k8s-infra
EOF
    cat /etc/hosts
    fmt::ok "ok"
}

new::etchosts