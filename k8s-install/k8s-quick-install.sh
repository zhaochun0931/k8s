echo "This script will install k8s on ubuntu 22.04"

wget https://raw.githubusercontent.com/zhaochun0931/k8s/main/k8s-install/01-crio-install.sh


wget https://raw.githubusercontent.com/zhaochun0931/k8s/main/k8s-install/02-k8s-install-ubuntu.sh

bash 01-crio-install.sh

bash 02-k8s-install-ubuntu.sh

kubeadm init --pod-network-cidr=10.244.0.0/16


mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config



kubectl apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml


for i in $(echo $HOSTNAME)
do
kubectl taint nodes $i node-role.kubernetes.io/control-plane:NoSchedule-
done


kubectl get nodes
