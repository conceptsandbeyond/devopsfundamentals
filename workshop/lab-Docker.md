# Docker Labs (~30 minutes)

## Lab - Using existing image to launch container

<br>

Learn More! - [What is docker](https://docs.docker.com/get-started/overview/)

<br>

Open terminal in your cloud9 workstation.


1....

To start a container, you can either build your Docker image or, as in this scenario, use an existing image created by Docker and the community. Existing images can be found at registry.hub.docker.com/ 
<br>
Search for redis container

` docker search --filter=stars=3 redis `

<br>

launch a container in the background running an instance of Redis based on the official image.
<br>
All containers are given a name and id for use in other Docker commands. You can set the friendly name by providing the option --name <new-name> when launching a container such as --name redis


` docker run -d redis:latest `

<br> 

2....

See the list of running commands 
<br>

` docker ps `

<br>
See more details about the specific container

` docker inspect <name|container-id> `



3....

If a service needs to be accessible externally, then you need to expose a port to be mapped to the host. Once mapped, you will then be able to access the service as if the process was running on the host OS itself instead of in a container.
<br>
When starting the container, you define which ports you want to bind using the -p <host-port>:<container-port> option. The Redis container exposes the service on port 6379. If you wanted to map this port directly on the host, we'd use the option -p 6379:6379.

` docker run -d --name redisPort -p 6379:6379 redis:latest `


4....

So far, we've started containers and made them accessible by mounting ports. The next step is handling data.


Containers are designed to be stateless. Any data we want to be persisted after a container is stopped should be saved to the host machine. This is done by mounting/binding host directories into the container.


Binding directories (also known as volumes) in Docker is similar to binding ports using the option -v <host-dir>:<container-dir>. When a directory is mounted, the files which exist in that directory on the host can be accessed by the container and any data changed/written to the directory inside the container will be stored on the host. This allows you to upgrade or change containers without losing your data.

` docker run -d --name redisMapped -v "$PWD/data":/data redis `

<br><br><br><br>

## Lab  - Create Docker Image for your own application
https://docs.docker.com/get-started/


