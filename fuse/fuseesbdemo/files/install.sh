#!/bin/sh
#rhq-ant input properties:
#rhq.deploy.dir is the root installation directory for the bundle and is the  minimum required input property
#run.maven.builds=y will build the web application using mvn. You will need to have "mvn" in your path
#rhq.deploy.clean=true deletes everything in the deployment directory(e.g. rhq.deploy.dir property)  and provisions the bundle in a clean directory
#
bold=`tput smso`
offbold=`tput rmso`

echo "If you see the message ${bold} Operating system must be Linux and x86_64 ${offbold}, then modify the deploy.xml on line 59 to match your operating system and chipset architecture"
echo "There are examples within the deploy.xml for operating systems and chipsets"

if [ "x$JAVA_HOME" = "x" ]; then
    read -p  "Please set your JAVA_HOME environment e.g. JAVA_HOME=/home/workshop/jdk1.7.0_25...Press Enter to exit"
    exit 1
fi

export PATH="`pwd`/installer/bin:$JAVA_HOME/bin:$PATH":
/bin/chmod 775 installer/bin/rhq-ant
rhq-ant -Drhq.deploy.dir=/opt/jboss -Drun.maven.builds=y -Drhq.deploy.clean=true
