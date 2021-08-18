# the linkerd namespace should already be created for the cert manager CRDs, validate against a different namespace so that the pre-check does not fail
linkerd check --pre --linkerd-namespace linkerd-test

linkerd install --identity-external-issuer | kubectl apply -f -
linkerd check

linkerd viz install --set jaegerUrl=jaeger.linkerd-jaeger:16686 | kubectl apply -f -
linkerd viz check

linkerd jaeger install | kubectl apply -f -
linkerd jaeger check