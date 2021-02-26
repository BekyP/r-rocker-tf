#!/bin/sh
set -e

TENSORFLOW_VERSION=${1:-${TENSORFLOW_VERSION:-default}}
KERAS_VERSION=${2:-${KERAS_VERSION:-default}}

## Install python dependency
. /rocker_scripts/install_python.sh

## To support different version of TF, install to different virtualenvs
TENSORFLOW_VENV=$PYTHON_VENV_PATH

echo "tf version: ${TENSORFLOW_VERSION}"
echo "keras version: ${KERAS_VERSION}"
echo "virtual env: ${TENSORFLOW_VENV}"

install2.r --error --skipinstalled keras

# tf install needs wheel
Rscript -e "reticulate::py_install(\"wheel\", envname =\"$TENSORFLOW_VENV\")"

Rscript -e "keras::install_keras(version = \"$KERAS_VERSION\", \
                                 tensorflow = \"$TENSORFLOW_VERSION\", \
                                 envname =\"$TENSORFLOW_VENV\")"

rm -r /tmp/downloaded_packages

chown -R 1000:1000 /opt/venv
chmod -R 777 /opt/venv
