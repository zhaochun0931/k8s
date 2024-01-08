
we’re talking about the Service REST object in the Kubernetes API. Just like a Pod, ReplicaSet, or Deployment, a Kubernetes Service is an object in the API that we define in a manifest and POST to the API server.

every Service gets its own stable IP address, DNS name, and port.

Service uses labels to dynamically associate with a set of Pods.









kubectl create deployment hello-server --image=gcr.io/google-samples/hello-app:1.0 --replicas=3
kubectl create deployment hello-server --image=gcr.io/google-samples/hello-app:2.0 --replicas=3

kubectl expose deployment hello-server --name=hello-server-svc-np --type NodePort

kubectl expose deployment hello-server --name=hello-server-svc-cip --port=80
