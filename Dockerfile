FROM rocker/r-ver:4.0.3

# tensorflow install 
COPY install_tensorflow.sh /rocker_scripts/
ENV PYTHON_VENV_PATH="/opt/venv/reticulate"
ENV TENSORFLOW_VERSION=2.2.0
ENV KERAS_VERSION=2.4.0
RUN /rocker_scripts/install_tensorflow.sh

# additional packages versions fix
COPY additional_packages_fix.sh /rocker_scripts/
RUN /rocker_scripts/additional_packages_fix.sh

CMD ["/init"]
