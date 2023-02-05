FROM tensorflow/tensorflow:2.10.0

RUN apt-get update
RUN apt-get install -y unzip graphviz
RUN apt-get update
RUN apt-get install -y musescore3

RUN pip install --upgrade pip

WORKDIR /app

COPY ./requirements.txt /app
RUN pip install -r /app/requirements.txt

COPY /utils/. /app/utils
COPY /notebooks/. /app/notebooks
COPY /scripts/. /app/scripts

COPY /setup.cfg /app

ENV PYTHONPATH="${PYTHONPATH}:/app"