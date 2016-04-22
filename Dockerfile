FROM jenkins
#FROM parisi/firefox-ubuntu-vnc

USER root
RUN apt-get -y install wget \
 && wget https://bootstrap.pypa.io/get-pip.py \
 && python get-pip.py \
 && pip install robotframework \ 
 && pip install robotframework-selenium2library requests

#RUN apt-get -y install ssh
#RUN apt-get -y install tzdata=2012b-1 
#RUN apt-get install tzdata-java java7-runtime-headless 
#RUN apt-get -y install jenkins

RUN apt-get update
RUN apt-get -y install xvfb
#these 3 should be run in session
#RUN Xvfb :1 -screen 0 1024x768x16 -extension RANDR &> xvfb.log  &
#RUN DISPLAY=:1.0
#RUN export DISPLAY


#COPY jenkins_home/* /var/jenkins_home/
#RUN chown -R jenkins:jenkins /var/jenkins_home
#RUN chmod 755 /var/jenkins_home
#RUN rm /var/jenkins_home/copy_reference_file.log
#COPY firefox-45.0.2.tar.bz2 /tmp/
COPY test.robot /var/jenkins_home/
COPY webtest.robot /var/jenkins_home/
COPY webtest.robot /tmp/
COPY testingbot.py /var/jenkins_home/
#USER jenkins

