# this script will install the latst crio 

# configure the pre-requsite before installing the CRIO

# Enable IPv4 packet forwarding, it persist acrosss reboot
sysctl net.ipv4.ip_forward
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
sysctl -p /etc/sysctl.conf



# The br_netfilter Linux kernel module controls networking, and is useful for bridging traffic between network interfaces
# This module is required to enable transparent masquerading and to facilitate Virtual Extensible LAN (VxLAN) traffic for communication between Kubernetes pods across the cluster

modprobe overlay
modprobe br-netfilter

# persist across reboot
# Kubernetes requires that packets traversing a network bridge are processed for filtering and for port forwarding.
echo "net.bridge.bridge-nf-call-iptables=1" >> /etc/sysctl.conf
echo "net.bridge.bridge-nf-call-ip6tables=1" >> /etc/sysctl.conf


sysctl -p
sysctl -p /etc/sysctl.conf






# begin to install the CRIO




# Install dependencies for adding the repositories
apt-get update
apt-get install -y software-properties-common curl
apt-get install -y apt-transport-https ca-certificates curl gpg

# Add the CRI-O repository


curl -fsSL https://pkgs.k8s.io/addons:/cri-o:/prerelease:/main/deb/Release.key |
    gpg --dearmor -o /etc/apt/keyrings/cri-o-apt-keyring.gpg
echo "deb [signed-by=/etc/apt/keyrings/cri-o-apt-keyring.gpg] https://pkgs.k8s.io/addons:/cri-o:/prerelease:/main/deb/ /" |
    tee /etc/apt/sources.list.d/cri-o.list





# Install the CRIO packages
apt-get update
apt-get install -y cri-o
systemctl start crio.service

crio --version




# Up till now, the CRIO is installed successfully













