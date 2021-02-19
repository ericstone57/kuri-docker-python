FROM bitnami/python:3.9-prod

LABEL maintainer="Eric Lee <ericstone.dev@gmail.com>"

WORKDIR /app/

# Install Poetry
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | POETRY_HOME=/opt/poetry python && \
    cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry && \
    poetry config virtualenvs.create false

ENV PYTHONPATH=/app