FROM centos:7

ENV PROXY_DEST="127.0.0.1:8080"
ENV HTTP_BASIC_USER="nginx"
ENV HTTP_BASIC_PASSWD="proxy"


RUN yum -y install "https://packages.exove.com/yum/el7/exove-centos-release.el7.noarch.rpm"
RUN yum -y install bash gettext nginx

ADD config-templates/nginx.conf /tmp/nginx.conf.template
ADD config-templates/htpasswd /tmp/htpasswd.template
ADD entrypoint /

ENTRYPOINT ["/bin/bash", "/entrypoint"]

EXPOSE 80

