FROM jboss-base

MAINTAINER David Murphy <dmurphy@redhat.com>

# Install EAP
ADD products/jboss-eap-6.2.0.zip /
RUN unzip jboss-eap-6.2.0.zip -d /opt/jboss
RUN chown -hR jboss:jboss /opt/jboss/jboss-eap-6.2
RUN rm jboss-eap-6.2.0.zip
ENV JBOSS_PIDFILE run.pid
ENV LAUNCH_JBOSS_IN_BACKGROUND true
ADD files/launch.sh /

# Expose Ports
## Management
EXPOSE 9999
## WEB
EXPOSE 8080

# Configure supervisor
ADD files/supervisor.ini /etc/supervisord.d/eap.ini

CMD supervisord -n
