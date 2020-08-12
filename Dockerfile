FROM golang:1.14.5 AS builder
WORKDIR /
COPY main.go .
RUN GOOS=linux go build -o app .

FROM scratch
WORKDIR /
COPY --from=builder /app .
CMD ["./app"]