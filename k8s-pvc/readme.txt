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


# manually delete pvc, it will also automatically delete the pv 
kubectl delete pvc my-pvc










In Kubernetes, deleting a Pod does not automatically delete the associated PersistentVolumeClaim (PVC). The PVC will remain intact even after the Pod is deleted. If you want to delete the PVC automatically when the Pod is deleted, you can use a feature called "OwnerReferences" in Kubernetes.

By setting up OwnerReferences between the Pod and the PVC, you can establish a parent-child relationship where the PVC is owned by the Pod. When the Pod is deleted, Kubernetes will automatically delete any resources that are owned by it, including the PVC.



