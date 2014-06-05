FROM jboss-base

MAINTAINER David Murphy <dmurphy@redhat.com>

# Install Fuse
ADD products /
ADD files/apache-maven-3.2.1-bin.tar.gz /

# Configure supervisor

CMD supervisord -n
