# DetectionLab Terraform

## Cost
```
terraform state pull |  curl -s -X POST -H "Content-Type: application/json" -d @- https://cost.modules.tf/
{"hourly": 0.26, "monthly": 186.62}
```
---

### This method uses pre-built AMIs. When deployed, a small provisioning process is run on first build to re-connect everything and update the Velociraptor certs.

### For a fresh provision using base Windows and Linux AMIs and Ansible, use Terraform_Ansible

## How to use

Fork this Repo.

Request sharing of AMIs from the owner of this Repo. (No longer required, AMIs are public)

Create a new S3 bucket in AWS, this will store all of your Terraform State files for any of my projects so name it something meaningful.

Generate an RSA KeyPair. Using something like PuttyGen will be easiest. Save the private key somewhere safe, Keep the public key handy as you will need it shortly.

In your own Fork, set the following GitHub Repository Secrets. (Exact secret names must be used) These s

- AWS_ACCESS_KEY 
  - Your AWS Access key ID, copied from your AWS account
- AWS_SECRET_KEY
  - Your AWS Secret key, copied from your AWS account
- MY_IP
  - Your own public IP address, this will give you access to everything once it's built
  - eg. "103.97.98.99" - do not include quotes.
- PUBLIC_KEY
  - Paste the public key you generated previously in here.
  - eg. "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCEgBTd26TVUWf+i+kQc .... someone@email.com"
  - Not currently working, just make sure there is something in this secret.

  Within the code itself, change the following items:
  /AWS/Terraform/backend.hcl
   - Change the bucket name to the one you created earlier

Open your GitHub repo, 

