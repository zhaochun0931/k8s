If you deploy a pod without the service account and list the pods, you will get the following error.






/ # hostname
pod-without-sa
/ #
/ # kubectl get pods
Error from server (Forbidden): pods is forbidden: User "system:serviceaccount:default:default" cannot list resource "pods" in API group "" in the namespace "default"
/ #


The default service account that gets attached to pods doesn’t have any API access to resources.












if you attach your own SA to this pod, you are able to run the 'kubectl get' command


/ # hostname
pod-with-sa
/ #
/ # kubectl get pods
NAME             READY   STATUS    RESTARTS   AGE
pod-with-sa      1/1     Running   0          2m22s
pod-without-sa   1/1     Running   0          110s
/ #












kubectl run pod-without-sa --image=arm64v8/alpine --command sleep -- 24h











