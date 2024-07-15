## Setup

### Build your Docker image:
```
docker build -t kirito:latest .
```
### Load the Docker image into the kind cluster (if using Kind (kubernetes in Docker):

```
kind load docker-image kirito:latest
```
### Apply the manifest:
```
kubectl apply -f kirito-deployment.yaml
```
### Create port forwarding for local test:
```
kubectl port-forward service/kirito-service 8080:80
```
### Test connection:
```
curl -i http://localhost:8080
```
