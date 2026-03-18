# Scientific Calculator – CI/CD Pipeline Implementation

This project demonstrates a complete **End-to-End CI/CD Pipeline** for a Java-based Scientific Calculator. The workflow automates the software lifecycle—from code commit to containerized deployment—ensuring consistent environments and high code quality.

## Tools & Technologies
* **Version Control:** GitHub (Source Code Management)
* **CI Orchestrator:** Jenkins
* **Build Tool:** Maven (Dependency Management & Lifecycle)
* **Testing:** JUnit (Unit Testing)
* **Containerization:** Docker & Docker Hub (Image Registry)
* **Configuration Management:** Ansible (Automated Deployment)

---

## CI/CD Pipeline Workflow

### 1. Source Control Management (SCM)
The project is hosted on **GitHub**. Jenkins is integrated via webhooks to automatically trigger the build pipeline whenever changes are pushed to the repository.

### 2. Build and Test Stage
* **Maven** compiles the source code, resolves dependencies, and packages the application into a JAR file.
* **JUnit** executes the test suite to verify the mathematical logic of the calculator.
* **Jenkins** orchestrates these stages and provides real-time feedback on build status.

### 3. Containerization
Once the build succeeds:
1. A `Dockerfile` defines the runtime environment.
2. **Docker** builds a portable image encapsulating the application.
3. The image is pushed to **Docker Hub**, making it available for deployment.

### 4. Automated Deployment
Deployment is handled by **Ansible**:
* Playbooks pull the latest Docker image from Docker Hub.
* The container is deployed and started on the target host, ensuring the application runs consistently across different environments.

---

## Conclusion
By integrating Jenkins, Maven, Docker, and Ansible, this project achieves a streamlined, automated workflow that reduces manual errors and accelerates the deployment cycle.