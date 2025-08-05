# 🚀 Kubernetes Autoscaling with Terraform on AWS

This project demonstrates a complete deployment pipeline using **Terraform** and **Kubernetes** to deploy an **NGINX web server**, expose it through a **LoadBalancer**, and enable **Horizontal Pod Autoscaling (HPA)** based on CPU utilization — all on an **EKS (Elastic Kubernetes Service)** cluster provisioned on **AWS**.

---

## 📌 Project Overview

| Task | Description |
|------|-------------|
| ☁️ Infrastructure | Provisioned with **Terraform** |
| 🔧 Cluster | AWS EKS Cluster (2 Subnets, 1 VPC) |
| 🧱 App Deployment | `nginx` web server |
| 📡 Service Exposure | `LoadBalancer` Service |
| 📈 Autoscaling | Horizontal Pod Autoscaler (HPA) |
| ⚙️ Load Generation | Busybox load generator pod |
| 🔍 Monitoring | Watched `kubectl get hpa` with live CPU % |

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

Terraform was used to provision:
- VPC
- Two public subnets
- Internet Gateway & routing
- EKS Cluster
- IAM roles for EKS and worker nodes

🧾 Files are organized inside the `terraform/` directory:

terraform/
├── main.tf
├── variables.tf
├── vpc.tf
├── iam.tf
├── outputs.tf

📸 **Terraform Plan**
![Terraform Plan](screenshots/terraform plan.jpeg)

---

## 🚀 Kubernetes Setup

YAML files used for deployment and scaling are placed in the `k8s/` folder.

### ✅ Deployment
```bash
kubectl apply -f nginx-deployment.yaml
### ✅ Service(Load Balancer)
```bash
kubectl apply -f nginx-service.yaml

### 📸 Service Output
![Service Output](screenshots/kubectl get svc.jpeg)

### ✅ Result
NGINX is accessible via AWS ELB.

### 📸 NGINX Page
![NGINX Output](screenshots/nginx webpage.jpeg)

---

## ⚙️ Horizontal Pod Autoscaler

### Autoscaling is enabled via:
```bash
kubectl autoscale deployment nginx-deployment --cpu-percent=50 --min=1 --max=5

### You can monitor it using:
```bash
watch -n 5 kubectl get hpa

### 📸 HPA Monitoring
![HPA Monitoring](screenshots/kubectl get hpa.jpeg)

---

## 🔁 Load Generation (Busybox)

### To test autoscaling, heavy CPU load was generated with:
```bash
kubectl run load-generator --image=busybox --restart=Never -- \
  /bin/sh -c "while true; do wget -q -O- http://nginx-service; done"

** Multiple load-generator pods were created to simulate high traffic and trigger HPA.

### 📸 Pods View
![Pods View](screenshots/kubectl get pods.jpeg)

---

## 📦 Folder Structure

K8s-autoscaling/
├── terraform/               # All Terraform scripts
├── k8s/                     # All Kubernetes YAML files
│   ├── nginx-deployment.yaml
│   ├── nginx-service.yaml
│   └── hpa.yaml (optional)
├── screenshots/             # Output screenshots
├── README.md                # This file

---

## 💡 Learnings
	•	Successfully deployed a scalable Kubernetes app on AWS
	•	Automated infrastructure using Terraform
	•	Learned practical usage of HPA and LoadBalancer services in EKS
	•	Simulated real-world traffic using pods to trigger scaling

## 👤 Author
Arnav Deshmukh
GitHub: arnavdeshmukh23
LinkedIn: www.linkedin.com/in/arnav-deshmukh-7984781bb
