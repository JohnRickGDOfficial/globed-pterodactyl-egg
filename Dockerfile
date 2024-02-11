FROM ubuntu:trusty
CMD ["/bin/bash" "/entrypoint.sh"]
COPY file:0301efffd83b2965f98b2ef1afc7818bd8052d87fd6cb739e386ee68d6cb4dc3 in /entrypoint.sh
RUN update-locale lang=en_US.UTF-8 && dpkg-reconfigure --frontend noninteractive locales

WORKDIR /
ENV HOME=/home/container
ENV USER=container
USER container

RUN usermod -aG sudo container
RUN adduser --disabled-password --home / container
RUN apt-get update && apt-get install -y wget bash curl ca-certificates nginx iproute2 zip unzip sudo && apt-get install -y --no-install-recommends python3 python3-pip php gnupg2 && apt-get install -y libjansson4 && apt-get install -y software-properties-common && add-apt-repository -y ppa:longsleep/golang-backports && apt-get update && apt-get install -y golang && apt-get install -y make git lolcat figlet toilet && rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND=noninteractive

CMD ["bash"]
ADD file:d2abb0e4e7ac1773741f51f57d3a0b8ffc7907348842d773f8c341ba17f856d5 in /

LABEL org.opencontainers.image.version=22.04
LABEL org.opencontainers.image.ref.name=ubuntu

ARG LAUNCHPAD_BUILD_ARCH
ARG RELEASE
