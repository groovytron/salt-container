FROM debian:buster

ARG SALT_VERSION

RUN apt-get update \
    && apt-get upgrade --quiet --yes \
    && apt-get update --quiet \
    && apt-get install --quiet --yes \
        build-essential \
        curl \
        git \
        locales \
        software-properties-common \
        tzdata \
        unzip \
        wget \
    && wget -O - https://repo.saltstack.com/py3/debian/10/amd64/latest/SALTSTACK-GPG-KEY.pub | apt-key add - \
    && add-apt-repository "deb http://repo.saltstack.com/py3/debian/10/amd64/$SALT_VERSION buster main" \
    && apt-get update --quiet \
    && apt-get install --quiet --yes \
        salt-api \
        salt-cloud \
        salt-master \
        salt-minion \
        salt-ssh \
        salt-syndic \
        python3-pygit2 \
    && apt-get autoremove --quiet --yes \
    && apt-get clean

# Set the locale
RUN locale-gen en_US
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment \
    && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && echo "LANG=en_US.UTF-8" > /etc/locale.conf \
    && locale-gen en_US.UTF-8

# Set timezone
RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Europe/Zurich /etc/localtime

# Create less privileged user
RUN groupadd --gid 1000 dev \
  && useradd --uid 1000 --gid dev --shell /bin/bash --create-home dev

EXPOSE 4505 4506

# Label schema related variables and metadata
ARG BUILD_DATE
ARG VCS_REF

LABEL maintainer="Julien M'Poy <julien.mpoy@gmail.com>" \
    org.opencontainers.image.authors="Julien M'Poy <julien.mpoy@gmail.com>" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.description="Salt container for local SaltStack development" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.revision=${VCS_REF} \
    org.opencontainers.image.source="https://github.com/groovytron/salt-container" \
    org.opencontainers.image.title="Salt Container" \
    org.opencontainers.image.url="https://github.com/groovytron/salt-container" \
    org.opencontainers.image.vendor="Julien M'Poy <julien.mpoy@gmail.com>" \
    org.opencontainers.image.version=${SALT_VERSION}
