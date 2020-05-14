docker pull debian
docker build -t test .
docker run -dit -p 80:80 test
