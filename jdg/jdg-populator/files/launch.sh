#!/bin/bash
java -Djdg.demo.initialList=$JDG_PORT_11222_TCP_ADDR:11222 -Djdg.demo.cacheName=labCache -Djdg.demo.maxEntries=$DATA_SIZE -Djdg.demo.clearOnFinish=$DRAIN -Djdg.demo.putDelay=$DELAY -Djdg.demo.useTwitter=false -jar hotrod-demo.jar
