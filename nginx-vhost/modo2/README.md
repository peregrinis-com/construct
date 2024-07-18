# What to do?

## Redirecionamento de portas

Caso esteja utilizando **VM**, redirecione as portas, de acordo com o arquivo de ajuda *RedirecionamentoRedeNAT* na raiz do projeto **construct**.

## Levantando pacote docker

Execute:

```
$ cd <Workspace>/<caminho>
$ docker-compose up -d
```

Adicione a linha abaixo no seu arquivo ```/etc/hosts``` para poder acessar o sistema. Caso faça o redirecionamento de portas da VM para o hospedeiro altere o arquivo do hospedeiro também.

```
127.0.0.1       docker.localhost
```

## Acessando pacote docker

 Caso esteja utilizando redirecionamento de portas, acesse as seguintes urls a partir do hospedeiro:

- http://docker.localhost : exibirá o site.conf
- http://localhost : exibirá o default.conf

Caso contrário, acesse por dentro da VM via linha de comando:

- ```curl docker.localhost``` : exibirá o site.conf
- ```curl 127.0.0.1``` : exibirá o default.conf