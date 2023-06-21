# https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/


apt-get update
apt-get install -y apt-transport-https ca-certificates curl -y


curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /etc/apt/keyrings/kubernetes-archive-keyring.gpg

echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" |  tee /etc/apt/sources.list.d/kubernetes.list


apt-get update
apt-get install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl

kubeadm version

systemctl status kubelet

kubeadm config print init-defaults


echo "alias k=kubectl" >> /$HOME/.bash_profile
source  /$HOME/.bash_profile

