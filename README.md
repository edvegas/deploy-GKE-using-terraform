## Deploy Google Kubernetes Cluster using Terraform by HashiCorp

### Define variables
Copy terraform variables definition file example

```cp terraform.tfvars.example terraform.tfvars```

Edit ```terraform.tfvars``` file and define at least 1 variable ```project_id``` of your Google Cloud project

Other variables are optional. Uncomment and define if necessary. Default settings are defined in ```variables.tf```:

```zone                    - europe-west1-b
cluster name               - cluster-1
number of nodes in cluster - 3
disk size on each node     - 30GB
machine type               - n1-standard-1 / 3.75GB RAM, 1 CPU 
```

### Prepare environment
Initialize terraform:

``` terraform init ```

Set up Google Cloud credentials:

```gcloud auth application-default login```

### Deploy cluster

Check with: 

```terraform plan```

Apply settings on Google Cloud:

```terraform apply```

#### Done. You are awesome! Google Kuberenetes Cluster has been deployed successfully

### Use from local machine
To be able to manage cluster from your PC, use something like:

```gcloud container clusters get-credentials my-cluster-name --zone us-central1-a --project my-project-id```

Change my-cluster-name and my-project-id accordingly before running a command

To verify you are connected to cluster, type:

```kubectl config current-context```

#### That's it. If you want to test and deploy application on this cluster, use [Set Up Web Application](application-setup.md) instructions 
