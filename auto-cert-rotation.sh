kubectl create namespace linkerd

step certificate create root.linkerd.cluster.local ca.crt ca.key --not-after=87600h \
  --profile root-ca --no-password --insecure &&
  kubectl create secret tls \
    linkerd-trust-anchor \
    --cert=ca.crt \
    --key=ca.key \
    --namespace=linkerd

kubectl apply -f ./manifests

kubectl wait -f ./manifests --for condition=available

rm ca.crt ca.key