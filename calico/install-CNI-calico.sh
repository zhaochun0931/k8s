curl https://raw.githubusercontent.com/projectcalico/calico/v3.29.2/manifests/calico.yaml -O

kubectl apply -f calico.yaml


kubectl get ippools




ls -al /etc/cni/net.d/calico-kubeconfig
ls -al /etc/cni/net.d/10-calico.conflist

