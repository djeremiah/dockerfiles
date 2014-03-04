FROM centos:6.4

MAINTAINER David Murphy <dmurphy@redhat.com>

# Update, Install Java, Install unzip
RUN yum -y update
RUN yum -y install unzip
RUN yum -y install java-1.7.0-openjdk-devel

# Install EAP
ADD products/jboss-eap-6.2.0.zip /opt/jboss/
RUN unzip /opt/jboss/jboss-eap-6.2.0.zip -d /opt/jboss
RUN rm /opt/jboss/jboss-eap-6.2.0.zip

# Expose Ports
## Management
EXPOSE 9999 9990 9443 
## WEB
EXPOSE 8080 8443 8009

# Add user
RUN /opt/jboss/jboss-eap-6.2/bin/add-user.sh admin passw0rd_ --silent

# Add files
ADD files/launch.sh /
RUN chmod +x /launch.sh

# Launch
ENTRYPOINT /launch.sh

