---
apiVersion: v1
kind: Secret
metadata:
  name: tls-ca
stringData:
  ca.crt: |
    {{ VAULT_CA_CERT }}
---
apiVersion: v1
kind: Secret
metadata:
  name: tls-server
stringData:
  fullchain.pem: |
    {{ FULL_CHAIN_PEM }}
  server.crt: |
    {{ SERVER_CRT }}
  server.key: |
    {{ SERVER_KEY }}
