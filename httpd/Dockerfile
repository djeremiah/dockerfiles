FROM dmurphy/rhqagent

MAINTAINER David Murphy <dmurphy@redhat.com>

# Install HTTPD
RUN yum -y install apr-devel httpd mod_cluster-native
ADD files/mod_cluster.conf /etc/httpd/conf.d/mod_cluster.conf

# Expose Ports
EXPOSE 80 

# Configure Supervisor
ADD files/httpd.ini /etc/supervisord.d/

# Launch
CMD supervisord -n
