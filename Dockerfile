FROM debian
#RUN apt-get update -y && apt-get install python3-pip -y && pip3 install pip --upgrade && apt-get clean
RUN apt-get install python3-pip -y && pip3 install pip --upgrade && apt-get clean
RUN pip3 install flask

LABEL maintainer="linuxsatellite@gmail.com"

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
