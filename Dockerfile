FROM debian:latest
RUN apt update -y \
&& apt install openssh* -y \
&& apt install nginx -y

EXPOSE 22

ENTRYPOINT /bin/bash
