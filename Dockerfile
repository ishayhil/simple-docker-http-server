FROM python:3.9

RUN mkdir /app
COPY /web /app
COPY pyproject.toml /app
COPY README.md /app
WORKDIR /app
ENV PYTHONPATH=${PYTHONPATH}:${PWD}

RUN pip3 install poetry
RUN poetry config virtualenvs.create false
RUN poetry install --no-dev

ENTRYPOINT ["python","web.py"]