FROM rabbitmq:3.7.15-management-alpine
COPY rabbit.conf /opt/rabbitmq/etc/rabbitmq/rabbit.conf

COPY start.sh /start.sh

RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"] 


CMD ["rabbitmq-server"]
