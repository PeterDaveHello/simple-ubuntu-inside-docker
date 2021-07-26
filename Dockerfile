FROM ubuntu:21.10

ENV UBUNTU_APT_SITE ftp.yzu.edu.tw
ENV DEBIAN_FRONTEND=noninteractive

RUN sed -i 's/^deb-src\ /\#deb-src\ /g' /etc/apt/sources.list
RUN sed -E -i "s/([a-z]+.)?archive.ubuntu.com/$UBUNTU_APT_SITE/g" /etc/apt/sources.list
RUN sed -i "s/security.ubuntu.com/$UBUNTU_APT_SITE/g" /etc/apt/sources.list

RUN apt update && \
    apt upgrade -y && \
    apt install -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" \
        bsdutils \
        dnsutils \
        coreutils \
        iputils-ping \
        openssh-client \
        openssh-server \
        mosh \
        curl \
        wget \
        aria2 \
        sudo \
        bash-completion \
        openssl \
        iperf  \
        vim \
        tmux \
        tree \
        git \
        htop \
        unzip \
        dstat \
        vnstat \
        command-not-found \
        jq \
        xz-utils \
        docker.io \
    && \
    apt-get clean


RUN mkdir /var/run/sshd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
