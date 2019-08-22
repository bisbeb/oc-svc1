FROM ubuntu:18.04

LABEL maintainer="linuxsatellite@gmail.com"

RUN apt-get update && apt-get install -y \
    software-properties-common

RUN add-apt-repository universe

RUN apt-get update && apt-get install -y \
    apache2 \
    curl \
    git \
    libapache2-mod-php5 \
    php5 \
    php5-mcrypt \
    php5-mysql \
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

EXPOSE 5000

CMD ["flask", "run"]
