FROM debian:latest

RUN apt update -y \
&& apt install -y nginx

EXPOSE 22 80

CMD ["nginx", "-g", "daemon off;"]

#FROM debian:latest

#RUN apt update -y \
#&& apt install -y nginx

#EXPOSE 22 80
