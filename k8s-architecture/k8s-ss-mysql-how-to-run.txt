https://loft.sh/blog/kubernetes-statefulset-examples-and-best-practices/




# log into the mysql client
kubectl exec -it mysql-client-8645ddbf5d-trfq5 -- bash


# run below commands

mysql -u root -p -h mysql-svc

mysql -u root -p -h mysql-svc.default.svc.cluster.local





