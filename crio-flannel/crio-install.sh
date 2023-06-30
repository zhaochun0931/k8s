
# https://cri-o.io/


sysctl net.ipv4.ip_forward
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
sysctl -p /etc/sysctl.conf



modprobe overlay
modprobe br-netfilter

echo "net.bridge.bridge-nf-call-iptables=1" >> /etc/sysctl.conf
echo "net.bridge.bridge-nf-call-ip6tables=1" >> /etc/sysctl.conf


sysctl -p
sysctl -p /etc/sysctl.conf





export OS=xUbuntu_22.04
export VERSION=1.27

echo "deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/ /" > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list
echo "deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable:/cri-o:/$VERSION/$OS/ /" > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable:cri-o:$VERSION.list

curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable:/cri-o:/$VERSION/$OS/Release.key | apt-key add -
curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/Release.key | apt-key add -

apt-get update
apt-get install cri-o cri-o-runc -y
# apt show cri-o

rm /etc/cni/net.d/100-crio-bridge.conflist
rm /etc/cni/net.d/200-loopback.conflist

cat /etc/crio/crio.conf


systemctl enable crio.service
systemctl start crio.service
#systemctl status crio

apt install cri-tools
crictl info
crio-status config



# /etc/crictl.yaml











