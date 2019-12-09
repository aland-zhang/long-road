### TiDB-cluster

**Base commit sha**

https://github.com/pingcap/tidb-operator/commit/41bceb53f428a0c015a70387bda9cab24926b1fc

**Files modified:**

- `tidb-cluster/values.yaml`

**Files added:**

- `tidb-cluster/templates/config/_drainer-kafka-config.tpl`
- `tidb-cluster/templates/drainer-kafka-configmap.yaml`
- `tidb-cluster/templates/drainer-kafka-service.yaml`
- `tidb-cluster/templates/drainer-kafka-statefulset.yaml`
- `tidb-cluster/templates/scripts/_start_drainer_kafka.sh.tpl`

### mysql

**Base commit sha**

https://github.com/helm/charts/commit/ca77541782b8008a618ca4f1c9d57b43aaf75b37

**Files modified**

- `mysql/values.yaml`

### kafka

**Base commit sha**

7a9baf17873784427b5bcbad9017ecbfd4752975

**Files modified**

- kafka/values.yaml

```yaml
persistence:
  storageClass: local-storage
  size: "5Gi"
# https://pingcap.com/docs-cn/v3.0/reference/tools/tidb-binlog/tidb-binlog-kafka/#kafka-%E9%85%8D%E7%BD%AE%E5%8F%82%E6%95%B0%E6%8E%A8%E8%8D%90
configurationOverrides:
  "confluent.support.metrics.enable": false  # Disables confluent metric submission
  "message.max.bytes": "1073741824"
  "replica.fetch.max.bytes": "1073741824"
  "fetch.message.max.bytes": "1073741824"
  # "auto.leader.rebalance.enable": true
  "auto.create.topics.enable": true
``` 

**Files added**

copy chart zookeeper to kafka/charts directory 

