docker pull debian
docker build -t test .
#docker run -d -p 2222:22 -p 80:80 test

docker run -dit --restart unless-stopped -p 80:80 --name test -d nginx


# ssh root@localhost -p 2222
