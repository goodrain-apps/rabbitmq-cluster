#/bin/bash
set -e
# add debug mode 
[[ $DEBUG ]] && set -x
# format the nodename of rabbit instance
export RABBITMQ_NODENAME=rabbit@${HOSTNAME}.${HOSTNAME%-*}
# make cluster with config file
if [[ ${SERVICE_POD_NUM} -gt 1 ]];then
    sed -i '$a\cluster_formation.peer_discovery_backend = rabbit_peer_discovery_classic_config' /opt/rabbitmq/etc/rabbitmq/rabbit.conf
    for i in $(seq ${SERVICE_POD_NUM})
      do
        echo "discover the member of rabbit cluster : rabbit@${HOSTNAME%-*}-`expr $i - 1`.${HOSTNAME%-*}"
        echo "cluster_formation.classic_config.nodes.$i = rabbit@${HOSTNAME%-*}-`expr $i - 1`.${HOSTNAME%-*}" >> /opt/rabbitmq/etc/rabbitmq/rabbit.conf
      done
fi
# debug mode
[[ $PAUSE ]] && sleep $PAUSE
exec $@

  