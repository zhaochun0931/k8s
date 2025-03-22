# you must specify the --pod-network-cidr option when using the flannel otherwise it will not create the file  /run/flannel/subnet.env
kubeadm init --pod-network-cidr=10.244.0.0/16





# you can just use the following command when using the calico
kubeadm init


kubelet --version

kubeadm version

kubectl version












# install local-path PVC driver
kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/master/deploy/local-path-storage.yaml
kubectl annotate storageclass local-path storageclass.kubernetes.io/is-default-class=true



# let the master node run the pod
for i in $(echo $HOSTNAME)
do
kubectl taint nodes $i node-role.kubernetes.io/control-plane:NoSchedule-
done




# Up till now, the k8s cluster is ready







# configuration file
# /etc/kubernetes/manifests/etcd.yaml
# /etc/kubernetes/manifests/kube-apiserver.yaml
# /etc/kubernetes/manifests/kube-controller-manager.yaml
# /etc/kubernetes/manifests/kube-scheduler.yaml










