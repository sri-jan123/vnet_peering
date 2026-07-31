# Azure VNet Peering with Azure Bastion using Terraform

## 📖 Project Overview

This project demonstrates how to provision a secure Azure networking environment using **Terraform**. It creates two Virtual Networks, establishes **bidirectional VNet Peering**, deploys two Azure Virtual Machines in separate VNets, and uses **Azure Bastion** to securely access the VMs without exposing them to the internet.

The entire infrastructure is deployed using **Infrastructure as Code (IaC)**, showcasing Azure networking concepts and Terraform best practices.

---

## 🛠️ Technologies Used

- Microsoft Azure
- Terraform
- Azure Virtual Network
- Azure Subnet
- Azure VNet Peering
- Azure Bastion
- Azure Virtual Machines
- Azure Public IP
- Git
- GitHub

---

## 🏗️ Architecture

The infrastructure consists of:

- **1 Resource Group**
- **2 Virtual Networks**
  - VNet 1: `10.0.0.0/16`
  - VNet 2: `10.1.0.0/16`
- **2 Subnets**
  - Subnet 1: `10.0.0.0/24`
  - Subnet 2: `10.1.0.0/24`
- **Bidirectional VNet Peering**
- **2 Azure Virtual Machines**
  - One VM deployed in each subnet
- **Azure Bastion**
  - Deployed in VNet 1
  - Provides secure RDP/SSH connectivity to both VMs
- **Public IP**
  - Associated only with Azure Bastion
 
---

## 🌐 Architecture Diagram

<img width="1042" height="714" alt="Screenshot 2026-07-31 183500" src="https://github.com/user-attachments/assets/6adb1527-240e-4897-ad2a-01dae8a235cd" />

## ✨ Features

- Infrastructure provisioned entirely using Terraform
- Two isolated Azure Virtual Networks
- Bidirectional VNet Peering
- Secure communication between VNets
- Azure Bastion for secure VM access
- No Public IP assigned to Virtual Machines
- Reproducible Infrastructure as Code
