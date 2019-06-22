FROM rabbitmq:3.7.15-management-alpine
COPY rabbit.conf /opt/rabbitmq/etc/rabbitmq/rabbit.conf

COPY start.sh /start.sh

RUN chmod +x /start.sh


EXPOSE 4369 5671 5672 25672

VOLUME [ "/var/lib/rabbitmq" ]

ENTRYPOINT ["/start.sh"]


