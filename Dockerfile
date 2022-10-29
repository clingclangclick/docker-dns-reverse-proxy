# syntax=docker/dockerfile:1.4
FROM golang:1.17-alpine as build

ENV CGO_ENABLED=0

RUN <<eot
	go get -u github.com/miekg/dns
	go get -u github.com/StalkR/dns-reverse-proxy
eot

FROM scratch

ENV PATH=/

COPY --from=build /go/bin/dns-reverse-proxy /.

EXPOSE 53
ENTRYPOINT ["/dns-reverse-proxy"]
