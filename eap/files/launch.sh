#!/bin/bash
IPADDR=$(ip a s | sed -ne '/127.0.0.1/!{s/^[ \t]*inet[ \t]*\([0-9.]\+\)\/.*$/\1/p}')
/opt/jboss/jboss-eap-6.2/bin/standalone.sh -Djboss.bind.address=$IPADDR -Djboss.bind.address.management=$IPADDR -Djdg.visualizer.jmxUser=admin -Djdg.visualizer.jmxPass=passw0rd_ -Djdg.visualizer.serverList=$JDG_PORT_11222_TCP_ADDR:11222
