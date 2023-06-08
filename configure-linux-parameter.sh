
# enable the ip_forward feature
cat /proc/sys/net/ipv4/ip_forward


swapoff -a

cp /etc/containerd/config.toml /etc/containerd/config.toml.backup
rm /etc/containerd/config.toml
systemctl restart containerd






docker info  | egrep -i 'cgroup driver'

cat << done > /etc/docker/daemon.json

{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
  "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
done

systemctl restart docker.service

docker info  | egrep -i 'cgroup driver'


#  Cgroup Driver: systemd
