# Integrate ceph with kubernetes

## ceph filesystem
获取 mount 需要的 secret
mkdir /cephfs
secret_string=$(ceph auth get-key client.admin)
mount -t ceph  10.1.1.62:6789:/ /cephfs/ -o name=admin,secret=${secret_string}
mount -t ceph  10.98.151.55:6789,10.98.151.56:6789,10.98.151.65:6789:/ /ceph/ -o name=admin,secret=AQDgKjVfXYbzKBAABOQ0Ii4iS0OsbUB4lmLb8w==

## how to get secret key
获取 kubernetes 需要的 secret, 区别是要经过 base64 转码
ceph auth get-key client.admin | base64



cat ceph.client.admin.keyring 2>&1 |grep "key = " |awk '{print  $3'} |xargs echo -n > ceph.admin.secret

kubectl create secret generic ceph-admin-secret --from-file=ceph.admin.secret --namespace=kube-system


CEPHFS 

先mount 建立以下文件夹

```$xslt

```