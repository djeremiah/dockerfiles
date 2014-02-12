#!/bin/bash
IPADDR=$(ip a s | sed -ne '/127.0.0.1/!{s/^[ \t]*inet[ \t]*\([0-9.]\+\)\/.*$/\1/p}')
/opt/jboss/jboss-datagrid-6.2.0-server/bin/standalone.sh -Djboss.bind.address=$IPADDR -Djboss.bind.address.management=$IPADDR -Djboss.jgroups.s3_ping.access_key=$S3_ACCESS_KEY -Djboss.jgroups.s3_ping.secret_access_key=$S3_SECRET_ACCESS_KEY
