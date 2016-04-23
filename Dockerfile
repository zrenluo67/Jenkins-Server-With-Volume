FROM jenkins

USER root
RUN apt-get -y install wget \
 && wget https://bootstrap.pypa.io/get-pip.py \
 && python get-pip.py \
 && pip install robotframework \ 
 && pip install robotframework-selenium2library requests

USER jenkins
