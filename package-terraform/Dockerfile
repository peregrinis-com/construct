# syntax=docker/dockerfile:1
FROM debian:latest

# base packages
RUN apt update
RUN apt install -y make curl tar vim less wget \
  gnupg software-properties-common

# terraform package
RUN wget -O- https://apt.releases.hashicorp.com/gpg | \
  gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
  tee /etc/apt/sources.list.d/hashicorp.list
RUN apt update
RUN apt install -y terraform

# gcloud package
RUN curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz
RUN mkdir -p /usr/local/gcloud \
  && tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz \
  && /usr/local/gcloud/google-cloud-sdk/install.sh
ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin

# Workdir
WORKDIR /app

# Help
# https://stackoverflow.com/questions/28372328/how-to-install-the-google-cloud-sdk-in-a-docker-image