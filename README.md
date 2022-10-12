# Overview
https://shipit.dev/posts/kubernetes-overview-diagrams.html

# Run Cluster Locally
## Install minikube CLI
https://minikube.sigs.k8s.io/docs/start/

| Command                                         | Definition | 
|-------------------------------------------------|---|
| `minikube start -p demo --vm-driver=virtualbox` | Start Cluster named Demo. If none exists it will be one created. | 
| `minikube status -p demo`                       | Verify current Minikube Status |
| `minikube stop -p demo`                         | Stop Cluster |
| `minikube profile list` | List available local clusters | 
| `minikube service homepage-svc -p demo --url` | Exposes NodePort as URL |

## Other Options
| Tool | Link                               | 
|------|------------------------------------| 
| Minikube | https://minikube.sigs.k8s.io/docs/ |
| Kind | **K**ubernetes **in** **D**ocker   |
| K3S | 

# Kuberentes Resources

| Resource              | Description                                                                                      | References                                     | 
|-----------------------|--------------------------------------------------------------------------------------------------|------------------------------------------------|
| ConfigMap             | Key-Value Map for any Kind of Data (eg. Scripts, Configuration Files, Key-Value Pairs).          | -                                              |
| Secrets               | Same as ConfigMap. Data is encrypted (base64). RBAC could be configured separated.               | -                                              |
| Pod                   | Smallest deployable Unit in Kuberenets                                                           | * Container <br> * Volume Mounts <br>          |
| Deployment            | Manages Pods. Random Pod Names. Deployment Strategy (Rolling, Recreate)                          | * Pod Template <br> * ConfigMap <br> * Secrets |
| Statefulset           | Manages Pods. Numbered Pods (Names are re-used). Useful for any kind of Clusters                 | * Pod Template <br> * ConfigMap <br> * Secrets |
| PersistentVolumeClaim | Request for a Persistent Volume                                                                  | StorageClass                                   |
| StorageClass          | Definition of the storage eg. SSD, HDD, resizable...                                             | -                                              |
| Service               | Exposes Port on Pods. Acts as an Load-Balancer (internal). used as an DNS                        | * Pod                                          |
| Ingress               | Exposes an Service Available through an HTTP Reverse Proxy (eg. nginx)                           | * Service                                      |
| ServiceAccount        | named user.                                                                                      |                                                |
| (Cluster)Role         | permission to specific Kubernetes Resources                                                      |                                                |
| (Cluster)Rolebinding  | connects Role and ServiceAccount                                                                 | * ServiceAccount <br> * Role                   |
| Job                   | executes an image (or multiple) and shutsdown afterwards. can be used to execute tasks on behalf | Pod Template                                   |
| CronJob               | executes an image (or multiple) at an specific time                                              | Pod Template                                   |


## Commands
See Command overview: https://kubernetes.io/docs/reference/kubectl/

### Run NGINX Image
`kubectl run nginx-example --image nginx`

`kubectl apply -f pod.yaml`
```yaml
apiVersion: v1
kind: Pod
metadata:
  labels:
    run: nginx-example
  name: nginx-example
spec:
  containers:
  - image: nginx
    name: nginx-example
```

### Expose Service 
`kubectl expose pod/nginx-example --port=8080 --target-port=80`

`kubectl apply -f service.yaml`
```yaml
apiVersion: v1
kind: Service
metadata:
  labels:
    run: nginx-example
  name: nginx-example
spec:
  ports:
  - port: 8080
    protocol: TCP
    targetPort: 80
  selector:
    run: nginx-example
  type: ClusterIP
```

### Access Application through Tunnel
`kubectl port-forward svc/nginx-example 8080:8080`

### Delete Pods
`kubectl delete pod nginx-example`

### ConfigMap
`kubectl create configmap homepage-html --from-file=index.html`

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: homepage-html
data:
  index.html: |-
    <!doctype html>
    <html lang="en">
    <head>
        <meta charset="utf-8">
       <title>Kubernetes Nginx</title>
    </head>
    <body>
    <h2>This is my high available Homepage</h2>
    </body>
    </html>
```

### Execute Kustomize
`kubectl kustomize homepage-example`

### Execute Kustomize and Apply on Cluster
`kubectl kustomize homepage-example | kubectl apply -f -`

### List all pods
`kubectl get pods`
``` 
NAME                        READY   STATUS    RESTARTS   AGE
homepage-5976c85df7-9ksvf   1/1     Running   0          11m
homepage-5976c85df7-9p2dk   1/1     Running   0          10m
homepage-5976c85df7-rcqlm   1/1     Running   0          11m
```

### List all deployments
`kubectl get deployment`
``` 
NAME       READY   UP-TO-DATE   AVAILABLE   AGE
homepage   3/3     3            3           15m
```

### Execute Job
see https://kubernetes.io/docs/concepts/workloads/controllers/job/#running-an-example-job
`kubectl apply -f job-example/job.yaml`

## Helm 
https://artifacthub.io/
https://github.com/helm/helm/releases

### Helm Download Charts
`helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx`
`helm dependency build`
### Build Helm Template
`helm template . -f values.yaml`

## CRD
see: https://kubernetes.io/docs/tasks/extend-kubernetes/custom-resources/custom-resource-definitions/


* kubectl scale deployment homepage --replicas 1
* 
