FROM golang:1.7.3
WORKDIR /go/src/github.com/solaris-ventus/kaniko
RUN go get -d -v golang.org/x/net/html  
COPY hello.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o hello .

FROM alpine:latest  
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=0 /go/src/github.com/solaris-ventus/kaniko/hello .
CMD ["./hello"]  
