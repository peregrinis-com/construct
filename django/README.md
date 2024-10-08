# SUAP

## Usando VM

Essa é a  ajuda para construção da VM do suap. Ela deve conter no mínimo 15GB para receber toda a instalação. Ela foi criada a partir de um clone completo de da VM M1 do Virtualbox.

Caso tenha que redimensionar o HD faça o seguinte:

- No Virtualbox, clique na máquina e acesse ```Arquivo -> Ferramentas -> Gerenciador de Mídias Virtuais```;
- Redimensione o Disco virtual;
- Entre na máquina com um CD de boot do ubuntu ou outro linux com ```gparted``` no ```Live CD```;
- Dê o ```resize``` na partição.

Instale os pacotes

```
$ sudo apt update && sudo apt install --no-install-recommends -y vim openssh-server git build-essential python3-dev python3-setuptools python3-pandas ghostscript libldap2-dev libsasl2-dev libpq-dev libjpeg-dev libfreetype6-dev zlib1g-dev freetds-dev libxmlsec1-dev libblas-dev liblapack-dev libatlas-base-dev gfortran redis-server libssl-dev libffi-dev wkhtmltopdf poppler-utils swig graphviz graphviz-dev qpdf locales libsqlite3-dev libcairo2-dev pkg-config postgresql-client
```

Depois instale o pyenv.

```
$ curl https://pyenv.run | bash
```

Coloque o código apresentado no final do arquivo ``` .bashrc```. Instale a versão 3.11.1 que é a versão do python indicada no Dockerfile atual do repositório. 


## Dev Container VSCode

Entre no container gerado com o Dev Conteiner do VSCode.

## Configurando o Pyenv

Crie o virtualenv para a versão instalada. Primeiramente para o ```staging```, depois para o ```update```.

```
$ pyenv install 3.11.1
$ pyenv virtualenv 3-11-1 suap-stg-3-11-1
```

No caso de container cuja imagem é a própria imagem do python, não é necessário mencionar a versão do python, ele vai pegar a do sistema.

```
$ pyenv virtualenv suap-stg
```

Para utilizar, ative o ambiente:

```
$ pyenv activate suap-stg-3-11-1
```

## Código do SUAP

Execute o ```git clone```. Na pasta ```suap```, copie o arquivo ```settings_sample.py``` para ```settings.py``` e configure conforme achar melhor. Crie uma pasta ```sessions``` na pasta ``` deploy```. Instale os requerimentos.

```
$ pip install --upgrade pandas
$ pip install -r requirements/iff.txt
$ pip install -r requirements/development.txt
```

## Arquivos e pastas que não são versionados

Existem pastas que são necessárias, mas não devem ser versionadas. Você deve criá-las manualmente:

- /home/dev/suap/deploy/logs/history/history.log'
- /home/dev/suap/deploy/logs/email/email.log
- /home/dev/suap/deploy/sessions

## Ambiente Git

Modifique as suas informações no global.

```
$ git config --global user.name "Your Name"
$ git config --global user.email "youremail@yourdomain.com"
```

## Banco de dados

### Remoto

Acesse o banco remoto pelo comando psql, altere a senha de todos os usuários e coloque-se como superusuário da base.

```
$ psql suap_italo -h 10.110.0.10 -U italo
suap_italo=# update auth_user set password = 'pbkdf2_sha256$15000$mnXSqxJCvTE0$2rr5cWbdXI+BvBwnCpSbGAeS2tMd3oqkjCYmVKHRth8=';
suap_italo=# update auth_user set is_superuser=TRUE where username='1888590';
```

### Local

Foi criado um container de postgres que monta um volume em ```/var/lib/postgresql/data```. Essa pasta contem todos os bancos que devem ser usados. Tanto nessa aplicação Django (SUAP), quanto em outras como Rails (Portal de Inscrições). Essa pasta está protegida, tendo root como o dono e o grupo.

Ao instalar um novo server de postgres (postgresql-13 ou postgresql-13) na máquina local, ele iniciará uma nova pasta com o ```data``` referente. Apesar de ser possível alterar essa pasta de dados em ```/etc/.../postgresql.conf```, não faça para que em uma desinstalação os dados que estão protegidos não sejam perdidos.

Acesse no container:

```
$ psql template1 -U postgres -h db
template1=# \l
```

## Testes

### Libere a interface gráfica do host para os testes

```
$ xhost +local:`docker inspect --format='{{ .Config.Hostname }}' ct-python3
```

### Chromedriver

A solução para o problema do chromedriver nos testes está em ```suap/docker/Dockerfile```, entre as linhas 49 e 52.

```
RUN wget $(python -c "import requests;r=requests.get('https://googlechromelabs.github.io/chrome-for-testing/known-good-versions-with-downloads.json').json();print([chrome['url'] for chrome in r['versions'][-1]['downloads']['chrome'] if chrome['platform']=='linux64'][0])") -O chrome.zip
RUN unzip chrome.zip && mv chrome-linux64 /opt/google-chrome && rm chrome.zip && ln -s /opt/google-chrome/chrome /usr/bin/google-chrome
RUN wget $(python -c "import requests;r=requests.get('https://googlechromelabs.github.io/chrome-for-testing/known-good-versions-with-downloads.json').json();print([chrome['url'] for chrome in r['versions'][-1]['downloads']['chromedriver'] if chrome['platform']=='linux64'][0])") -O chromedriver.zip
RUN unzip chromedriver.zip && mv chromedriver-linux64/chromedriver /usr/local/bin/ && rm -rf chromedriver-linux64 && rm chromedriver.zip
```

O procedimento pode ser feito manualmente. No arquivo json resultante do acesso a url abaixo, ache a versão mais atual e baixe o chrome e o chromedriver referente a essa versão.

https://googlechromelabs.github.io/chrome-for-testing/known-good-versions-with-downloads.json

## Erros de código

### Problemas LDAP

Para resolver o problema no ldap no sync e na execução, impeça a chamada da linha abaixo, comentando ou trocando o retorno.

- /home/dev/suap/ldap_backend/models.py, line 83

Comente a linha abaixo.

- /home/dev/suap/ldap_backend/router.py, line 48

Apagar registros da tabela

```
# select * from ldap_backend_ldapconf;
# delete from ldap_backend_ldapconf;
```

Depois de tudo pronto, desfaça as mudanças nos arquivos.