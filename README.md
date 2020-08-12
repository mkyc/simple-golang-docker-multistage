# simple-golang-docker-multistage
Simplest possible Golang Docker Multistage with Hello World application waiting for Enter key to exit.


```
> docker build -t gdm .

Sending build context to Docker daemon  70.14kB
Step 1/8 : FROM golang:1.14.5 AS builder
 ---> 2b88645b406c
Step 2/8 : WORKDIR /
 ---> Using cache
 ---> 5340b3d7e946
Step 3/8 : COPY main.go .
 ---> Using cache
 ---> 3f0efdf0d7de
Step 4/8 : RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .
 ---> Using cache
 ---> b9b229d39129
Step 5/8 : FROM scratch
 ---> 
Step 6/8 : WORKDIR /
 ---> Using cache
 ---> 841d88a098c9
Step 7/8 : COPY --from=builder /app .
 ---> Using cache
 ---> 7fc026fa69de
Step 8/8 : CMD ["./app"]
 ---> Using cache
 ---> d01edc30ed73
Successfully built d01edc30ed73
Successfully tagged gdm:latest
```
```
> docker run --rm -i gdm:latest
hello world
```

```
> docker images
gdm                   latest              ed4a1dfd9269        4 minutes ago       2.2MB
```