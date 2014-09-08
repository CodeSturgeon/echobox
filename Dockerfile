FROM ubuntu

RUN apt-get update
RUN apt-get install -y python-pip
RUN pip install Flask

ADD echobox.py /

EXPOSE 5000
CMD ["/echobox.py"]
