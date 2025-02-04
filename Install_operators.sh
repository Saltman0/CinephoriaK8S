# Helm Repo
helm repo add doppler https://helm.doppler.com
helm repo add kong https://charts.konghq.com
helm repo update

# Doppler
helm install --generate-name doppler/doppler-kubernetes-operator

# Kong
kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.2.1/standard-install.yaml
helm install kong kong/ingress -n kong --create-namespace

# RabbitMQ
kubectl apply -f "https://github.com/rabbitmq/cluster-operator/releases/latest/download/cluster-operator.yml"