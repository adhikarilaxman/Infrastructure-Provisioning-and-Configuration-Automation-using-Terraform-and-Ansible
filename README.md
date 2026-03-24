# Infrastructure Provisioning and Configuration Automation using Terraform and Ansible

## Project Overview

This project demonstrates an end-to-end DevOps workflow for automating infrastructure provisioning and configuration management on AWS.

It uses **Terraform** to provision cloud infrastructure and **Ansible** to automate software configuration on EC2 instances.

The goal is to achieve **Infrastructure as Code (IaC)** and **Configuration Automation**, ensuring consistent, repeatable, and scalable deployments.

---

## Technologies Used

| Technology | Purpose |
|------------|---------|
| AWS | EC2, Security Groups, VPC |
| Terraform | Infrastructure as Code |
| Ansible | Configuration Management |
| Docker | Containerization |
| SSH | Secure Remote Access |

---

## Project Architecture

1. Terraform provisions AWS infrastructure:
   - EC2 Instance
   - Security Group
   - Networking (VPC and Subnet)

2. Terraform generates dynamic inventory for Ansible.

3. Ansible connects to EC2 via SSH.

4. Ansible installs and configures Docker on the instance.

---

## Prerequisites

Make sure you have the following installed:

- Terraform
- Ansible
- AWS CLI
- Git

---

## Installation Commands (Ubuntu)

### Update System

```bash
sudo apt update
```

### Install AWS CLI

```bash
sudo apt install awscli -y
aws --version
```

### Configure AWS CLI

```bash
aws configure
```

You will be prompted to enter:
- AWS Access Key ID
- AWS Secret Access Key
- Default region name
- Default output format

### Install Terraform

```bash
sudo apt install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt update
sudo apt install terraform -y
terraform -version
```

### Install Ansible

```bash
sudo apt install ansible -y
ansible --version
```

---

## Project Structure

```
terraform-ansible-project/
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│
├── ansible/
│   ├── inventory.ini
│   ├── playbook.yml
│
└── README.md
```

---

## Steps to Run the Project

### Step 1 - Clone the Repository

```bash
git clone https://github.com/adhikarilaxman/Infrastructure-Provisioning-and-Configuration-Automation-using-Terraform-and-Ansible.git
cd Infrastructure-Provisioning-and-Configuration-Automation-using-Terraform-and-Ansible
```

### Step 2 - Initialize Terraform

```bash
cd terraform
terraform init
```

### Step 3 - Validate Configuration

```bash
terraform validate
```

### Step 4 - Plan Infrastructure

```bash
terraform plan
```

### Step 5 - Apply Infrastructure

```bash
terraform apply
```

Type `yes` when prompted.

This will:
- Create EC2 instance
- Create Security Group
- Generate Ansible inventory file

### Step 6 - Run Ansible Playbook

```bash
cd ../ansible
ansible-playbook -i inventory.ini playbook.yml
```

This will:
- Install Docker
- Start Docker service
- Configure user permissions

### Step 7 - Verify Setup

```bash
ssh -i <your-key.pem> ubuntu@<EC2_PUBLIC_IP>
docker --version
```

### Step 8 - Destroy Infrastructure (Cleanup)

```bash
cd ../terraform
terraform destroy
```

Type `yes` when prompted.

---

## Screenshots

### 1. Create an EC2 Instance (Ubuntu, T2.micro)

Create an EC2 instance in AWS Cloud with T2.micro instance type and Ubuntu AMI.

