docker-selenium-firefox-chrome
===================================

A Dockerfile starting a selenium standalone server with Chrome and Firefox.

It exposes:
- selenium standalone server running on `localhost:4444`
- vnc server running on `localhost:5999`, password: `secret`

Running:

```shell
docker pull agershkovich/docker-selenium-firefox-chrome
docker run --privileged -p 4444:4444 -p 5999:5999 -d agershkovich/docker-selenium-firefox-chrome
```

Also see this awesome image: https://github.com/elgalu/docker-selenium
