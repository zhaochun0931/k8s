echo "This script will install k8s on ubuntu 22.04"


echo "download the install script"
wget https://raw.githubusercontent.com/zhaochun0931/k8s/main/k8s-install/00-crio-install.sh
wget https://raw.githubusercontent.com/zhaochun0931/k8s/main/k8s-install/02-k8s-install-ubuntu.sh
wget https://raw.githubusercontent.com/zhaochun0931/k8s/main/k8s-install/03-init-k8s.sh


echo "begin to install the k8s"
bash 00-crio-install.sh
bash 02-k8s-install-ubuntu.sh
bash 03-init-k8s.sh





kubectl apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml




echo "K8s installation is successfully and ready"



rm 00-crio-install.sh
rm 02-k8s-install-ubuntu.sh
rm 03-init-k8s.sh

