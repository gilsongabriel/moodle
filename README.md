![CodeMaster Logo](https://avatars3.githubusercontent.com/u/63756350?s=100&v=4)
## [CodeMaster Soluções](https://codemastersolucoes.com)

# About this custom image

This image is customized from the official [PHP 7.4.8 FPM Buster](https://hub.docker.com/_/php) image.

# What's included

##### This image contains these packages* by default:

- [Moodle](https://moodle.org/)
- [Nginx](https://nginx.org/)

###### * Only in stable versions

# How to use

### Pushing image to local device

```
docker push codemastersolutions/moodle:tagname
```

### Using a Dockerfile

```dockerfile
FROM codemastersolutions/moodle
#Volume to folder moodle data (recommended)
VOLUME ./.docker/moodle/data /var/www/moodledata
#Default port to FPM server (optional)
EXPOSE 9000
#Default port to nginx server
EXPOSE 80
```

##### Then, run the commands to build and run the Docker image:

```shell script
$ docker build -t my-php-app .
$ docker run -it --rm --name my-running-app my-php-app
```

# Using with Docker Composer

```yaml
version: "3.7"
services:
  app:
    image: codemastersolutions/moodle
    container_name: my-container-name
    volumes:
      #Volume to folder moodle data (recommended)
      - ./.docker/moodle/data:/var/www/moodledata
    ports:
      #Default port to PHP FMP (optional)
      - "9000:9000"
      #Default Port to Supervisor Web Server
      - "80:80"
    restart: always
    tty: true
```

# Source Tags
- [latest](https://github.com/codemastersolutions/moodle)
- [v3.9.1](https://github.com/codemastersolutions/moodle/releases/tag/v3.9.1)