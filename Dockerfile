FROM golang:1.14.5 AS builder
WORKDIR /
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM scratch
WORKDIR /
COPY --from=builder /app .
CMD ["./app"]