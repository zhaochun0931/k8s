# Define the Kubernetes version and used CRI-O stream
KUBERNETES_VERSION=v1.32
CRIO_VERSION=v1.32


# Add the Kubernetes repository
cat <<EOF | tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/$KUBERNETES_VERSION/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/$KUBERNETES_VERSION/rpm/repodata/repomd.xml.key
EOF



# Add the CRI-O repository
cat <<EOF | tee /etc/yum.repos.d/cri-o.repo
[cri-o]
name=CRI-O
baseurl=https://download.opensuse.org/repositories/isv:/cri-o:/stable:/$CRIO_VERSION/rpm/
enabled=1
gpgcheck=1
gpgkey=https://download.opensuse.org/repositories/isv:/cri-o:/stable:/$CRIO_VERSION/rpm/repodata/repomd.xml.key
EOF


# Install package dependencies from the official repositories
dnf install -y container-selinux


# Install the packages
dnf install -y cri-o kubelet kubeadm kubectl


# Start CRI-O
systemctl start crio.service
systemctl enable crio.service


# Bootstrap a cluster
swapoff -a
modprobe br_netfilter
sysctl -w net.ipv4.ip_forward=1

# initilize the k8s cluster



# journalctl -u crio
# journalctl -xeu kubelet
