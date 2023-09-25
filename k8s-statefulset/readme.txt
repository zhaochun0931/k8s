

https://loft.sh/blog/kubernetes-statefulset-examples-and-best-practices/






kubectl exec --stdin --tty mysql-client -- sh


apk add mysql-client

apk add --no-cache mariadb-connector-c-dev








kubectl exec -it mysql-client -- /bin/sh

mysql -u root -p -h mysql-set-0.mysql.default.svc.cluster.local

mysql -u root -p -h mysql-set-0.mysql
