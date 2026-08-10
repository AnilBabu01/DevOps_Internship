# 🏏 Cricket Application - End-to-End DevOps CI/CD Project

## 📌 Project Overview

This project demonstrates a complete **Enterprise DevOps CI/CD Pipeline** for deploying a Full Stack Cricket Application on **AWS EC2** using modern DevOps tools.

The application consists of:

- Cricket Frontend
- Cricket Admin Panel
- Cricket Backend API
- PostgreSQL Database

The infrastructure is provisioned using **Terraform**, configured using **Ansible**, containerized with **Docker**, automated through **Jenkins CI/CD Pipeline**, monitored with **Prometheus & Grafana**, and served through **Nginx Reverse Proxy**.

---

# Architecture

```
                           Developer
                               │
                               ▼
                           GitHub Repository
                               │
                        Git Push / Pull Request
                               │
                               ▼
                         Jenkins Pipeline
      ┌────────────────────────────────────────────┐
      │                                            │
      │ Checkout Source Code                       │
      │ Install Dependencies                       │
      │ Build Docker Images                        │
      │ Push Images to Docker Hub                  │
      │ Pull Latest Images                         │
      │ Deploy Docker Containers                   │
      └────────────────────────────────────────────┘
                               │
                               ▼
                     AWS EC2 Ubuntu Server
────────────────────────────────────────────────────────────

                    Docker Engine

      ┌──────────────────────────────────────┐
      │ Frontend Container        Port 3000  │
      ├──────────────────────────────────────┤
      │ Admin Container           Port 3001  │
      ├──────────────────────────────────────┤
      │ Backend Container         Port 5000  │
      ├──────────────────────────────────────┤
      │ PostgreSQL Database       Port 5432  │
      ├──────────────────────────────────────┤
      │ Jenkins                  Port 8080  │
      ├──────────────────────────────────────┤
      │ Prometheus               Port 9090  │
      ├──────────────────────────────────────┤
      │ Grafana                  Port 3002  │
      └──────────────────────────────────────┘

                               │
                               ▼

                        Nginx Reverse Proxy

ffindiano1.xyz            → Frontend

admin.ffindiano1.xyz      → Admin

api.ffindiano1.xyz        → Backend

```

---

# Technology Stack

| Category | Technology |
|-----------|------------|
| Cloud | AWS EC2 |
| IaC | Terraform |
| Configuration Management | Ansible |
| CI/CD | Jenkins |
| Containers | Docker |
| Registry | Docker Hub |
| Database | PostgreSQL |
| Reverse Proxy | Nginx |
| Monitoring | Prometheus |
| Dashboard | Grafana |
| DNS | Route53 |
| SSL | Let's Encrypt |
| Version Control | Git & GitHub |

---

# Project Structure

```
cricket-devops/

│
├── terraform/
│   ├── provider.tf
│   ├── variables.tf
│   ├── main.tf
│   └── outputs.tf
│
├── ansible/
│   ├── inventory.ini
│   ├── playbook.yml
│   └── templates/
│       └── nginx.conf.j2
│
├── docker/
│   ├── backend.Dockerfile
│   ├── frontend.Dockerfile
│   └── admin.Dockerfile
│
├── jenkins/
│   └── Jenkinsfile
│
├── monitoring/
│   ├── prometheus.yml
│   └── docker-compose.yml
│
└── README.md
```

---

# Infrastructure Provisioning (Terraform)

Terraform provisions

- AWS EC2 Instance
- Security Group
- Networking
- SSH Access
- HTTP
- HTTPS
- Jenkins Port
- Prometheus Port
- Grafana Port

### Initialize Terraform

```bash
terraform init
```

### Validate

```bash
terraform validate
```

### Plan

```bash
terraform plan
```

### Apply

```bash
terraform apply
```

---

# Server Configuration (Ansible)

Ansible automatically installs

- Docker
- Jenkins
- PostgreSQL
- Nginx
- Java
- Git
- PM2

Run Playbook

```bash
ansible-playbook -i inventory.ini playbook.yml
```

---

# Docker

Create Docker Images

```bash
docker build -t username/cricket-frontend .
docker build -t username/cricket-admin .
docker build -t username/cricket-backend .
```

Push Images

```bash
docker push username/cricket-frontend

docker push username/cricket-admin

docker push username/cricket-backend
```

---

# Docker Containers

Frontend

```bash
docker run -d \
-p 3000:3000 \
--name frontend \
username/cricket-frontend
```

Admin

