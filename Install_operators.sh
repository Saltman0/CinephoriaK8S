# Helm Repo
helm repo add doppler https://helm.doppler.com
helm repo add kong https://charts.konghq.com
helm repo add jetstack https://charts.jetstack.io
#helm repo add cnpg https://cloudnative-pg.github.io/charts
helm repo update

# Doppler
helm install --generate-name doppler/doppler-kubernetes-operator

# Kong
kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.2.1/standard-install.yaml
helm install kong kong/ingress -n kong --create-namespace

# RabbitMQ
kubectl apply -f https://github.com/rabbitmq/cluster-operator/releases/latest/download/cluster-operator.yml

helm install cert-manager jetstack/cert-manager \
    --namespace cert-manager \
    --set crds.enabled=true \
    --create-namespace \
    --set config.apiVersion="controller.config.cert-manager.io/v1alpha1" \
    --set config.kind="ControllerConfiguration" \
    --set config.enableGatewayAPI=true --wait

# CloudNative PG
#helm upgrade --install cnpg --namespace cnpg-system --create-namespace cnpg/cloudnative-pg