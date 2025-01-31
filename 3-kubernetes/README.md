# Kubernetes Configuration

This repository contains Kubernetes manifests for deploying a FastAPI application using a base-overlay pattern with _Kustomize_.

## Structure
kubernetes/
├── base/ # Base configuration
│ ├── deployment.yaml # Main application deployment
│ ├── hpa.yaml # Horizontal Pod Autoscaler
│ ├── ingress.yaml # Ingress configuration
│ └── kustomization.yaml
└── overlays/
└── production/ # Production environment specific configs
  ├── env-secret.yaml # Environment variables in forms of secrets
  └── kustomization.yaml # Kustomization file for production overlay

## Configuration Details

- **Base Configuration**:
  - Deployment with resource limits and health checks
  - HPA configured to scale based on CPU utilization (75%)
  - Ingress configured for devops.dev
  - Service exposing port 80

- **Production Overlay**:
  - Environment variables stored in Secrets
  - Dynamic image tag management for CD platforms
  - Production namespace isolation

## Usage

To apply the production configuration:
```bash
git clone https://github.com/saidimtaylan/sample-task-devops.git
cd sample-task-devops/3-kubernetes
kubectl kustomize overlays/production/ | kubectl apply -f -
```

## Notes
- The application runs on port 8000 internally
- Image tags in production are managed dynamically through CI/CD
- Basic resource limits are set (100Mi-400Mi memory, 100m-500m CPU)
- The env-secret.yaml file shouldn't be stored in the repository. It should be stored in a sealed secret in a git repo.