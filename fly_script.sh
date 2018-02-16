export SERVICE_IP=$(kubectl get svc \
    --namespace default concourse-web \
    -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
wget -O fly "http://$SERVICE_IP:8080/api/v1/cli?arch=amd64&platform=linux"
chmod +x fly
