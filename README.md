# vue-docker-example [![Build Status](https://travis-ci.org/daggerok/vue-docker-example.svg?branch=master)](https://travis-ci.org/daggerok/vue-docker-example)

Do you know that incredibly not stable NodeJS packages from npm, huh?
Yeah... I have that project and it's not worked on my mac locally anymore...
I cannot even build it! But hey! Don't worry! Docker for the rescue!

```bash
docker-compose build --pull --force-rm
docker-compose up -V -d
while [[ $(docker ps -n 2 -q -f health=healthy -f status=running | wc -l) -lt 2 ]] ; do
  echo -ne '.' ;
  sleep 1s ;
done
http :80
docker-compose down -v --rmi local
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).
