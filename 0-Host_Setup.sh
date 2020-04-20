#Basic Setup
sudo apt-get -y update
sudo apt-get -y upgrade

#Curl
sudo apt install -y curl

#Visual Studio Code
curl https://az764295.vo.msecnd.net/stable/ff915844119ce9485abfe8aa9076ec76b5300ddd/code_1.44.2-1587059832_amd64.deb --output /home/$USER/Downloads/code.deb
sudo dpkg -i /home/$USER/Downloads/code.deb

#VMware Workstation Player 15.5.2
curl http://download3.vmware.com/software/player/file/VMware-Player-15.5.2-15785246.x86_64.bundle --output /home/$USER/Downloads/vmware-workstation-player
sudo chmod +x vmware-workstation-player
./vmware-workstation-player

#Vagrant 2.2.7
curl https://releases.hashicorp.com/vagrant/2.2.7/vagrant_2.2.7_x86_64.deb --output /home/$USER/Downloads/vagrant-2.2.7.deb
sudo dpkg -i /home/$USER/Downloads/vagrant-2.2.7.deb

#Vagrant root
mkdir vagrant_projet_3
cd vagrant_projet_3
vagrant init

#Vagrantfile setup
mv Vagrantfile Vagrantfile.old
echo "Vagrant.configure(\"2\") do |config|" >> Vagrantfile  | sudo tee -a /etc/apt/sources.list
echo "  config.vm.box = \"generic/debian10\"" >> Vagrantfile  | sudo tee -a /etc/apt/sources.list
echo "  config.vm.provision :shell, path: \"bootstrap.sh\"" >> Vagrantfile  | sudo tee -a /etc/apt/sources.list
echo "  config.vm.network \"forwarded_port\", guest: 80, host: 4567" >> Vagrantfile  | sudo tee -a /etc/apt/sources.list
echo "end" >> Vagrantfile  | sudo tee -a /etc/apt/sources.list

#Bootstrap setup
echo "apt-get install -y apache2" >> bootstrap.sh  | sudo tee -a /etc/apt/sources.list
echo "if ! [ -L /var/www ]; then" >> bootstrap.sh  | sudo tee -a /etc/apt/sources.list
echo "  rm -rf /var/www" >> bootstrap.sh  | sudo tee -a /etc/apt/sources.list
echo "  ln -fs /vagrant /var/www" >> bootstrap.sh  | sudo tee -a /etc/apt/sources.list
echo "fi" >> bootstrap.sh  | sudo tee -a /etc/apt/sources.list
