![Caddy Server](https://caddyserver.com/resources/images/caddy-open-white.png)

## Tag available
* latest [(Dockerfile)](https://github.com/flemzord/dockerfiles/tree/master/Caddy/Dockerfile)

## Description


## Build Image

```shell
docker build -t flemzord/caddy github.com/flemzord/dockerfiles.git#master:caddy
```

## Configuration
### Volumes
* /var/www:html : Path where is file
* /etc/Caddyfile : Path where is configuration of caddy

### Ports
* 80
* 443

## Usage
### Speed launch
```shell
docker run -d -p 80:80 flemzord/caddy
```
URI access : http://XX.XX.XX.XX:80