![EC2 Instance Creation](https://github.com/adhikarilaxman/Infrastructure-Provisioning-and-Configuration-Automation-using-Terraform-and-Ansible/blob/f8d5e792a0714ba13df3f42114f4a7e79b1c1ad8/DevOps%20Project%2001.png)

---

### 2. Install Terraform on EC2 Instance

![Terraform Installation Step 1](https://github.com/adhikarilaxman/Infrastructure-Provisioning-and-Configuration-Automation-using-Terraform-and-Ansible/blob/f8d5e792a0714ba13df3f42114f4a7e79b1c1ad8/DevOps%20Project%2002.png)

![Terraform Installation Step 2](https://github.com/adhikarilaxman/Infrastructure-Provisioning-and-Configuration-Automation-using-Terraform-and-Ansible/blob/f8d5e792a0714ba13df3f42114f4a7e79b1c1ad8/DevOps%20Project%2003.png)

![Terraform Installation Step 3](https://github.com/adhikarilaxman/Infrastructure-Provisioning-and-Configuration-Automation-using-Terraform-and-Ansible/blob/f8d5e792a0714ba13df3f42114f4a7e79b1c1ad8/DevOps%20Project%2004.png)

---

### 3. Verify Terraform Installation

Verify using `terraform -v` command.

![Terraform Version Check](https://github.com/adhikarilaxman/Infrastructure-Provisioning-and-Configuration-Automation-using-Terraform-and-Ansible/blob/f8d5e792a0714ba13df3f42114f4a7e79b1c1ad8/DevOps%20Project%2005.png)

---

### 4. Install Ansible on EC2 Instance

![Ansible Installation](https://github.com/adhikarilaxman/Infrastructure-Provisioning-and-Configuration-Automation-using-Terraform-and-Ansible/blob/f8d5e792a0714ba13df3f42114f4a7e79b1c1ad8/DevOps%20Project%2006%20Installing%20Ansible%20on%20Ubuntu.png)

---

### 5. Install AWS CLI on EC2 Instance

![AWS CLI Installation](https://github.com/adhikarilaxman/Infrastructure-Provisioning-and-Configuration-Automation-using-Terraform-and-Ansible/blob/f8d5e792a0714ba13df3f42114f4a7e79b1c1ad8/DevOps%20Project%2007%20Installing%20AWS%20CLI.png)

---

### 6. Verify AWS CLI Installation

Verify using `aws --version` command.

![AWS CLI Version Check](https://github.com/adhikarilaxman/Infrastructure-Provisioning-and-Configuration-Automation-using-Terraform-and-Ansible/blob/f8d5e792a0714ba13df3f42114f4a7e79b1c1ad8/DevOps%20Project%2008.png)

---

### 7. Create Access Key in AWS Account

Create an Access Key in your AWS account to enable CLI communication.

![AWS Access Key Creation](https://github.com/adhikarilaxman/Infrastructure-Provisioning-and-Configuration-Automation-using-Terraform-and-Ansible/blob/f8d5e792a0714ba13df3f42114f4a7e79b1c1ad8/DevOps%20Project%2009.png)

---

### 8. Configure AWS CLI

Paste your Access Key ID, Secret Access Key, Default Region Name, and Default Output Format.

![AWS Configure](https://github.com/adhikarilaxman/Infrastructure-Provisioning-and-Configuration-Automation-using-Terraform-and-Ansible/blob/f8d5e792a0714ba13df3f42114f4a7e79b1c1ad8/DevOps%20Project%2010.png)

---

### 9. Verify AWS Configuration

Verify using `aws sts get-caller-identity` command.

![AWS Identity Verification](https://github.com/adhikarilaxman/Infrastructure-Provisioning-and-Configuration-Automation-using-Terraform-and-Ansible/blob/f8d5e792a0714ba13df3f42114f4a7e79b1c1ad8/DevOps%20Project%2011.png)

---

### 10. Create SSH Directory

Create the SSH directory using `mkdir -p ~/.ssh`.

![SSH Directory Creation](https://github.com/adhikarilaxman/Infrastructure-Provisioning-and-Configuration-Automation-using-Terraform-and-Ansible/blob/f8d5e792a0714ba13df3f42114f4a7e79b1c1ad8/DevOps%20Project%2012.png)

---

### 11. Add PEM Key

Open the file using `nano ~/.ssh/mykey.pem` and paste your PEM RSA key.

![PEM Key Setup](https://github.com/adhikarilaxman/Infrastructure-Provisioning-and-Configuration-Automation-using-Terraform-and-Ansible/blob/f8d5e792a0714ba13df3f42114f4a7e79b1c1ad8/DevOps%20Project%2013.png)

---

### 12. Set Key Permissions

Set proper permissions using `chmod 400 ~/.ssh/mykey.pem`.

![Key Permission](https://github.com/adhikarilaxman/Infrastructure-Provisioning-and-Configuration-Automation-using-Terraform-and-Ansible/blob/f8d5e792a0714ba13df3f42114f4a7e79b1c1ad8/DevOps%20Project%2014.png)

---

### 13. Clone the GitHub Repository

![Git Clone](https://github.com/adhikarilaxman/Infrastructure-Provisioning-and-Configuration-Automation-using-Terraform-and-Ansible/blob/f8d5e792a0714ba13df3f42114f4a7e79b1c1ad8/DevOps%20Project%2015%20Cloning%20the%20GitHub%20Repository.png)

---

### 14. Run Terraform Init and Validate

Navigate to the terraform folder and run `terraform init` followed by `terraform validate`.

![Terraform Init and Validate](https://github.com/adhikarilaxman/Infrastructure-Provisioning-and-Configuration-Automation-using-Terraform-and-Ansible/blob/f8d5e792a0714ba13df3f42114f4a7e79b1c1ad8/DevOps%20Project%2016.png)

---

### 15. Run Terraform Plan

![Terraform Plan](https://github.com/adhikarilaxman/Infrastructure-Provisioning-and-Configuration-Automation-using-Terraform-and-Ansible/blob/f8d5e792a0714ba13df3f42114f4a7e79b1c1ad8/DevOps%20Project%2017.png)

---

### 16. Run Terraform Apply

Run `terraform apply` to create the infrastructure defined in the code.

![Terraform Apply Step 1](https://github.com/adhikarilaxman/Infrastructure-Provisioning-and-Configuration-Automation-using-Terraform-and-Ansible/blob/f8d5e792a0714ba13df3f42114f4a7e79b1c1ad8/DevOps%20Project%2018.png)

![Terraform Apply Step 2](https://github.com/adhikarilaxman/Infrastructure-Provisioning-and-Configuration-Automation-using-Terraform-and-Ansible/blob/f8d5e792a0714ba13df3f42114f4a7e79b1c1ad8/DevOps%20Project%2019.png)

---

### 17. Verify EC2 Instance on AWS Console

After running Terraform, the EC2 instance named **DevOps-Server** is created successfully.

![EC2 Instance Created](https://github.com/adhikarilaxman/Infrastructure-Provisioning-and-Configuration-Automation-using-Terraform-and-Ansible/blob/f8d5e792a0714ba13df3f42114f4a7e79b1c1ad8/DevOps%20Project%2020.png)

---

### 18. SSH into the Terraform-Created EC2 Instance

Connect using `ssh -i ~/.ssh/mykey.pem ubuntu@<PUBLIC_IP_ADDRESS>`.

![SSH Connection](https://github.com/adhikarilaxman/Infrastructure-Provisioning-and-Configuration-Automation-using-Terraform-and-Ansible/blob/f8d5e792a0714ba13df3f42114f4a7e79b1c1ad8/DevOps%20Project%2021.png)

---

### 19. Run Ansible Playbook

Navigate to the Ansible directory and run the playbook.

![Ansible Playbook Execution](https://github.com/adhikarilaxman/Infrastructure-Provisioning-and-Configuration-Automation-using-Terraform-and-Ansible/blob/f8d5e792a0714ba13df3f42114f4a7e79b1c1ad8/DevOps%20Project%2022.png)

---

### 20. Verify Docker Installation on Target EC2 Instance

Docker has been installed on the target EC2 instance using Ansible.

![Docker Verification](https://github.com/adhikarilaxman/Infrastructure-Provisioning-and-Configuration-Automation-using-Terraform-and-Ansible/blob/f8d5e792a0714ba13df3f42114f4a7e79b1c1ad8/DevOps%20Project%2023.png)

---

### 21. Run Terraform Destroy

Run `terraform destroy` to delete all the infrastructure created using Terraform in your AWS account.

![Terraform Destroy Step 1](https://github.com/adhikarilaxman/Infrastructure-Provisioning-and-Configuration-Automation-using-Terraform-and-Ansible/blob/f8d5e792a0714ba13df3f42114f4a7e79b1c1ad8/DevOps%20Project%2024%20Terraform%20Destroy.png)

![Terraform Destroy Step 2](https://github.com/adhikarilaxman/Infrastructure-Provisioning-and-Configuration-Automation-using-Terraform-and-Ansible/blob/f8d5e792a0714ba13df3f42114f4a7e79b1c1ad8/DevOps%20Project%2025.png)

---

## Security Best Practices

- Do not upload `.pem` files to GitHub.
- Use `.gitignore` for sensitive files.
- Restrict SSH access using your IP instead of `0.0.0.0/0`.
- Store private keys securely.
- Never hardcode AWS credentials in Terraform files.

---

## Key Features

- Infrastructure as Code using Terraform
- Automated configuration using Ansible
- Dynamic inventory generation
- Secure SSH-based access
- Docker installation automation
- End-to-end DevOps workflow

---

## Future Enhancements

- Add CI/CD pipeline using GitHub Actions or Jenkins
- Deploy a Dockerized web application
- Use Terraform remote backend with S3
- Implement IAM roles instead of static credentials
- Add Kubernetes deployment

---

## Author

**Laxman Adhikari**

---

## Conclusion

This project showcases practical DevOps skills by integrating Terraform and Ansible to automate infrastructure provisioning and configuration, making deployments faster, consistent, and scalable.
