FROM debian:latest
RUN apt update -y \
&& apt install -y nano \
&& apt install -y openssh* \
&& apt install -y nginx

EXPOSE 22
