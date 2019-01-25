sed -i s"/<BROKER-ID>/${HOSTNAME##*-}/g" /kafka_2.12-2.1.0/config/server.properties
sed -i s"/<HOST-NAME>/${MY_POD_NAME}/g" /kafka_2.12-2.1.0/config/server.properties
sed -i s"/<REPLACE-PORT>/${KAFKA_ADVERTISED_PORT}/g" /kafka_2.12-2.1.0/config/server.properties
sed -i s"/<EXTERNAL-LISTENERS>/${MY_POD_NAME}.kafka-svc.${MY_POD_NAMESPACE}.svc.cluster.local/g" /kafka_2.12-2.1.0/config/server.properties
sed -i s"/<ZOOKEEPER>/$ZOOKEEPER/g" /kafka_2.12-2.1.0/config/server.properties
sed -i s"/<PARTITION_NUMBER>/$PARTITION_NUMBER/g" /kafka_2.12-2.1.0/config/server.properties
sed -i s"/<INTERNAL>/${MY_POD_NAME}.kafka-svc.${MY_POD_NAMESPACE}.svc.cluster.local/g" /kafka_2.12-2.1.0/config/server.properties
sleep 1s
echo "environment var ------"
env

echo "server.properties-------"
cat /kafka_2.12-2.1.0/config/server.properties | grep broker.id
cat /kafka_2.12-2.1.0/config/server.properties | grep advertised.host.name
cat /kafka_2.12-2.1.0/config/server.properties | grep advertised.port
cat /kafka_2.12-2.1.0/config/server.properties | grep advertised.listeners
cat /kafka_2.12-2.1.0/config/server.properties | grep zookeeper.connect
cat /kafka_2.12-2.1.0/config/server.properties | grep listeners
cat /kafka_2.12-2.1.0/config/server.properties | grep num.partition

bash /kafka_2.12-2.1.0/bin/kafka-server-start.sh /kafka_2.12-2.1.0/config/server.properties 
