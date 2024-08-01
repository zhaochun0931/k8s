# install k8s on Ubuntu linux 22.04

# https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/




sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl



# Add the Kubernetes repository

# v1.28
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /" | tee /etc/apt/sources.list.d/kubernetes.list

# v1.30
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list


apt-get update
apt-get install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl
    






kubeadm version

# systemctl status kubelet

# kubeadm config print init-defaults


echo "alias k=kubectl" >> $HOME/.bash_profile
source $HOME/.bash_profile

echo 



# up till now, the k8s is installed successfully



