FROM ubuntu

MAINTAINER refael malka <www8351@gmail.com>

COPY counter.sh /usr/local/bin/counter.sh

RUN chmod +x /usr/local/bin/counter.sh

RUN set -x \
  && apt-get update && apt-get upgrade -y \
    apt-get install python3 -y \
    apt-get install openssh-server -y \
    apt-get install net-tools -y \
    apt-get install tcpdump -y \
    apt-get install sshpass -y \


# Forward request logs to docker log collector
#RUN ln -sf /dev/stdout /var/log/net4u/access.log \
#  && ln -sf /dev/stderr /var/log/net4u/error.log

CMD ["/usr/local/bin/counter.sh"]
