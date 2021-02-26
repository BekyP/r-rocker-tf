#!/bin/bash

TENSORFLOW_VENV=$PYTHON_VENV_PATH

# this versions working only with tf 2.2.0 and keras 2.4.3
Rscript -e "reticulate::py_install(\"scipy==1.4.1\", \
                                    envname =\"$TENSORFLOW_VENV\")"
Rscript -e "reticulate::py_install(\"h5py==2.10.0\", \
                                    envname =\"$TENSORFLOW_VENV\")"
Rscript -e "reticulate::py_install(\"numpy==1.19.5\", \
                                    envname =\"$TENSORFLOW_VENV\")"

"${TENSORFLOW_VENV}/bin/python3" -c 'import scipy; print("scipy: " + scipy.__version__)'
"${TENSORFLOW_VENV}/bin/python3" -c 'import h5py; print("h5py: " + h5py.__version__)'
"${TENSORFLOW_VENV}/bin/python3" -c 'import numpy; print("numpy: " + numpy.__version__)'
