FROM ubuntu

MAINTAINER refael malka <www8351@gmail.com>

COPY counter.sh /usr/local/bin/counter.sh

RUN chmod +x /usr/local/bin/counter.sh

RUN set -x \
  && apt-get update && apt-get upgrade -y

# Forward request logs to docker log collector
#RUN ln -sf /dev/stdout /var/log/net4u/access.log \
#  && ln -sf /dev/stderr /var/log/net4u/error.log

CMD ["/usr/local/bin/counter.sh"]
