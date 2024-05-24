
  <h1>🚀 Nginx Deployment with Terraform on AWS</h1>

  <p>Welcome to the App AWS Terraform repository! This project automates the deployment of AWS infrastructure using Terraform, Docker, and GitHub Actions. It includes features such as Infrastructure as Code (IaC), Docker containerization of Nginx web server, and Continuous Integration and Continuous Deployment (CI/CD) pipelines.</p>

  <h2>🛠️ Features</h2>
  <ul>
    <li>Infrastructure as Code (IaC) using Terraform</li>
    <li>Docker containerization of Nginx web server</li>
    <li>Continuous Integration and Continuous Deployment (CI/CD) pipelines with GitHub Actions</li>
  </ul>

  <h2>🚀 Getting Started</h2>
  <ol>
    <li>Clone the Repository:</li>
    <code>git clone https://github.com/alexisundas/app-aws-terraform.git</code>
    <li>Configure AWS Credentials</li>
    <li>Update Terraform Configurations</li>
    <li>Initialize Terraform:</li>
    <code>terraform init</code>
    <li>Plan and Apply Changes:</li>
    <code>terraform plan</code><br>
    <code>terraform apply</code>
  </ol>

  <h2>📦 Dockerized Nginx Deployment</h2>
  <ul>
    <li>The Dockerfile defines the Nginx Docker image.</li>
    <li>The <code>run-docker.yml</code> GitHub Actions workflow builds the Docker image, tags it, and pushes it to Docker Hub afterwards it will install and run the Nginx Docker Container.</li>
  </ul>

  <h2>🤝 Contributing</h2>
  <p>Contributions are welcome! If you encounter any issues or have suggestions for improvements, please <a href="https://github.com/alexisundas/app-aws-terraform/issues">open an issue</a> or <a href="https://github.com/alexisundas/app-aws-terraform/pulls">create a pull request</a>.</p>
