## Deploy application on Google Kubernetes Cluster

### Created dev namespace
```cd kuberapp/```

```kubectl apply -f dev-namespace.yml```

### Deploy all microservice components into dev namespace
```kubectl apply -f mongo -n dev```

```kubectl apply -f ui -n dev```

```kubectl apply -f post -n dev```

```kubectl apply -f comment -n dev```

### Make sure website works as expected
Get external IP of any of the node in cluster/or use google cloud web console gui

```kubectl get nodes -o wide```

Find a port which is used for service ui

```kubectl describe service ui -n dev | grep NodePort```

Go to url ```http://external_ip:port```

#### Perfect! We successfully deployed our app!
