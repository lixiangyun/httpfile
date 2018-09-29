FROM golang:1.8.1
MAINTAINER linimbus@126.com

WORKDIR /gopath/
ENV GOPATH=/gopath/
ENV GOOS=linux
ENV CGO_ENABLED=0

RUN go get -u -v github.com/lixiangyun/httpfile
WORKDIR /gopath/src/github.com/lixiangyun/httpfile
RUN go build .

FROM alpine:latest
RUN apk --no-cache add ca-certificates

WORKDIR /opt/
COPY --from=0 /gopath/src/github.com/lixiangyun/httpfile ./httpfile

RUN chmod +x *

COPY ./server.crt .
COPY ./server.key .

EXPOSE 8080

# docker build -t httpfile .
# docker run -d -p 8080:8080 -v "./data:/data" --restart=always httpfile

ENTRYPOINT ["./httpfile", "-p", ":8080", "-d", "/data"]
