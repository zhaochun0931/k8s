# you must specify the --pod-network-cidr option when using the flannel otherwise it will not create the file  /run/flannel/subnet.env
kubeadm init --pod-network-cidr=10.244.0.0/16





# you can just use the following command when using the calico
kubeadm init


kubelet --version

kubeadm version

kubectl version





# To start using your cluster, you need to run the following as a regular user:

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config



  
# only install network plugin in the master node
# kubectl apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml



# it will generate below file 
# /etc/cni/net.d/10-flannel.conflist








# install local-path PVC driver
kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/master/deploy/local-path-storage.yaml
kubectl annotate storageclass local-path storageclass.kubernetes.io/is-default-class=true



# let the master node run the pod
for i in $(echo $HOSTNAME)
do
kubectl taint nodes $i node-role.kubernetes.io/control-plane:NoSchedule-
done




# Up till now, the k8s cluster is ready









for i in $(echo $HOSTNAME)
do
kubectl describe node $i
done




kubectl get nodes













# configuration file
# /etc/kubernetes/manifests/etcd.yaml
# /etc/kubernetes/manifests/kube-apiserver.yaml
# /etc/kubernetes/manifests/kube-controller-manager.yaml
# /etc/kubernetes/manifests/kube-scheduler.yaml










