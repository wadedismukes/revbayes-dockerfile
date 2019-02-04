# docker run --rm -it
FROM alpine:latest
LABEL maintainer="wade dismukes <waded@iastate.edu>"
RUN apt-get update -q && \
    apt-get install -y -q --no-install-recommends \
    build-essential \
    bash-completion \
    git \
    cmake
COPY . /revbayes

RUN cd revbayes/projects/cmake/ && ./build.sh


ENV PATH="/revbayes/projects/cmake:${PATH}"
ENV HOME /home/user
RUN useradd --create-home --home-dir $HOME user \
    && chown -R user:user ${HOME}

WORKDIR ${HOME}
