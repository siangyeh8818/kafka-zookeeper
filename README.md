# kafka-zookeeper

### How to build
```
skaffold build
```

### How to deploy
```
kubectl apply -f namespace.yaml
kubectl apply -f zookeeper.yaml
kubectl apply -f kafka.yaml
kubectl apply -f kafka-svc-load.yaml
```

### How to setting
```
cd docker
vi update.sh

這邊可以去設定你要做檢查的topic等
```
