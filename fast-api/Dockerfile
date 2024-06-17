#Python image
FROM python:latest


ARG pass_root
RUN apt update || echo "OK" && apt install -y openssh-server vim less bash-completion sudo
#RUN mkdir /var/run/sshd
RUN echo "root:${pass_root}" | chpasswd
#RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
#RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
##EXPOSE 22

# Adduser
RUN adduser --disabled-password python
RUN adduser python sudo
USER python

# Pyenv
RUN curl https://pyenv.run | bash
RUN echo "export PYENV_ROOT=\"\$HOME/.pyenv\"" >> ~/.bashrc
RUN echo "[[ -d \$PYENV_ROOT/bin ]] && export PATH=\"\$PYENV_ROOT/bin:\$PATH\"" >> ~/.bashrc
RUN echo "eval \"\$(pyenv init -)\"" >> ~/.bashrc
RUN echo "pyenv virtualenv app" >> ~/.bashrc
RUN echo "pyenv activate app" >> ~/.bashrc

# Final
WORKDIR /home/python/code
COPY . .

# Run
#CMD ["/usr/sbin/sshd", "-D"]
#CMD ["fastapi", "run", "app/main.py", "--port", "80"]

#########
# Run
#   docker image build --build-arg root_password="senhaderoot" --tag python-teste:0.1 .
#   docker container run -d -P --name ssh nvidia/cuda:11.0-base-ssh
# Tem que criar as chaves ssh;
# Tem que colocar a chave lá;
# tem que decer o codigo.
#########