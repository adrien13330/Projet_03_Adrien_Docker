docker pull debian
docker build -t test .
docker run -dit -p 22:22 test /bin/bash

#List of active/inactive containers
docker ps -a

#Attacher à un container en cours d'exécution
docker attach CONTAINER_ID
docker exec -it CONTAINER_ID /bin/bash

#Keeping the container alive
CMD tail -f /dev/null
#Ctrl + p + q to move to background
