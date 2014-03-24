FROM 10.3.76.138:5000/rhel6-base

MAINTAINER David Murphy <dmurphy@redhat.com>

# Register
RUN sed -i.bak 's/hardwareList = hardware.Hardware()/if not self.options.nohardware: hardwareList = hardware.Hardware()/' /usr/sbin/rhnreg_ks
RUN rhnreg_ks --nohardware --force --activationkey= --profilename=rhel6-docker

# Install Java and Supervisord
RUN yum -y install python-setuptools java-1.7.0-openjdk-devel
RUN easy_install supervisor
RUN echo_supervisord_conf > /etc/supervisord.conf
RUN echo "[include]" >> /etc/supervisord.conf
RUN echo "files = supervisord.d/*.ini" >> /etc/supervisord.conf
ENV JAVA_HOME /etc/alternatives/java_sdk_1.7.0

# Install JON agent
RUN useradd -r -m jboss
ADD products/agent.jar /opt/jboss/
RUN chown -hR jboss:jboss /opt/jboss
RUN su jboss -c 'cd /opt/jboss && java -jar agent.jar --install'
ENV RHQ_AGENT_ADDITIONAL_JAVA_OPTS -Drhq.agent.configuration-setup-flag=true -Drhq.agent.server.bind-address=rhqserver.dev.example.com

# Configure supervisor
ADD files/supervisor.ini /etc/supervisord.d/agent.ini

# Launch
CMD supervisord -n
