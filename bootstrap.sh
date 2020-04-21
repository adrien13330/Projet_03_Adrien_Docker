apt-get update
apt-get install -y apache2
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi

#Curl
sudo apt install -y curl

#Visual Studio Code
curl https://az764295.vo.msecnd.net/stable/ff915844119ce9485abfe8aa9076ec76b5300ddd/code_1.44.2-1587059832_amd64.deb --output /home/$USER/Downloads/code.deb
sudo dpkg -i /home/$USER/Downloads/code.deb
