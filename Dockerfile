FROM debian
ADD squid3 /etc/init.d/squid3
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
 && apt-get install -y squid3 squidclient net-tools tcpdump telnet htop \
 && echo "Europe/Budapest" > /etc/timezone \
 && dpkg-reconfigure -f noninteractive tzdata \
 && chmod 755 /etc/init.d/squid3
ENTRYPOINT ["/etc/init.d/squid3","start"]
