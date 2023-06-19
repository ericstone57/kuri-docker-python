FROM bitnami/python:3.9-prod

LABEL maintainer="Eric Lee <ericstone.dev@gmail.com>"

# install dependencies
RUN install_packages git curl

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -
RUN cd /usr/local/bin && \
    ln -s /root/.local/bin/poetry && \
    poetry config virtualenvs.create false

RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

# Clear cache
RUN apt-get clean && apt-get purge -y && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

ENV PYTHONPATH=/app

WORKDIR /app/
