FROM jboss-base

MAINTAINER David Murphy <dmurphy@redhat.com>

# Install EWS
ADD products /
RUN unzip -o jboss-ews-application-servers-2.0.1-1-RHEL6-x86_64.zip -d /opt/jboss
RUN unzip -o jboss-ews-httpd-2.0.1-RHEL6-x86_64.zip -d /opt/jboss
ADD files/configure_tomcat.sh /
RUN ./configure_tomcat.sh /opt/jboss/jboss-ews-2.0/tomcat7/bin/startup.sh
RUN chown -hR jboss:jboss /opt/jboss

# Clean up
RUN rm jboss-ews*
RUN rm configure_tomcat.sh

# Configure supervisor
ADD files/supervisor.ini /etc/supervisord.d/tomcat.ini

CMD supervisord -n
