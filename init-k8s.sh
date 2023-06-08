kubeadm init --pod-network-cidr=10.244.0.0/16


# only install network plugin in the master node
kubectl apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml
