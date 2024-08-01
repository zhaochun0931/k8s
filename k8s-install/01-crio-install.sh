# will install crio in Ubuntu 22.04

# https://cri-o.io/



apt-get update
apt-get install cri-o cri-o-runc -y
# apt show cri-o

rm /etc/cni/net.d/100-crio-bridge.conflist
rm /etc/cni/net.d/200-loopback.conflist

cat /etc/crio/crio.conf


# must start the crio service before k8s initialization

apt install cri-tools
crictl info
crio-status config

crio --version


# /etc/crictl.yaml











