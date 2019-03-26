FROM alpine:latest

RUN apk --no-cache add dnsmasq sniproxy

COPY root/ /

VOLUME /etc/dnsmasq.d

EXPOSE 53 53/udp 

ENTRYPOINT ["/startup.sh"]
