FROM golang as builder
WORKDIR /go/src/github.com/habibridho/simple-go/
COPY . ./
RUN go mod init
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix .

FROM alpine:latest
WORKDIR /app/
COPY --from=builder /go/src/github.com/habibridho/simple-go/simple-go /app/simple-go
EXPOSE 8888
ENTRYPOINT ./goapp