# WebServerDocker
Uninteresting web server (to serve files) Docker image for personal purposes

## How To

Spin up a container:

```console
docker run -d -p 80:80 -p 443:443 -v <FILE_DIR_ON_THE_HOST>:/var/www/basgeekball.com/public_html webserver
```
