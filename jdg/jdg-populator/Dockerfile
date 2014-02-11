FROM centos:6.4

MAINTAINER David Murphy <dmurphy@redhat.com>

# Update, Install Java, Install unzip
RUN yum -y update
RUN yum -y install unzip
RUN yum -y install java-1.7.0-openjdk-devel

# Install Grid filler
ADD files/hotrod-demo.jar /

# Add files
ADD files/launch.sh /
RUN chmod +x /launch.sh

# Launch
ENTRYPOINT /launch.sh
