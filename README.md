# Terraform Hello World

## Target

Use terraform (https://www.terraform.io/) to boot up a Jenkins cluster on Google Cloud

- Deploy Jenkins on Google Kubernetes Engine
  - 1 Jenkins master
  - 1 instance pool for Jenkins slave
  - Create 2 Jenkins jobs
    - Job1 'job-master': should always run on master
    - Job2 'job-slave': should always run on slave

## Using

1. Parameters

    - key_file (required): your private key to invoke Google API (should have editor permission on your Google project)
    - project (required): your Google project id
    - zone (required): your compute zone to deploy the thing
    - cluster_user (required): your k8s cluster master authen user
    - cluster_pwd (required): your k8s cluster master authen password
    - node_count (optional): number of nodes for your GKE cluster

2. Run

Create a `myvars.tfvars` in the main directory with content:

        key_file = "path/to/your/private_key"
        project = "your-google-project-id"
        zone = "your-compute-zone"
        cluster_user = "your-k8s-user"
        cluster_pwd = "your-k8s-password"

Then run:

        cd main
        terraform init
        terraform plan -var-file myvars.tfvars -out myplan
        terraform apply myplan

Wait for Terraform to bring the thing up.
After finished, find your Google Static IP Address named `jenkins-master-static`
You can access your Jenkins at: `[your-static-ip-address]:8080`
User: `admin`
Pwd: `Iamnoone`