FROM ubuntu:16.04

SHELL ["/bin/bash", "-c"]

ARG python_version=3.6

ENV CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

ENV CONDA_DIR=/opt/conda
ENV PATH=$CONDA_DIR/bin:$PATH

# Install add-apt-repository
RUN apt-get update && \
    apt-get install -y --no-install-recommends software-properties-common && \
    add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable


# Base Requirements
RUN mkdir /src && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    build-essential \
    git \
    wget \
    curl \
    vim && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Python Requirements
RUN cd /tmp && \
wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    /bin/bash ./Miniconda3-latest-Linux-x86_64.sh -f -b -p $CONDA_DIR && \
    conda install -y conda python=${python_version} && \
    conda clean -yt && \
    rm Miniconda3-latest-Linux-x86_64.sh

ADD requirements.txt /opt/keras/requirements.txt

RUN conda update -y -n base -c defaults conda && \
    conda install pip && \
    pip install --upgrade pip && \
    pip --no-cache-dir install --upgrade ipython && \
    pip install --no-cache-dir -r /opt/keras/requirements.txt


ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.5.0/wait /usr/local/bin/wait
RUN chmod a+x /usr/local/bin/wait


WORKDIR /opt/keras
