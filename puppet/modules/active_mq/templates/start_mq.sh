#!/bin/bash
nohup java -cp /opt/apache-activemq-5.8.0/bin/activemq.jar -Dactivemq.home=/opt/apache-activemq-5.8.0 -Dactivemq.base=/opt/apache-activemq-5.8.0 org.apache.activemq.console.Main start xbean:/etc/activemq/activemq.xml 2>&1 >> /var/log/activemq &
