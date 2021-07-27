linkerd upgrade | kubectl apply --prune -l linkerd.io/control-plane-ns=linkerd -f -

linkerd upgrade | kubectl apply --prune -l linkerd.io/control-plane-ns=linkerd \
  --prune-whitelist=rbac.authorization.k8s.io/v1/clusterrole \
  --prune-whitelist=rbac.authorization.k8s.io/v1/clusterrolebinding \
  --prune-whitelist=apiregistration.k8s.io/v1/apiservice -f -

linkerd check

kubectl -n something rollout restart deployment,daemonset,statefulset

linkerd check --proxy