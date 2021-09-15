# the linkerd namespace should already be created for the cert manager CRDs, validate against a different namespace so that the pre-check does not fail
linkerd check --pre --linkerd-namespace linkerd-test

linkerd install --identity-external-issuer | kubectl apply -f -
linkerd check

# seems a part of the main linkerd deployment does not become fully ready after linkerd check
# just waiting 30 seconds to wait for it to be ready. have to dig deeper as to what is actually not started and if I can create some command that will validate it before continuing.
sleep 30

linkerd jaeger install | kubectl apply -f -
linkerd jaeger check

linkerd viz install --set jaegerUrl=jaeger.linkerd-jaeger:16686 | kubectl apply -f -
linkerd viz check

