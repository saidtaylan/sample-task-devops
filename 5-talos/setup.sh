talosctl gen config talos-task https://192.168.64.36:6443 --output-dir talos-manifests
talosctl apply-config --insecure --nodes 192.168.64.36 --file talos-manifests/controlplane.yaml
talosctl apply-config --insecure --nodes 192.168.64.37 --file talos-manifests/worker.yaml
export TALOSCONFIG="talos-manifests/talosconfig"
talosctl config endpoint 192.168.64.36 # 
talosctl config node 192.168.64.36 # master node
talosctl bootstrap
talosctl kubeconfig .
talocttl health