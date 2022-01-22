# ReLife - Services

The architecture of the backend of ReLife followes the micro services architecture.

## Services

- **gateway:** NGINX gateway that redirects requests to the micro service it is ment to be. Whenever a service is being made, it needs to be defined in the gateway as well. Otherways, the gateway does not know where it should link to.
- **challenge-service:** Service that provides the user with data regarding challenges. All the information regarding all the challenges, need to be redirected to this service.
- **submission-service:** Submissions are something different than the challenges. They are saved separately. All the information regarding all of the submissions, need to be redirected to this service. 
- **vote-service:** Users can vote on submissions that they like. All the information regarding votes, need to be redirected to this service.
- **shop-service:** Users can buy vouchers and earn coins. All the information regarding this currency or the vouchers, need to be redirected to this service.

## Docker Compose

In the Docker Compose all the services are defined with a MYSQL service. You can run this on you local device when you have Docker installed. Or, you can use this on a cloud provider where you can run docker and can access the docker images from the services. You can run the docker compose by using the following command.

```shell script
docker-compose up --build
```

## Goal
The reason why we chose for a micro serviceses architecture is because (in the long run) this will become an enterprise software. We want to scale services on the load it will get. Whenever one of the services is getting slow because of the requests, we want to increase the amount of instances of this service. This way, the load will be balanced across the services. This will be done with [Kubernetes](https://kubernetes.io/).