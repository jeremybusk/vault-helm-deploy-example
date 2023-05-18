https://developer.hashicorp.com/vault/tutorials/kubernetes/kubernetes-raft-deployment-guide

helm install vault hashicorp/vault \
    --namespace vault \
    -f override-values.yml \
    --dry-run

https://35.203.152.161:8200/

https://developer.hashicorp.com/vault/tutorials/auth-methods/identity

vault kv get engine/k8s/myk8s/postgres/postgres1

https://developer.hashicorp.com/vault/docs/platform/k8s/helm/examples/ha-with-raft


tls

https://yuweisung.medium.com/vault-ha-with-tls-on-k8s-64cdcc1ae61

https://developer.hashicorp.com/vault/docs/platform/k8s/helm/examples/standalone-tls


# Recover Raft

https://developer.hashicorp.com/vault/tutorials/raft/raft-lost-quorum

Use ip address for remaining vault pod in this case vault-0

```
cat > /vault/data/raft/peers.json << EOF
[
  {
    "id": "vault-0",
    "address": "10.0.101.22:8201",
    "non_voter": false
  }
]
EOF
```
