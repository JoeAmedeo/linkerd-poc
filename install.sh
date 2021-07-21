LINKERD_NAMESPACE=$(kubectl get ns -o json | jq '.items[].metadata.name | select(.=="linkerd")')
if [ -z "$LINKERD_NAMESPACE" ]
then
  linkerd check --pre

  linkerd install | kubectl apply -f -
else 
  echo "Linkerd already installed"
fi