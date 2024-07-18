# O que fazer?

```
$ cd <Workspace>/cataloga
$ docker-compose up -d
$ docker exec -it nginx bash
# chmod a+x /docker-util/script.sh
# /docker-util/script.sh
```

Ele vai reiniciar o container do nginx. Aguarde. Adicione a linha abaixo no seu arquivo ```/etc/hosts``` para poder acessar o sistema.

```
127.0.0.1       docker.localhost
```

Acesse o sistema a partir da url http://docker.localhost