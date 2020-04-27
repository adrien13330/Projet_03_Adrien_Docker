FROM debian:9

RUN apt update -yq \
&& apt install nginx

EXPOSE 4568
