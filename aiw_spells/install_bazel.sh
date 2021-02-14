#!/bin/sh

curl -LJO https://github.com/bazelbuild/bazel/releases/download/3.1.0/bazel-3.1.0-installer-linux-x86_64.sh
chmod +x ./bazel-3.1.0-installer-linux-x86_64.sh
BAZEL_DIR=$(pwd)/_bazel
./bazel-3.1.0-installer-linux-x86_64.sh --prefix=$BAZEL_DIR
export PATH=$PATH:$BAZEL_DIR/bin
rm ./bazel-3.1.0-installer-linux-x86_64.sh
