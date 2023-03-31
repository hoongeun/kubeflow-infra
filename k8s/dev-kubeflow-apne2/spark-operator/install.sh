#!/bin/env bash

helm repo add spark-operator https://googlecloudplatform.github.io/spark-on-k8s-operator

helm install spark-operator spark-operator/spark-operator \
    --namespace spark-operator --create-namespace \
    --set sparkJobNamespace=spark-job
    --set istio.enabled=true
    --set webhook.enabled=true
    --set serviceAccounts.spark.name="spark"
