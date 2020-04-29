docker pull debian
docker build -t test .
docker run -d -p 2222:22 -p 80:80 test

ssh root@localhost -p 9090
