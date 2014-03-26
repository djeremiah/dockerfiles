#!/bin/bash
IPADDR=$(ip a s | sed -ne '/127.0.0.1/!{s/^[ \t]*inet[ \t]*\([0-9.]\+\)\/.*$/\1/p}') 
cd /opt/jboss/jboss-eap-6.2/bin
su jboss -c "/opt/jboss/jboss-eap-6.2/bin/standalone.sh -b ${IPADDR} -bmanagement ${IPADDR} -c standalone-ha.xml"
