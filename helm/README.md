
TL;DR:
```
az account set --subscription cf9049a2-e0a9-43b8-a843-a06778c3be08
sops -d secrets.enc.yaml  > secrets.yaml
sops -e secrets.yaml > secrets.enc.yaml
```


