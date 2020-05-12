FROM debian:latest

RUN apt update -y \
&& apt install -y openssh-server \
&& apt install -y nginx \
&& mkdir /var/run/sshd \
&& echo 'root:root' | chpasswd \
&& echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22 80
#CMD ["/usr/sbin/sshd", "-D"]
COPY Docker_Wrapper.sh ./
CMD ./Docker_Wrapper.sh

