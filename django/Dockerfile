# Image and basic packages
FROM python:3.11.1
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
RUN apt-get update
RUN apt-get install -y vim less net-tools iputils-ping openssh-server \
    postgresql-client git build-essential \
    python3-dev python3-setuptools ghostscript \
    libldap2-dev libsasl2-dev libpq-dev \
    libjpeg-dev libfreetype6-dev zlib1g-dev \
    freetds-dev libxmlsec1-dev \ 
    libblas-dev liblapack-dev libatlas-base-dev gfortran redis-server \
    libssl-dev libffi-dev wkhtmltopdf poppler-utils swig graphviz graphviz-dev qpdf \
    locales
RUN pip install --upgrade pip

# Locales
RUN sed -i -r 's/^#\ (.*pt_BR\.UTF-8.*)$/\1/' /etc/locale.gen
RUN sed -i -r 's/^#\ (.*en_US\.UTF-8.*)$/\1/' /etc/locale.gen
RUN locale-gen
ENV LANG pt_BR.UTF-8
ENV LANGUAGE pt_BR:pt
ENV LC_ALL pt_BR.UTF-8

# Chrome e Chromedriver
RUN wget https://dl.google.com/linux/linux_signing_key.pub &&\
      apt-key add linux_signing_key.pub &&\
      echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/google-chrome.list
RUN apt-get update &&\
      apt install -y google-chrome-stable
RUN CHROME_DRIVER_VERSION=`curl -sS https://chromedriver.storage.googleapis.com/LATEST_RELEASE` &&\
      wget https://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip &&\
      unzip chromedriver_linux64.zip &&\
      cp chromedriver /usr/sbin/

# User
RUN adduser --disabled-password dev
USER dev
WORKDIR /home/dev
ENV PATH="/home/dev/.local/bin:${PATH}"

# Git Confs
RUN git config --global url."https://".insteadOf git://
RUN git config --global http.sslVerify "false"

# Pyenv
RUN curl https://pyenv.run | bash
RUN echo "export PYENV_ROOT=\"\$HOME/.pyenv\"" >> ~/.bashrc
RUN echo "[[ -d \$PYENV_ROOT/bin ]] && export PATH=\"\$PYENV_ROOT/bin:\$PATH\"" >> ~/.bashrc
RUN echo "eval \"\$(pyenv init -)\"" >> ~/.bashrc
### Entre no container gerado com o Dev Conteiner do VSCode
### Finalize as configurações do pyenv
# $ pyenv install 3.11.1
# $ pyenv virtualenv 3-11-1 suap-stg-3-11-1
## Ou
# $ pyenv virtualenv suap-stg

## Baixe o repositório
## Instale o ambiente do staging
# $ pip install -r requirements/iff.txt
# $ pip install -r requirements/development.txt
## Crie os seguintes arquivos e pastas
# /home/dev/suap/deploy/logs/history/history.log'
# /home/dev/suap/deploy/logs/email/email.log
# /home/dev/suap/deploy/sessions

## Problema no ldap no sync e na execução
## Impedir a chamada da linha abaixo; Comentar/trocar retorno.
# /home/dev/suap/ldap_backend/models.py, line 83
## Comentar linha abaixo.
# /home/dev/suap/ldap_backend/router.py, line 48
## Apagar registros da tabela
# select * from ldap_backend_ldapconf;
# delete from ldap_backend_ldapconf;
## Depois de tudo pronto, desfaça as mudanças nos arquivos.