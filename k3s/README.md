# K3s Configuration

## Overview

These configuration files are placed at `/etc/rancher/k3s/config.yaml` on each node before running the k3s installer.

- **k3s-n100.yaml** — Server (control plane) node configuration
- **k3s-acer.yaml** — Agent (worker) node configuration

### Key settings

- **Flannel is disabled** (`flannel-backend: "none"`, `disable-network-policy: true`) to allow Cilium to manage networking.
- **Traefik is disabled** on the server node since it is installed separately.

## Installing Cilium

After k3s is installed with flannel disabled, install Cilium as the CNI:

### 1. Install the Cilium CLI

```bash
CILIUM_CLI_VERSION=$(curl -s https://raw.githubusercontent.com/cilium/cilium-cli/main/stable.txt)
CLI_ARCH=amd64
curl -L --fail --remote-name-all https://github.com/cilium/cilium-cli/releases/download/${CILIUM_CLI_VERSION}/cilium-linux-${CLI_ARCH}.tar.gz{,.sha256sum}
sha256sum --check cilium-linux-${CLI_ARCH}.tar.gz.sha256sum
sudo tar xzvfC cilium-linux-${CLI_ARCH}.tar.gz /usr/local/bin
rm cilium-linux-${CLI_ARCH}.tar.gz{,.sha256sum}
```

### 2. Install Cilium on the cluster

```bash
cilium install --version 1.16.5
```

### 3. Validate the installation

```bash
cilium status --wait
```

This will wait until Cilium is fully operational. You can also run the connectivity test:

```bash
cilium connectivity test
```

### Notes

- Pods will remain in `Pending` state until Cilium is installed since no CNI is available.
- If using Cilium's kube-proxy replacement, you can also disable kube-proxy by adding `disable-kube-proxy: true` to the server config and passing `--set kubeProxyReplacement=true` to `cilium install`.
