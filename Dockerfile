FROM centos:7
LABEL maintainer="Hchicha Amine <amine.hachichaa@yahoo.com>"

ENV nginxversion="1.14.0-1" \
    os="centos" \
    osversion="7" \
    elversion="7_4"
RUN ls /usr/share/zoneinfo && \
cp /usr/share/zoneinfo/Europe/Brussels /etc/localtime && echo "Africa/Tunis" >  /etc/timezone
RUN yum -y update
# Install dependencies
RUN yum install -y wget openssl sed &&\
        yum -y autoremove &&\
        yum clean all &&\
        yum -y install nginx
RUN date >  /usr/share/nginx/html/index.html
VOLUME [ "/data/www" ]
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
