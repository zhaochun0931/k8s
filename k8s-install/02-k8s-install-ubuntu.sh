# install k8s on ubuntu linux

# https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/










# install Kubernetes v1.27



sudo apt-get update

sudo apt-get install -y apt-transport-https ca-certificates curl

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.27/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.27/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl





kubeadm version

# systemctl status kubelet

# kubeadm config print init-defaults


echo "alias k=kubectl" >> $HOME/.bash_profile
source $HOME/.bash_profile

echo 



