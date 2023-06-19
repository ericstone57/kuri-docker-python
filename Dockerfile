FROM bitnami/python:3.9-prod

LABEL maintainer="Eric Lee <ericstone.dev@gmail.com>"

WORKDIR /app/

# install dependencies
RUN install_packages git

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -
RUN echo "export PATH=$PATH:/root/.local/bin" >> ~/.bashrc

RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && dpkg-reconfigure -f noninteractive tzdata


ENV PYTHONPATH=/app
