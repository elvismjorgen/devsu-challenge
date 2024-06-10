
# Devsu DevOps Challenge

Below is the stack I chose to perform this challenge:

* **SCM**: All components related to this project are hosted on GitHub as the central repository.

* **CI/CD**: GitHub Actions the CI/CD pipeline automation.

* **Static Code Analysis**: To identify potential vulnerabilities and issues within the code I used NPM tool; the analysis is performed running the command `npm audit`.

* **Unit Testing and Code Coverage**: Jest, a testing framework, is used for unit testing and code coverage analysis. The command `jest coverage` runs the tests and generates coverage reports.

* **Containerization**: Docker is utilized to containerize the application, facilitating consistent and isolated deployment across various environments.

* **Images Registry**: DockerHub is used to store and manage container images. After build process, the images are pushed to the DockerHub from CI/CD pipeline.

* **Cloud Provider**: Azure.

* **Kubernetes (AKS)**: The application is deployed on Azure Kubernete Service (AKS), it provides a managed Kubernetes environment for efficient orchestration and scalability.

* **IaC**: Terraform is used to provision the necessary resources on Azure for deploying the application.

# The project's directory structure is as follows:

* **.github/workflow**: YAML file defining GitHub Actions workflow for CI/CD processes; everything is created from this. Test, build, provission infrastructure and deploy" was split into separate actions for clarity and readability.

* **app**: Contains the code and functions necessary to test the application

* **k8s-manifest**: Comprises Kubernetes manifests for all necessary objects to deploy the application. I employed Kustomize to manage the K8s manifests.

* **scripts**: Consists of a script to create k8s secrets for db-name, db-user and db-passwd.

* **Terraform**: Contains terraform configurations files for all necessary resources to provision on Azure.


The URL of the app is (I will keep the infrastructure until Friday at midday):
http://48.217.132.5/api/users

Repo URL:
https://github.com/elvismjorgen/devsu-challenge


Note:

My apologies, as I know the documentation is incomplete (the diagram is also missing); I had a madness week at work and I almost didn't have time to do a better job (even on weekend); the application is not accessible through a domain because, although I bought a domain, it is not redirecting traffic to Azure. I created a CNAME record pointing to the load balancer IP, but it still doesn't work. I have opened a support case with my domain provider, but they haven't replied yet, and since I don't have much time, I will deliver the project in its current state, but to apply TLS I'd do it as follow:

1. Create a cluster issuer for Let's Encrypt
2. Create a ingress and add cluster-issuer in it