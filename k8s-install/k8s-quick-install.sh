wget https://raw.githubusercontent.com/zhaochun-vmware/k8s/main/k8s-install/01-crio-install.sh

wget https://raw.githubusercontent.com/zhaochun-vmware/k8s/main/k8s-install/02-k8s-install-ubuntu.sh

bash 01-crio-install.sh

bash 02-k8s-install-ubuntu.sh

kubeadm init --pod-network-cidr=10.244.0.0/16




for i in $(echo $HOSTNAME)
do
kubectl taint nodes $i node-role.kubernetes.io/control-plane:NoSchedule-
done

