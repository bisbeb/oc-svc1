FROM ubuntu:18.04

LABEL maintainer="linuxsatellite@gmail.com"

RUN apt-get update && apt-get install -y \
    software-properties-common

RUN add-apt-repository universe

RUN apt-get update && apt-get install -y \
    curl \
    python3.4 \
    python3-pip

RUN pip3 install flask

#ENV PATH /opt/conda/bin:$PATH

# Install dependencies via Anaconda
RUN mkdir -p /deploy/app
COPY svc1.py /deploy/app/svc1.py

# Deploy application
WORKDIR /deploy/app

# Set Python path
ENV PYTHONPATH=/deploy/app
ENV FLASK_APP=svc1.py
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

EXPOSE 5000

CMD ["flask", "run"]
