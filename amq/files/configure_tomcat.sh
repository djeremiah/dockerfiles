#!/bin/bash
sed -i '/jmxremote.ssl/{
  s/^# //
  a JAVA_OPTS="${JAVA_OPTS} -Dcom.sun.management.jmxremote.authenticate=false"
}' $1

sed -i '/jmxremote.port/{
  s/^# //
  s/<port>/1099/
}' $1

sed -i '/export JAVA_OPTS/{
  s/^# //
}' $1

sed -i '/^exec/{
  s/start/run/
}' $1
