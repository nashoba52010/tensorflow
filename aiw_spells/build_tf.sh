#!/bin/sh

# bazel should already be installed

# prepare env
python3 -m venv _env
. _env/bin/activate
pip install -U pip numpy wheel
pip install -U keras_preprocessing --no-deps

# build pip package 
./configure
mkdir ../_bazel_builds

# add --nofetch after first build
bazel --output_user_root=../_bazel_builds/tf_rel build --config=opt //tensorflow/tools/pip_package:build_pip_package
bazel --output_user_root=../_bazel_builds/tf_dbg build -c dbg //tensorflow/tools/pip_package:build_pip_package

./bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg
