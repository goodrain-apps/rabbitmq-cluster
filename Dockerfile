FROM rabbitmq:3.7.15-management-alpine
COPY rabbit.conf /opt/rabbitmq/etc/rabbitmq/rabbit.conf

COPY start.sh /start.sh

RUN chmod +x /start.sh


EXPOSE 4369 5671 5672 25672

VOLUME [ "/var/lib/rabbitmq" ]

ENV LANG=C.UTF-8
ENV RABBITMQ_DEFAULT_USER=admin
ENV RABBITMQ_DEFAULT_PASS=password
ENV RABBITMQ_DEFAULT_VHOST=my_vhost
ENV RABBITMQ_CONFIG_FILE=/opt/rabbitmq/etc/rabbitmq/rabbit
ENV RABBITMQ_ERLANG_COOKIE=rabbitcookie
ENV RABBITMQ_VERSION=3.7.15
ENV TZ=	Asia/Shanghai


ENTRYPOINT ["/start.sh"]


