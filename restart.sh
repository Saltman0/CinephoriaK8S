for ns in $(kubectl get ns -o jsonpath='{.items[*].metadata.name}'); do
  kubectl rollout restart deployment -n $ns
  kubectl rollout restart daemonset -n $ns
  kubectl rollout restart statefulset -n $ns
done
