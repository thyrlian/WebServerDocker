# WebServerDocker
Uninteresting web server (to serve files) Docker image for personal purposes

## How To

Build the image:

```console
docker build -t webserver .
```

Spin up a container:

```console
docker run -d -p 80:80 -p 443:443 -v <FILE_DIR_ON_THE_HOST>:/var/www/basgeekball.com/public_html webserver
```
