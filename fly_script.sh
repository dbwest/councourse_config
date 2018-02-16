export SERVICE_IP=$(kubectl get svc \
    --namespace default concourse-web \
    -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
wget -O fly "http://$SERVICE_IP:8080/api/v1/cli?arch=amd64&platform=linux"
chmod +x fly
fly -t local login -u concourse -p $PASSWORD -c http://$SERVICE_IP:8080
export SERVICE_IP=$(kubectl get svc \
    --namespace default concourse-web \
    -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
printf "Concourse URL: [http://$SERVICE_IP:8080]\nUsername: concourse\nPassword: $PASSWORD\n"
