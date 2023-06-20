
# https://cri-o.io/


sysctl net.ipv4.ip_forward
sysctl -w net.ipv4.ip_forward=1


modprobe overlay
modprobe br-netfilter
sysctl -w net.bridge.bridge-nf-call-iptables=1
sysctl -w net.bridge.bridge-nf-call-ip6tables=1


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














apt show cri-o


systemctl enable crio.service
systemctl start crio.service
systemctl status crio





apt install cri-tools


crictl info

# crictl info
{
  "status": {
    "conditions": [
      {
        "type": "RuntimeReady",
        "status": true,
        "reason": "",
        "message": ""
      },
      {
        "type": "NetworkReady",
        "status": false,
        "reason": "NetworkPluginNotReady",
        "message": "Network plugin returns error: No CNI configuration file in /etc/cni/net.d/. Has your network provider started?"
      }
    ]
  },
  "config": {
    "sandboxImage": "registry.k8s.io/pause:3.6"
  }
}
#




crictl pull nginx
crictl pull hello-world
crictl pull busybox

crictl images
crictl ps






/etc/cni/net.d/100-crio-bridge.conflist
