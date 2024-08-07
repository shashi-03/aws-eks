# aws-eks

# EKS Cluster with Jaeger/Hotrod and Monitoring Setup

## Overview

This repository contains Terraform configurations to deploy an Amazon EKS cluster and set up a sample application (Jaeger/Hotrod) using kustomize templates. It also includes configurations for deploying NGINX Ingress Controller, Grafana, and Prometheus using Helm.

## Prerequisites

- Terraform installed
- AWS CLI configured
- kubectl installed
- Helm installed

## Setup Instructions

.
├── main.tf
├── variables.tf
├── eks
│   ├── cluster.tf
│   ├── node_groups.tf
│   └── outputs.tf
├── helm
│   ├── jaeger
│   │   ├── values.yaml
│   ├── nginx-ingress
│   │   ├── values.yaml
│   ├── grafana
│   │   ├── values.yaml
│   └── prometheus
│       ├── values.yaml
├── kustomize
│   ├── base
│   │   ├── deployment.yaml
│   │   ├── kustomization.yaml
│   └── overlays
│       ├── app
│       │   ├── kustomization.yaml
│       │   ├── node-selector.yaml
│       └── db
│           ├── kustomization.yaml
│           ├── node-selector.yaml
└── README.md


### Deploy EKS Cluster

## steps to deploy this setup-

terraform init

terraform apply

kubectl apply -k kustomize/overlays/app

helm install nginx-ingress ingress-nginx/ingress-nginx -f helm/nginx-ingress/values.yaml

helm install grafana grafana/grafana -f helm/grafana/values.yaml

helm install prometheus prometheus-community/kube-prometheus-stack -f helm/prometheus/values.yaml






