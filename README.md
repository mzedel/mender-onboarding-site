# Mender Onboarding Site 
Mender static webpage for onboarding with Application update
 
This site is served with some device information from the serving device. Those device details are populated in the `entrypoint.sh` so this or a similar file should be executed before server start.

To see the site use:

```
docker-compose up
```

and visit http://localhost:8080. The "Web server" in the top right reflects the container id (instead of a proper server name).