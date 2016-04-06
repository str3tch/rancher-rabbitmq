FROM rabbitmq:3.6.1
MAINTAINER Chris Dorrington <chris.dorrington@ir.com>

RUN apt-get update && \
    apt-get install -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN rabbitmq-plugins enable --offline rabbitmq_management

ADD entrypoint.sh /entrypoint.sh
RUN chmod 755 ./entrypoint.sh

EXPOSE 15672 61613
EXPOSE 5672

CMD ["/entrypoint.sh"]
