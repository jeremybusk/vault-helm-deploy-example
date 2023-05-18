#!/bin/bash
set -eu
NS=vault

kubectl create namespace $NS --dry-run=client -o yaml | kubectl apply -f -
kubectl config set-context --current --namespace=$NS

# kubectl create secret tls-server --from-file=tls-server --save-config --dry-run=client -o yaml | kubectl apply -f -
# kubectl create secret tls-ca --from-file=tls-ca --save-config --dry-run=client -o yaml | kubectl apply -f -
envtpl --keep-template secrets.yaml.tpl
kubectl apply -f secret-tls.yaml
helm upgrade --install vault hashicorp/vault \
  --set='server.ha.enabled=true' \
  --set='server.ha.replicas=1' \
  --set='server.ha.raft.enabled=true' \
  -f override-values.yaml
# helm install vault hashicorp/vault \
    # --set "server.ha.enabled=true" \
    # --set "server.ha.replicas=3" \
    # -f custom-values.yaml

exit
helm install vault hashicorp/vault -f custom-values.yaml

kubectl exec -ti <name of vault pod> -- vault operator init
kubectl exec -ti <name of vault pod> -- vault operator unseal

 kubectl exec -ti vault-0 -- vault operator init
 kubectl exec -ti vault-0 -- vault operator unseal
