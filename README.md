# Run Cluster Locally
## Minikube
### Install minikube CLI
https://minikube.sigs.k8s.io/docs/start/

### Commands
| Command                                         | Definition | 
|-------------------------------------------------|---|
| `minikube start -p demo --vm-driver=virtualbox` | Start Cluster named Demo. If none exists it will be one created. | 
| `minikube status -p demo`                       | Verify current Minikube Status |
| `minikube stop -p demo`                         | Stop Cluster |
| `minikube profile list` | List available local clusters | 

## Other Options
| Tool | Link                               | 
|------|------------------------------------| 
| Minikube | https://minikube.sigs.k8s.io/docs/ |
| Kind | **K**ubernetes **in** **D**ocker   |
| K3S | 

# Kuberentes Resources

| Resource              | Description                                                                             | References                                     | 
|-----------------------|-----------------------------------------------------------------------------------------|------------------------------------------------|
| ConfigMap             | Key-Value Map for any Kind of Data (eg. Scripts, Configuration Files, Key-Value Pairs). | -                                              |
| Secrets               | Same as ConfigMap. Data is encrypted (base64). RBAC could be configured separated.      | -                                              |
| Pod                   | Smallest deployable Unit in Kuberenets                                                  | * Container <br> * Volume Mounts               |
| Deployment            | Manages Pods. Random Pod Names. Deployment Strategy (Rolling, Recreate)                 | * Pod Template <br> * ConfigMap <br> * Secrets |
| Statefulset           | Manages Pods. Numbered Pods (Names are re-used). Useful for any kind of Clusters        | * Pod Template <br> * ConfigMap <br> * Secrets |
| PersistentVolumeClaim | Request for a Persistent Volume                                                         | StorageClass                                   |
| StorageClass          | Definition of the storage eg. SSD, HDD, resizable...                                    | -                                              |
| Service               | Exposes Port on Pods. Acts as an Load-Balancer (internal). used as an DNS               | * Pod                                          |
| Ingress               | Exposes an Service Available through an HTTP Reverse Proxy (eg. nginx)                  | * Service                                      |
| ServiceAccount        | named user.                                                                             |                                                |
| (Cluster)Role         | permission to specific Kubernetes Resources                                             |                                                |
| (Cluster)Rolebinding  | connects Role and ServiceAccount                                                        | * ServiceAccount <br> * Role                   |