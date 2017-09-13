# Importing from alpine linux. 
FROM alpine:latest

MAINTAINER Nishant Jain <nishantkumarajain@gmail.com>

# 1. Install Netcat utility on Alpine Linux
# 2. Install GIT utility on Alpine Linux
RUN apk update && apk upgrade && \
apk add --update --no-cache netcat-openbsd && \
apk add --no-cache bash git openssh

# Clone the wait-for-it repository.
RUN git clone https://github.com/vishnubob/wait-for-it.git

# Declaring wait-for-it to be the Working Directory
WORKDIR /wait-for-it

# Mount wait-for-it volume 
VOLUME /dependencies

# Granting permissions to execute wait.sh
RUN chmod +x ./wait-for-it.sh

# Reading line by line from wait.txt and waiting infinitely for each service
ENTRYPOINT while read -r line; do ./wait-for-it.sh -t 0 $line; done < /dependencies/wait.txt

