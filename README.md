# docker-sickrage
A basic sickrage docker container, based on the latest Alpine Linux base image.

Includes the latest sickrage version at the time of image build.
Update within the gui works, but the container needs to restart.

Quick start (config files are created in config volume automatically):
```shell
docker run -d -p 8081:8081 -v /path/to/config:/config --name sickrage tardfree/docker-sickrage
```

To have the container start when the host boots, add docker's restart policy:
```shell
docker run -d --restart=always -p 8081:8081 -v /path/to/config:/config --name sickrage tardfree/docker-sickrage
```
