FROM achmadns/gammusmsd

MAINTAINER Achmad NS <achmad.dev@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive
ENV SMSGATEWAY_VERSION=v1.3

RUN apt-get install -y python3 python3-pip python3-tk git pkg-config cmake zlib1g-dev libxml2-dev libxslt1-dev screen nano \
	&& pip3 install lxml ws4py pycrypto cherrypy ldap3 python-gammu \
	&& cd /opt/ && git clone https://github.com/n0r1sk/smsgateway.git \
	&& cd smsgateway && git checkout "${SMSGATEWAY_VERSION}"

ADD conf/* /opt/smsgateway/conf/