#! /usr/bin/bash 
MAIN_APP_FILE="$( cat /mnt/c/users/shaqtee/desktop/adi-catatan/kuber-test/php_apache-kubernetes/main_app/nfs-pv.yml )"
MYSQL_FILE="$( cat /mnt/c/users/shaqtee/desktop/adi-catatan/kuber-test/php_apache-kubernetes/mysql/nfs-mysql.yml )"
TARGET_IP=`echo "${MAIN_APP_FILE}" | grep -Eo "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"`
TARGET_IP2=`echo "${MYSQL_FILE}" | grep -Eo "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"`
REPLACE_IP=`ip addr | grep eth0 | grep inet | awk '{print $2}' | awk 'BEGIN{FS="/"} {print $1}'`
`sed -ie 's/'$TARGET_IP'/'$REPLACE_IP'/g' /mnt/c/users/shaqtee/desktop/adi-catatan/kuber-test/php_apache-kubernetes/main_app/nfs-pv.yml` sudo 2>/dev/null
`rm /mnt/c/users/shaqtee/desktop/adi-catatan/kuber-test/php_apache-kubernetes/main_app/nfs-pv.ymle` sudo 2>/dev/null
`sed -ie 's/'$TARGET_IP2'/'$REPLACE_IP'/g' /mnt/c/users/shaqtee/desktop/adi-catatan/kuber-test/php_apache-kubernetes/mysql/nfs-mysql.yml` sudo 2>/dev/null
`rm /mnt/c/users/shaqtee/desktop/adi-catatan/kuber-test/php_apache-kubernetes/mysql/nfs-mysql.ymle` sudo 2>/dev/null
PASSWORDKU=123qweasd
echo $PASSWORDKU | sudo -S service rpcbind restart
echo $PASSWORDKU | sudo -S service nfs-kernel-server start
alias kubectl=/usr/local/bin/kubectl
kubectl apply -f /mnt/c/users/shaqtee/desktop/adi-catatan/kuber-test/php_apache-kubernetes/mysql/nfs-mysql.yml
kubectl apply -f /mnt/c/users/shaqtee/desktop/adi-catatan/kuber-test/php_apache-kubernetes/mysql/mysql-workload.yml
kubectl apply -f /mnt/c/users/shaqtee/desktop/adi-catatan/kuber-test/php_apache-kubernetes/mysql/phpmyadmin-workload.yml
kubectl apply -f /mnt/c/users/shaqtee/desktop/adi-catatan/kuber-test/php_apache-kubernetes/main_app/nfs-pv.yml
kubectl apply -f /mnt/c/users/shaqtee/desktop/adi-catatan/kuber-test/php_apache-kubernetes/main_app/nfs-pvc.yml
kubectl apply -f /mnt/c/users/shaqtee/desktop/adi-catatan/kuber-test/php_apache-kubernetes/main_app/php_deployment.yaml
