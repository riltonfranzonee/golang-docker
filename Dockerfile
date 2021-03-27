FROM golang:1.14-alpine AS builder
WORKDIR /src/
COPY . .
RUN CGO_ENABLED=0 go build -o /bin/demo

FROM scratch
COPY --from=builder /bin/demo /bin/demo
ENTRYPOINT ["/bin/demo"]
