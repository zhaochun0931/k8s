kubectl apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml




echo "FLANNEL_NETWORK=10.244.0.0/16
FLANNEL_SUBNET=10.244.0.1/24
FLANNEL_MTU=1450
FLANNEL_IPMASQ=true" | sudo tee /run/flannel/subnet.env
