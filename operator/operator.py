import kopf
from kubernetes import client, config

# Load kubeconfig (works inside/outside cluster)
config.load_kube_config()

apps_v1 = client.AppsV1Api()


# -----------------------------
# Create handler
# -----------------------------
@kopf.on.create('myapp.example.com', 'v1', 'myapps')
def create_myapp(spec, name, namespace, logger, patch, **kwargs):
    replicas = spec.get("replicas", 1)
    image = spec.get("image", "nginx")
    msg = spec.get("message", "Hello")

    logger.info(f"Creating Deployment {name} with {replicas} replicas and image {image}")

    deployment = client.V1Deployment(
        metadata=client.V1ObjectMeta(name=name, namespace=namespace),
        spec=client.V1DeploymentSpec(
            replicas=replicas,
            selector=client.V1LabelSelector(match_labels={"app": name}),
            template=client.V1PodTemplateSpec(
                metadata=client.V1ObjectMeta(labels={"app": name}),
                spec=client.V1PodSpec(
                    containers=[client.V1Container(
                        name=name,
                        image=image
                    )]
                )
            )
        )
    )

    try:
        apps_v1.create_namespaced_deployment(namespace=namespace, body=deployment)
        logger.info(f"Deployment {name} created")
        patch.status['create_myapp'] = {"message": f"MyApp {name} created with Deployment!"}
    except client.exceptions.ApiException as e:
        logger.error(f"Failed to create Deployment: {e}")


# -----------------------------
# Update handler
# -----------------------------
@kopf.on.update('myapp.example.com', 'v1', 'myapps')
def update_myapp(spec, name, namespace, logger, patch, **kwargs):
    replicas = spec.get("replicas", 1)
    image = spec.get("image", "nginx")
    msg = spec.get("message", "Hello")

    logger.info(f"Updating Deployment {name}: replicas={replicas}, image={image}")

    # Patch the Deployment
    deployment_patch = {
        "spec": {
            "replicas": replicas,
            "template": {
                "spec": {
                    "containers": [{"name": name, "image": image}]
                }
            }
        }
    }

    try:
        apps_v1.patch_namespaced_deployment(name=name, namespace=namespace, body=deployment_patch)
        patch.status['create_myapp'] = {"message": f"MyApp {name} updated with Deployment!"}
        logger.info(f"Deployment {name} updated")
    except client.exceptions.ApiException as e:
        logger.error(f"Failed to update Deployment: {e}")


# -----------------------------
# Delete handler
# -----------------------------
@kopf.on.delete('myapp.example.com', 'v1', 'myapps')
def delete_myapp(name, namespace, logger, **kwargs):
    logger.info(f"MyApp {name} deleted from {namespace}")

    try:
        apps_v1.delete_namespaced_deployment(name=name, namespace=namespace)
        logger.info(f"Deployment {name} deleted")
    except client.exceptions.ApiException as e:
        logger.error(f"Failed to delete Deployment: {e}")
