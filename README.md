# Docker HealScript

This is a Docker image that runs a user-defined script whenever a specific container becomes unhealthy.
It maps to scripts in the `/scripts` directory and if an image _X_ is found to be unhealthy, it will run `/scripts/X.sh`

## Usage

## docker

```sh
docker run -it \
-v /path/to/scripts:/scripts \
-v /var/run/docker.sock:/var/run/docker.sock \
moynihan/healscript:latest
```

### docker-compose

```yml
version: "3"
services:
  healscript:
    image: moynihan/healscript:latest
    volumes:
      - /path/to/scripts:/scripts
      - /var/run/docker.sock:/var/run/docker.sock
```

## Example script

```sh
# /script/X.sh
docker logs Y
docker restart X Y Z
```

## [Images](https://hub.docker.com/r/moynihan/healscript)

- `moynihan/healscript:{latest|x86_64}`

- `moynihan/healscript:armhf`

Based off of https://github.com/willfarrell/docker-autoheal
