FROM 10.3.76.138:5000/rhel6-base

MAINTAINER David Murphy <dmurphy@redhat.com>

# Register
RUN sed -i.bak 's/hardwareList = hardware.Hardware()/if not self.options.nohardware: hardwareList = hardware.Hardware()/' /usr/sbin/rhnreg_ks
RUN rhnreg_ks --nohardware --force --activationkey= --profilename=rhel6-docker

# Install Java, unzip and Supervisord
RUN yum -y install unzip python-setuptools java-1.7.0-openjdk-devel
RUN easy_install supervisor
RUN echo_supervisord_conf > /etc/supervisord.conf
RUN echo "[include]" >> /etc/supervisord.conf
RUN echo "files = supervisord.d/*.ini" >> /etc/supervisord.conf
ENV JAVA_HOME /etc/alternatives/java_sdk_1.7.0

# Install Postgres
RUN yum -y install postgresql92-postgresql-server
RUN service postgresql92-postgresql initdb

# Configure databases
ADD files/configure_dbs.sh /
RUN scl enable postgresql92 './configure_dbs.sh'
ADD files/pg_hba.conf /opt/rh/postgresql92/root/var/lib/pgsql/data/
ADD files/postgresql.conf /opt/rh/postgresql92/root/var/lib/pgsql/data/jon.conf
RUN echo "include = 'jon.conf'" >> /opt/rh/postgresql92/root/var/lib/pgsql/data/postgresql.conf

# Install JON
ADD products/jon-server-3.2.0.GA.zip /
RUN unzip jon-server-3.2.0.GA.zip -d /opt/jon
RUN sed -i '/^jboss.bind.address=/ s/$/0.0.0.0/' /opt/jon/jon-server-3.2.0.GA/bin/rhq-server.properties
ADD products/plugins /plugins
RUN mkdir plugin-jars
RUN cd plugins && for zip in $(ls *.zip); do unzip -jo ${zip} -d /plugin-jars; done && cp /plugin-jars/*.jar /opt/jon/jon-server-3.2.0.GA/plugins/
RUN useradd -r -m jboss
RUN chown -hR jboss:jboss /opt/jon

# Clean up
RUN rm configure_dbs.sh
RUN rm jon-server-3.2.0.GA.zip
RUN rm -rf plugins plugin-jars

# Configure Supervisor
ADD files/supervisor.ini /etc/supervisord.d/jon.ini
ADD files/startjon.py /
ADD files/startpostgres.sh /

# Launch
CMD supervisord -n
