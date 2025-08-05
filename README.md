# 🚀 Kubernetes Autoscaling with Terraform on AWS

This project demonstrates deploying a fully **autoscalable Kubernetes infrastructure** using **Terraform on AWS EKS** with an **NGINX web server**, **LoadBalancer Service**, and **Horizontal Pod Autoscaler (HPA)** with live CPU-based scaling.

---

## 📌 Project Overview

| Task                | Description                        |
| ------------------- | ---------------------------------- |
| ☁️ Infrastructure   | Provisioned with **Terraform**     |
| 🔧 Cluster          | AWS EKS Cluster (2 Subnets, 1 VPC) |
| 🧱 App Deployment   | `nginx` web server                 |
| 📡 Service Exposure | `LoadBalancer` Service             |
| 📈 Autoscaling      | Horizontal Pod Autoscaler (HPA)    |
| ⚙️ Load Generation  | Busybox load generator pod         |
| 🔍 Monitoring       | Live CPU % via `kubectl get hpa`   |

---

## 🛠️ Technologies Used

- **Terraform** – Infrastructure as Code
- **AWS EKS** – Managed Kubernetes Service
- **Kubernetes** – Container Orchestration
- **NGINX** – Sample Web Server
- **HPA (Horizontal Pod Autoscaler)** – CPU-based scaling
- **Busybox** – Load generation for HPA testing

---

## 🧱 Terraform Infrastructure

Terraform provisions the entire cloud setup:

- VPC & Subnets
- Internet Gateway & Routing
- EKS Cluster
- IAM Roles

**🗂️ Files in **``** folder:**

```
main.tf
variables.tf
vpc.tf
iam.tf
outputs.tf
```

**📸 Terraform Plan**&#x20;

---

## 🚀 Kubernetes Setup

### 📄 YAML Files in `k8s/` folder

```
nginx-deployment.yaml
nginx-service.yaml
```

### ✅ Deployment

```bash
kubectl apply -f nginx-deployment.yaml
```

### 🚧 Service (Load Balancer)

```bash
kubectl apply -f nginx-service.yaml
```

### 📸 Service Output



### 🚀 Result

NGINX is now accessible via AWS LoadBalancer ELB.

### 📸 NGINX Webpage



---

## ⚙️ Horizontal Pod Autoscaler (HPA)

### ✨ Enabling HPA

```bash
kubectl autoscale deployment nginx-deployment --cpu-percent=50 --min=1 --max=5
```

### 🔁 Live Monitoring HPA

```bash
watch -n 5 kubectl get hpa
```

### 📸 HPA Output



---

## 🔄 Load Generation (Busybox)

### ⚡ Run Busybox Load Generator

```bash
kubectl run load-generator --image=busybox --restart=Never -- \
  /bin/sh -c "while true; do wget -q -O- http://nginx-service; done"
```

**Tip**: Create multiple pods using suffixes or loops to simulate more load.

### 📸 Pods Output



---

## 📆 Folder Structure

```
K8s-autoscaling/
├── terraform/               # All Terraform .tf files
├── k8s/                     # All Kubernetes YAMLs
│   ├── nginx-deployment.yaml
│   └── nginx-service.yaml
├── screenshots/             # Output screenshots (PNG/JPEG)
├── README.md                # Full project documentation
```

---

## 💡 Learnings & Outcomes

- ✅ Provisioned EKS cluster with Terraform
- ✅ Deployed a web server and exposed it publicly
- ✅ Implemented and tested Horizontal Pod Autoscaler
- ✅ Generated CPU load using Busybox to trigger scaling

---

## 👤 Author

**Arnav Deshmukh**\
GitHub: [arnavdeshmukh23](https://github.com/arnavdeshmukh23)\
LinkedIn: [linkedin.com/in/arnav-deshmukh-7984781bb](https://www.linkedin.com/in/arnav-deshmukh-7984781bb)

---

> ⭐ *Don’t forget to give a star if this helped you learn Kubernetes autoscaling!*

