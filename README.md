# Kubernetes Config for Apache, PhpApp & MySQL with NFS.

Simpel project untuk konfigurasi kubernetes Phpapp & MySQL dengan NFS(Network File System).

## Langkah

- `apt install nfs-kernel-server nfs-common`

- Get NFS IP `wsl hostname -I`

## etc/exports

```linux
/srv/nfs/laramysql/ *(rw,sync,no_subtree_check,insecure)
/srv/nfs/db_dataku/ *(rw,sync,no_root_squash,no_subtree_check,insecure)
```

- apply `exportfs -rav`
- reload 1 `sudo service rpcbind restart`
- reload 2 `sudo service nfs-kernel-server start`
- check `exportfs -v`

## Struktur Folder

```
  mkdir /srv/nfs/laramysql/app -p
  sudo chown -R 82:82 .

  mkdir /srv/nfs/db_mysql/ -p
```

## Cek Lagi

- lokasi temp files di folder public `.user.ini` , `.htaccess` , `php.ini`
- .htaccess to edit `a2enmod rewrite && service apache2 reload`
- change user inside container `su -s /bin/sh www-data`
- back to root user `ctrl d`
- check user uid linux `cat /etc/passwd`
- kubectl logs `pod_name` get IP jika ada warning.
- append /etc/apache2/apache2.conf example : `ServerName 172.10.5.20`

## Lounch Kubernetes & Deleting Test

```
kubectl apply -f nfs-mysql.yml,mysql-workload.yml,phpmyadmin-workload.yml
kubectl delete -f nfs-mysql.yml,mysql-workload.yml,phpmyadmin-workload.yml

kubectl apply -f nfs-pv.yml,nfs-pvc.yml,php_deployment.yaml`
kubectl delete -f nfs-pv.yml,nfs-pvc.yml,php_deployment.yaml`
```
