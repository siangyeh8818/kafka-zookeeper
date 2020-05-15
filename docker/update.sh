#!/bin/bash

for i in {1..15};
do
    echo "等待 kafka server開啟, 已等待 $i s ";
    sleep 1s;
done

bash /kafka_2.12-2.1.0/bin/kafka-topics.sh --create --zookeeper zk-${HOSTNAME##*-}.zk-svc.${MY_POD_NAMESPACE}.svc.cluster.local:2181  --replication-factor 1 --partitions 1 --topic siang-test

bash /kafka_2.12-2.1.0/bin/kafka-topics.sh --list --zookeeper zk-${HOSTNAME##*-}.zk-svc.${MY_POD_NAMESPACE}.svc.cluster.local:2181

#對siang-test增加--partitions到5
invocationsPart=$(bash /kafka_2.12-2.1.0/bin/kafka-topics.sh --describe --zookeeper zk-${HOSTNAME##*-}.zk-svc.${MY_POD_NAMESPACE}.svc.cluster.local:2181 |grep siang-test | wc -l)

while [  $invocationsPart -le 5 ]
do
  invocationsPart=$(bash /kafka_2.12-2.1.0/bin/kafka-topics.sh --describe --zookeeper zk-${HOSTNAME##*-}.zk-svc.${MY_POD_NAMESPACE}.svc.cluster.local:2181 |grep siang-test | wc -l)
  bash /kafka_2.12-2.1.0/bin/kafka-topics.sh --alter --zookeeper  zk-${HOSTNAME##*-}.zk-svc.${MY_POD_NAMESPACE}.svc.cluster.local:2181 --topic siang-test  --partitions 5
  sleep 5s
done

echo "success to setting partitions(30) for siang-test"


echo "初始化完畢........."
