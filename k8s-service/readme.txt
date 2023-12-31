
we’re talking about the Service REST object in the Kubernetes API. Just like a Pod, ReplicaSet, or Deployment, a Kubernetes Service is an object in the API that we define in a manifest and POST to the API server.

every Service gets its own stable IP address, DNS name, and port.

Service uses labels to dynamically associate with a set of Pods.


Pods and Services are loosely coupled via labels and label selectors.


For a Service to match a set of Pods, and therefore provide stable networking and load-balance, it only needs to match some of the Pods labels.





Each Service that is created automatically gets an associated Endpoint object. This Endpoint object is a dynamic list of all of the Pods that match the Service’s label selector.



When we create a Service object, Kubernetes automatically creates an internal DNS mapping for it. 
This maps the name of the Service to a VIP. For example, if you create a Service called “hellcat-svc”, Pods in the cluster will be able to resolve “hellcat-svc” to the Service’s VIP. 
Therefore, as long as you know the name of a Service, you will be able to connect to it by name.



kubectl create deployment hello-server --image=gcr.io/google-samples/hello-app:1.0 --replicas=3
kubectl create deployment hello-server --image=gcr.io/google-samples/hello-app:2.0 --replicas=3

kubectl expose deployment hello-server --name=hello-server-svc-np --type NodePort

kubectl expose deployment hello-server --name=hello-server-svc-cip --port=80
