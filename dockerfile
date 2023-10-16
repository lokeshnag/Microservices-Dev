FROM golang as builder
WORKDIR /go/src/github.com/lokeshnag/Microservices-Dev/
COPY . ./
RUN go mod init
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix .

FROM alpine:latest
WORKDIR /app/
COPY --from=builder /go/src/github.com/lokeshnag/Microservices-Dev/Microservices-Dev /app/goapp
EXPOSE 2222
ENTRYPOINT ./goapp