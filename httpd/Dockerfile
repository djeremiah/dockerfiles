FROM httpd-base

MAINTAINER David Murphy <dmurphy@redhat.com>

# Expose Ports
EXPOSE 80 6666 16163 23364

# Environment
ENV JAVA_HOME /etc/alternatives/java_sdk_1.7.0
ENV RHQ_AGENT_ADDITIONAL_JAVA_OPTS -Drhq.agent.configuration-setup-flag=true -Drhq.agent.server.bind-address=rhqserver.dev.example.com

# Configure Supervisor
ADD files/httpd.ini /etc/supervisord.d/

# Launch
CMD supervisord -n
