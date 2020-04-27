FROM debian:latest
RUN apt update -y \
&& apt install openssh* -y

EXPOSE 22

ENTRYPOINT /bin/bash
