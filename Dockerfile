FROM centos:7
LABEL description="Simple Apache Webserver "
MAINTAINER Tridib Nandi <tridib@ndl.gov.in>
RUN yum update -y
RUN yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum-config-manager --enable remi-php74
RUN yum install -y epel-release \
httpd \
mariadb \
php \
git \
net-tools \
vim \
wget \
lsof \
yum-utils
RUN yum clean all && \
rm -rf /var/cache/yum
RUN git clone https://github.com/tridibndl/docker-repo.git /var/www/html/
EXPOSE 80
ENV LogLevel "info"
COPY src/hosts /var/www/html/
ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D", "FOREGROUND"]

