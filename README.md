# simple-golang-docker-multistage

Golang Docker Multistage Hello World tests

# Simplest

Simplest possible version just printing Hello World

```
> cd simplest
> docker build -t gdm-s .             
Sending build context to Docker daemon  3.072kB
Step 1/8 : FROM golang:1.14.5 AS builder
 ---> 2b88645b406c
Step 2/8 : WORKDIR /
 ---> Using cache
 ---> 5340b3d7e946
Step 3/8 : COPY main.go .
 ---> Using cache
 ---> dd49fdf09ee5
Step 4/8 : RUN GOOS=linux CGO_ENABLED=0 go build -o app .
 ---> Running in 16bab8dc73db
Removing intermediate container 16bab8dc73db
 ---> 44346c6b745e
Step 5/8 : FROM scratch
 ---> 
Step 6/8 : WORKDIR /
 ---> Using cache
 ---> 841d88a098c9
Step 7/8 : COPY --from=builder /app .
 ---> Using cache
 ---> 520b9ba80c77
Step 8/8 : CMD ["/app"]
 ---> Running in e99d19b5d9c1
Removing intermediate container e99d19b5d9c1
 ---> f3db7b253aef
Successfully built f3db7b253aef
Successfully tagged gdm-s:latest


> docker run --rm -i gdm-s     
Hello World!


> docker images
gdm-s                 latest              f3db7b253aef        11 seconds ago      2.07MB
```

# Wait for input

Version printing Hello World and waiting for Enter key

```
> cd wait-for-enter
> docker build -t gdm-w .
Sending build context to Docker daemon  3.072kB
Step 1/8 : FROM golang:1.14.5 AS builder
 ---> 2b88645b406c
Step 2/8 : WORKDIR /
 ---> Using cache
 ---> 5340b3d7e946
Step 3/8 : COPY main.go .
 ---> Using cache
 ---> c7d58cd80744
Step 4/8 : RUN GOOS=linux CGO_ENABLED=0 go build -o app .
 ---> Running in 9fe3a66bd3ec
Removing intermediate container 9fe3a66bd3ec
 ---> 682ef047d6a2
Step 5/8 : FROM scratch
 ---> 
Step 6/8 : WORKDIR /
 ---> Using cache
 ---> 841d88a098c9
Step 7/8 : COPY --from=builder /app .
 ---> Using cache
 ---> 2f3c1579fb7c
Step 8/8 : CMD ["/app"]
 ---> Running in 38879d8cf4d5
Removing intermediate container 38879d8cf4d5
 ---> c7c56d658805
Successfully built c7c56d658805
Successfully tagged gdm-w:latest


> docker run --rm -i gdm-w
Hello World!
Press the Enter Key to exit
  

> docker images
gdm-w                 latest              c7c56d658805        2 seconds ago       2.2MB
```


# Rest

Version serving Hello world over REST

```
> cd rest
> docker build -t gdm-r .             
Sending build context to Docker daemon  3.072kB
Step 1/9 : FROM golang:1.14.5 AS builder
 ---> 2b88645b406c
Step 2/9 : WORKDIR /
 ---> Using cache
 ---> 5340b3d7e946
Step 3/9 : COPY main.go .
 ---> Using cache
 ---> 7b1178e3b3d3
Step 4/9 : RUN GOOS=linux CGO_ENABLED=0 go build -o app .
 ---> Using cache
 ---> e1c4574204f1
Step 5/9 : FROM scratch
 ---> 
Step 6/9 : WORKDIR /
 ---> Using cache
 ---> 841d88a098c9
Step 7/9 : COPY --from=builder /app .
 ---> Using cache
 ---> ed03af752e47
Step 8/9 : ENTRYPOINT ["/app"]
 ---> Using cache
 ---> 14c3312cf64c
Step 9/9 : EXPOSE 8080
 ---> Using cache
 ---> 4c0324ebd69c
Successfully built 4c0324ebd69c
Successfully tagged gdm-r:latest


> docker run --rm -i -p8080:8080 gdm-r
# go to separate terminal
> curl localhost:8080
{"message": "hello world"}


> docker images
gdm-r                 latest              4c0324ebd69c        2 minutes ago       7.42MB
```
