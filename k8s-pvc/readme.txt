In this configuration, we have a PersistentVolumeClaim (PVC) named "my-pvc" that requests 1Gi of storage. The Pod "my-pod" uses this PVC to mount a PersistentVolume to the container at the path "/data". 
This setup allows you to use the PV with the pod without deleting the PV itself.


kubectl exec -it my-pod -- bash
cd /data
touch xxx


# kubetctl get pvc
NAME     STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS   AGE
my-pvc   Bound    pvc-9b6d0d2b-0c37-4309-b8d2-745ef0395ca0   1Gi        RWO            hostpath       7m34s
$

$ kubetctl get pv
NAME                                       CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM            STORAGECLASS   REASON   AGE
pvc-9b6d0d2b-0c37-4309-b8d2-745ef0395ca0   1Gi        RWO            Delete           Bound    default/my-pvc   hostpath                7m39s
$
