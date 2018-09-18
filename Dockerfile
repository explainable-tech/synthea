FROM openjdk:8

# AWS CLI
RUN apt-get update && \
  apt-get install -y python-dev && \
  apt-get install -y python-pip && \
  pip install awscli && \
  apt-get clean && \
  apt-get autoclean && \
  apt-get autoremove


COPY . /synthea
WORKDIR /synthea
RUN ["./gradlew", "build", "check", "test"]

COPY ./entrypoint.sh ./entrypoint.sh
RUN chmod u+x ./entrypoint.sh

ENTRYPOINT /bin/bash /synthea/entrypoint.sh
