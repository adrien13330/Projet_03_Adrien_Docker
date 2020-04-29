A) Ce repository stocke mes fichiers pour le projet 3 d'OpenClassrooms

Etape 0 : .gitignore, .dockerignore, LICENCE.md, README.txt
Etape 4 : Dockerfile, docker_commands.sh

Usage :
  1. Depuis la VM VMware
    - Accéder à nginx depuis http://172.17.0.1:8080
  2. Depuis la VM Vagrant
    - Accéder à nginx par :
        - wget -O- localhost
        - wget -O- 172.17.0.2
    - Accéder en SSH au container Docker par :
        - ssh root@localhost -p 9090

C) Mon environnement de travail pour ce projet :
  1. PC
  - Windows 10
  - i7 4960X
  - 64 Go RAM
  - SSD Samsung 960 PRO 1 To  
  - Hyperviseur : VMWare Workstation 15.5.2
  
  2. VM VMware
  - Debian 10
  - 4 vCPU
  - 8 Go de RAM
  - 80 Go VHD
  - Hyperviseur : VirtualBox + Vagrant
  
  3. VM Vagrant
  - Debian 10
  - 1 vCPU
  - 4 Go de RAM
  - 32 Go VHD
  - Hyperviseur : Docker
  - Applications : VSCode, Docker, Ansible
  
  4. Docker Container
  - Debian 10
  - Applications : ssh, nginx
  - Ports : 22, 80