```bash
docker run -d \
-p 3001:3001 \
--name admin \
username/cricket-admin
```

Backend

```bash
docker run -d \
-p 5000:5000 \
--name backend \
username/cricket-backend
```

PostgreSQL

```bash
docker run -d \
--name postgres \
-p 5432:5432 \
-e POSTGRES_PASSWORD=password \
postgres
```

---

# Jenkins CI/CD Pipeline

Pipeline Stages

```
GitHub Push

↓

Checkout Source

↓

Build Docker Images

↓

Push Docker Hub

↓

Pull Latest Images

↓

Deploy Containers

↓

Application Live
```

Pipeline includes

- Checkout Code
- Build Images
- Push Docker Hub
- Pull Images
- Remove Old Containers
- Deploy New Containers

---

# Nginx Reverse Proxy

Domain

```
ffindiano1.xyz
```

Routes to

```
localhost:3000
```

Admin

```
admin.ffindiano1.xyz
```

Routes to

```
localhost:3001
```

Backend

```
api.ffindiano1.xyz
```

Routes to

```
localhost:5000
```

Restart Nginx

```bash
sudo systemctl restart nginx
```

---

# PostgreSQL

Install

```bash
sudo apt install postgresql postgresql-contrib -y
```

Create Database

```sql
CREATE DATABASE cricketdb;
```

Create User

```sql
CREATE USER cricketuser
WITH PASSWORD 'password';
```

Grant Permission

```sql
GRANT ALL PRIVILEGES
ON DATABASE cricketdb
TO cricketuser;
```

---

# Monitoring

## Prometheus

Metrics

- CPU
- RAM
- Disk
- Docker
- Node Exporter

Port

```
9090
```

---

## Grafana

Dashboard

- CPU Usage
- Memory Usage
- Docker Containers
- Disk Usage
- Network Usage

Port

```
3002
```

---

# Route53

Configure DNS

```
A Record

ffindiano1.xyz

↓

EC2 Public IP
```

```
admin.ffindiano1.xyz

↓

EC2 Public IP
```

```
api.ffindiano1.xyz

↓

EC2 Public IP
```

---

# SSL

Install Certbot

```bash
sudo apt install certbot python3-certbot-nginx -y
```

Generate SSL

```bash
sudo certbot --nginx
```

---

# Deployment Workflow

```
Developer

↓

Git Push

↓

GitHub

↓

Webhook

↓

Jenkins

↓

Build Docker Images

↓

Push Docker Hub

↓

Pull Latest Images

↓

Deploy Containers

↓

Nginx Reverse Proxy

↓

Users
```

---

# URLs

| Service | URL |
|----------|-----|
| Frontend | https://ffindiano1.xyz |
| Admin | https://admin.ffindiano1.xyz |
| Backend | https://api.ffindiano1.xyz |
| Jenkins | http://EC2-IP:8080 |
| Prometheus | http://EC2-IP:9090 |
| Grafana | http://EC2-IP:3002 |

---

# Features

- Infrastructure as Code using Terraform
- Server Configuration using Ansible
- Dockerized Applications
- Docker Hub Image Registry
- Jenkins CI/CD Pipeline
- Automated Deployment
- PostgreSQL Database
- Nginx Reverse Proxy
- Route53 DNS
- SSL Certificate
- Prometheus Monitoring
- Grafana Dashboard
- Single EC2 Deployment
- Production Ready Architecture

---

# DevOps Tools Used

- Terraform
- Ansible
- Jenkins
- Docker
- Docker Hub
- Git
- GitHub
- AWS EC2
- Route53
- Nginx
- PostgreSQL
- Prometheus
- Grafana
- PM2
- Ubuntu Server

---

# Future Enhancements

- Kubernetes Deployment (Amazon EKS)
- AWS ECR
- Helm Charts
- ArgoCD GitOps
- Horizontal Pod Autoscaler
- AWS CloudWatch Integration
- AWS Load Balancer
- Multi-Environment Deployment
- Blue-Green Deployment
- Rolling Updates
- Automated Database Backup
- SonarQube Code Analysis
- Trivy Security Scanning
- Slack Notifications
- Email Notifications

---

# Author

**Anil Babu**

**Junior DevOps Engineer**

**Skills**

- AWS
- Terraform
- Ansible
- Docker
- Jenkins
- GitHub Actions
- Kubernetes
- Linux
- Nginx
- PostgreSQL
- Prometheus
- Grafana

---

## ⭐ If you found this project helpful, please give it a Star on GitHub!