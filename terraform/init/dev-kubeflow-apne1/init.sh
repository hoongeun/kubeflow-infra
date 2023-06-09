#!/bin/bash

set -eux -o pipefail

aws s3api create-bucket \
    --bucket kubeflow-tfstate \
    --region ap-northeast-1 \
    --create-bucket-configuration LocationConstraint=ap-northeast-1

aws dynamodb create-table \
    --table-name kubeflow-tflock \
    --region ap-northeast-1 \
    --attribute-definitions \
        AttributeName=LockID,AttributeType=S \
    --key-schema \
        AttributeName=LockID,KeyType=HASH \
    --provisioned-throughput \
        ReadCapacityUnits=5,WriteCapacityUnits=5

aws ec2 create-key-pair \
    --key-name kubeflow-keypair \
    --region ap-northeast-1 \
    --key-type rsa \
    --query "KeyMaterial" \
    --output text > ~/.ssh/kubeflow-keypair.pem