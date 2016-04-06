FROM rabbitmq:3.6.1
MAINTAINER Dan MacDonald <dsvmacdonald@nuarch.com>

RUN rabbitmq-plugins enable --offline rabbitmq_management

ADD entrypoint.sh /entrypoint.sh
RUN chmod 755 ./entrypoint.sh

EXPOSE 15672 61613
EXPOSE 5672

CMD ["/entrypoint.sh"]
