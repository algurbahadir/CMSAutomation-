PyEditorial Development Environment Setup
Introduction
This guide outlines the steps to set up a fully automated development environment for PyEditorial, a Python/Django application, using Docker. The setup includes separate containers for the application, web server (Nginx), and database (PostgreSQL), with HTTPS support for local development.

Prerequisites
Linux OS, preferably Ubuntu 22.04 LTS.
Docker and Docker Compose installed.

Repository Setup
Clone the project repository:

git clone <repository-url>
cd <project-directory>

Automated Environment Setup
Run the setup script to build and start all services:

./setup_environment.sh

This script will:

Build Docker images for PyEditorial, PostgreSQL, and Nginx.
Set up a self-signed SSL certificate for HTTPS.
Start all services using Docker Compose.
Perform Django migrations and static files collection.

Accessing the Application
After the setup is complete, access the PyEditorial application at:

https://localhost

gnore the browser warning about the self-signed certificate to proceed.

Architecture Diagram
Refer to the architecture_diagram.png file in the repository for a visual overview of the deployed environment.

Customization and Development
To customize PyEditorial or develop new features:

Make changes to the PyEditorial source code.
Rebuild the Docker container if necessary:

docker-compose build web

Apply any new migrations or static file changes.

Conclusion
This environment is designed for rapid development and testing. For production deployment, consider additional security measures and environment-specific configurations.