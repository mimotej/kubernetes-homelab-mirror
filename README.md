<p align="center">
  <a href="https://github.com/mimotej/kubernetes-homelab-mirror">
    <img src="https://cdn.jsdelivr.net/gh/selfhst/icons@main/svg/kubernetes.svg" width="200" alt="Kubernetes logo" />
  </a>
</p>
<h2 align="center">Kubernetes homelab</h2>
<p align="center">Personal Kubernetes homelab</p>
<p align="center">
  <a href="https://github.com/mimotej/kubernetes-homelab-mirror">
    <img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/mimotej/kubernetes-homelab-mirror">
  </a>
  <a href="https://github.com/mimotej/kubernetes-homelab-mirror/blob/master/LICENSE">
    <img alt="Latest GitHub tag" src="https://img.shields.io/github/license/mimotej/kubernetes-homelab-mirror">
  </a>
</p>

---
## :rocket: Deploy cluster

### :warning: Prerequisites

- All secrets are set up in the Bitwarden secrets manager
- The domain is added to Cloudflare, and the token is configured

### Steps

1. Setup two k3s nodes, use configs under `k3s/` to install nodes with correct configuration (do not forget to update secrets before deployment)
2. Deploy argocd manually by running `kubectl apply -k .` from `argocd/apps` folder
3. Configure admin account in argocd and configure cluster/environment
4. Add git configuration
5. Create `app-of-apps-production` application
>[!NOTE]
> Before setting up bootstrap application it is adviced to first comment out all non-essetintial apps and slowly comment them back
6. Once `external-secrets` namespace is created add `bitwarden-access-token` secret
7. Deploy rest of the applications

---

## :books: Useful resources for running a Kubernetes homelab and inspiration

- [k3s](https://k3s.io/) - Lightweight Kubernetes distribution
- [Ian Prestons' blog](https://blog.ianpreston.ca/posts/2024-12-27-kubelog-bitwarden-secrets.html) - Interesting read about bitwarden secret manager
- [Running Adguard in HA](https://pablomurga.com/posts/adguard-home/)

