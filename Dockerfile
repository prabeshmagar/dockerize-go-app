# Dockerfile References: https://docs.docker.com/engine/reference/builder/

# Start from the latest golang base image

FROM golang:latest

# Add Maintainer Info
LABEL maintainer="Prabesh Magar <prab.mgar@gmail.com"

# Set the Current WOrking Directory inside the container

WORKDIR /app

# Copy go mod and sum files
COPY go.mod go.sum ./

# Download all dependencies. Dependencies will be cached if go mod and go sum no
RUN go mod download

# Copy the soucre from the current directory to working directory inside the contaniner
COPY . .

#Build the Go app
RUN go build -o main . 

EXPOSE 8080

CMD ["./main"]