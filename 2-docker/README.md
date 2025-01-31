### High Availability Server Setup with Docker

#### How to Set Up

1. Clone the Repository and Navigate:
```bash
git clone https://github.com/saidtaylan/sample-task-devops.git
cd sample-task-devops/2-docker
```
This command downloads the project files from GitHub to your local machine.

2. Run the following command to start everything in the background:
````bash
docker compose up -d
````
3. We built the image as multi-platform image and push it to docker hub using the following command:
````bash
docker login
docker buildx build --platform linux/amd64,linux/arm64 --push -t saidtaylan/konzek-hello-there:v1 .
````

#### How It Works
- FastAPI Servers: The setup runs two instances of FastAPI servers as replicas. This means there are two copies of the application running for reliability.
- Nginx Load Balancers: There are also two Nginx servers that work together using a master-backup system (KeepAlived). This setup helps distribute incoming traffic and ensures that if one server fails, the other can take over.
- Dockerfiles: There are two Dockerfiles included:
    The first one is for deploying the main FastAPI servers and Nginx.
    2. The second one combines Nginx and KeepAlived services, enhancing availability.

#### Note
I could have use docker swarm to replicate FASTAPI servers or I could have use port binding to communicate nginx and servers.
But it would has a security problem to expose server ports if I would use port binding. Besides I did not want to use Docker swarm becuse it has not mentioned in the task documentation. In conclusion, I had to define as two different services the servers.