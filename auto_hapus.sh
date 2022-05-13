#! /usr/bin/bash
alias kubectl=/usr/local/bin/kubectl
kubectl delete -f /mnt/c/users/shaqtee/desktop/adi-catatan/kuber-test/php_apache-kubernetes/mysql/phpmyadmin-workload.yml
kubectl delete -f /mnt/c/users/shaqtee/desktop/adi-catatan/kuber-test/php_apache-kubernetes/mysql/mysql-workload.yml
kubectl delete -f /mnt/c/users/shaqtee/desktop/adi-catatan/kuber-test/php_apache-kubernetes/mysql/nfs-mysql.yml
kubectl delete -f /mnt/c/users/shaqtee/desktop/adi-catatan/kuber-test/php_apache-kubernetes/main_app/php_deployment.yaml
kubectl delete -f /mnt/c/users/shaqtee/desktop/adi-catatan/kuber-test/php_apache-kubernetes/main_app/nfs-pvc.yml
kubectl delete -f /mnt/c/users/shaqtee/desktop/adi-catatan/kuber-test/php_apache-kubernetes/main_app/nfs-pv.yml
