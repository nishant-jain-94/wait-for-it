# Wait-For-It #

Wait for it is a simple dockerized version of the script [wait-for-it](https://github.com/vishnubob/wait-for-it) build at [Stackroute](http://stackroute.in/).

## Why Wait-For-It? ##

Wait-For-It can be used to synchronize spinning up of interdependent services.

Let's say that you have a docker-container B depending on an other docker-container A.

Container A gets started but there are certain services in container A which are yet to be available. Since the container A got started, Container B thinks that the services in container A are also available. Now when container B tries to connect the service available in container A it says connection refused.

Now Wait-For-It basically attempts to solve the problem by listening on the url of the service. 

## How to use? ##

Wait Wait-For-It itself has no clue on what service it should wait. Then how would it work?. Well it's super simple. It involves two simple steps:

1. Define Services for which you want to wait in wait.txt

    ### wait-for-it/wait.txt ###

    ```
    // If you know the url of the service.
    // For Example: bolt://localhost
    URL_OF_SERVICE

    // If host and port are present as the environment variable.
    // Replace HOST and PORT with the environment variable.
    --host=$(echo $HOST) --port=$(echo $PORT)
    ```

2. Use the wait service in wait-for-it.
    ### docker-compose.yml ###

    ```
    version: '2'
    services:
      wait:
        volumes:
          - ./wait-for-it:/dependencies
    ``` 