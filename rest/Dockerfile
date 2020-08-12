FROM golang:1.14.5 AS builder
WORKDIR /
COPY main.go .
RUN GOOS=linux CGO_ENABLED=0 go build -o app .

FROM scratch
WORKDIR /
COPY --from=builder /app .
ENTRYPOINT ["/app"]
EXPOSE 8080
