FROM ubuntu

# Install sshd to use ansible with
RUN apt-get update
RUN apt-get install -y -q openssh-server
RUN mkdir /var/run/sshd
RUN mkdir /root/.ssh
ADD docker_test.pub /root/.ssh/authorized_keys
RUN chmod go-rwx -R /root/.ssh
# Not explicitly exposing 22 makes ansible->docker portmaps fail
EXPOSE 22

EXPOSE 5000
CMD ["/echobox.py"]
