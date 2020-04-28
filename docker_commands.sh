docker pull debian
docker build -t test .
docker container run -d -p 9090:22 test

ssh root@localhost -p 9090
#ssh root@172.0.0.1 -p 9090
