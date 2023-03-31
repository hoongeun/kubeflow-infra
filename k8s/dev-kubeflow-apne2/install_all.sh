#!/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR

echo "install karpenter"
cd "$SCRIPT_DIR/karpenter"
./install.sh
cd -

echo "install spark-operator"
cd "$SCRIPT_DIR/spark-operator"
./install.sh
cd -

echo "install kubeflow"
cd "$SCRIPT_DIR/kubeflow"
./install.sh
cd -