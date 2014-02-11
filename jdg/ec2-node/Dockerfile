FROM centos:6.4

MAINTAINER David Murphy <dmurphy@redhat.com>

# Update, Install Java, Install unzip
RUN yum -y update
RUN yum -y install unzip
RUN yum -y install java-1.7.0-openjdk-devel

# Install JDG
ADD products/jboss-datagrid-6.2.0-server.zip /opt/jboss/
RUN unzip /opt/jboss/jboss-datagrid-6.2.0-server.zip -d /opt/jboss
RUN rm /opt/jboss/jboss-datagrid-6.2.0-server.zip
ADD files/standalone.xml /opt/jboss/jboss-datagrid-6.2.0-server/standalone/configuration/

# Expose Ports
## Management
EXPOSE 9999 9990 9443 
## WEB
EXPOSE 8080 8443 8009
## JGroups
EXPOSE 45700 7600 57600 
## HotRod
EXPOSE 11222
## Remoting and Transactions
EXPOSE 4447 4712 4713

# Add user
RUN /opt/jboss/jboss-datagrid-6.2.0-server/bin/add-user.sh admin passw0rd_ --silent

# Add files
ADD files/launch.sh /
RUN chmod +x /launch.sh

# Launch
ENTRYPOINT /launch.sh
