FROM amd64/debian:bookworm

RUN echo 'deb-src http://deb.debian.org/debian bookworm main' >> /etc/apt/sources.list
RUN echo 'deb-src http://deb.debian.org/debian-security bookworm-security main' >> /etc/apt/sources.list
RUN echo 'deb-src http://deb.debian.org/debian bookworm-updates main' >> /etc/apt/sources.list
RUN apt update

RUN apt -y upgrade
RUN apt -y install vim-nox git build-essential devscripts debhelper-compat

RUN apt -y install mkdocs mkdocs-material rsync

RUN mkdir /root/pn_handbook
COPY gen_deb.sh /root/pn_handbook/

ENTRYPOINT /root/pn_handbook/gen_deb.sh
