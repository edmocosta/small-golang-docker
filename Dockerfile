FROM alpine:3.6

USER root

ENV GOROOT=/usr/lib/go \
    GOPATH=/gopath \
    GOBIN=/gopath/bin \
    PATH=$PATH:$GOROOT/bin:$GOPATH/bin

WORKDIR /gopath/src/github.com/edmocosta/app
ADD . /gopath/src/github.com/edmocosta/app/
ADD entrypoint.sh /gopath/bin/

RUN apk add -U git go libc-dev ca-certificates && \
  go build -o /gopath/bin/app && \
  update-ca-certificates && \
  apk del git go libc-dev && \
  rm -rf /gopath/pkg && \
  rm -rf /gopath/src && \
  rm -rf /var/cache/apk/*

ENTRYPOINT ["/gopath/bin/entrypoint.sh"]

EXPOSE 8080