FROM ubuntu:20.04

LABEL maintainer="tomer.klein@gmail.com"

#install pip3
RUN apt update

RUN apt install -yqq python3-pip

#install python paho-mqtt client and urllib3
RUN pip3 install --upgrade pip setuptools  --no-cache-dir


ENV PYTHONIOENCODING=utf-8

ENV LANG=C.UTF-8

#Debug Mode for testing
ENV DEBUG_MODE "False"

ENV REGION "*"

ENV INCLUDE_TEST_ALERTS "False"

ENV GREEN_API_INSTANCE ""
ENV GREEN_API_TOKEN ""
ENV WHATSAPP_NUMBER ""

COPY requirements.txt /tmp
RUN pip3 install -r /tmp/requirements.txt

#Create working directory
RUN mkdir /app

COPY app/ /app

WORKDIR /app

ENTRYPOINT ["/usr/bin/python3", "/app/walert.py"]
