kubectl create deployment hello-server --image=gcr.io/google-samples/hello-app:1.0 --replicas=3
kubectl create deployment hello-server --image=gcr.io/google-samples/hello-app:2.0 --replicas=3

kubectl expose deployment hello-server --name=hello-server-svc-np --type NodePort

kubectl expose deployment hello-server --name=hello-server-svc-cip --port=80
