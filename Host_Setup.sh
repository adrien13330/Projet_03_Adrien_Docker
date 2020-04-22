#Basic Setup
sudo apt -y update
sudo apt -y upgrade

#Tools for Host (Host is a Debian 10 VMware VM)
sudo apt install -y open-vm-tools-desktop

#Curl
sudo apt install -y curl

#Visual Studio Code
curl https://az764295.vo.msecnd.net/stable/ff915844119ce9485abfe8aa9076ec76b5300ddd/code_1.44.2-1587059832_amd64.deb --output /home/$USER/Downloads/code.deb
sudo dpkg -i /home/$USER/Downloads/code.deb

#VMware Workstation Player 15.5.2
#curl http://download3.vmware.com/software/player/file/VMware-Player-15.5.2-15785246.x86_64.bundle --output /home/$USER/Downloads/vmware-workstation-player
#sudo chmod +x vmware-workstation-player
#./vmware-workstation-player
#vagrant plugin install vagrant-vmware-desktop

#Vagrant Virtualbox
echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian bionic contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
sudo apt update
sudo apt install -y virtualbox-6.0

#Vagrant 2.2.7
curl https://releases.hashicorp.com/vagrant/2.2.7/vagrant_2.2.7_x86_64.deb --output /home/$USER/Downloads/vagrant-2.2.7.deb
sudo dpkg -i /home/$USER/Downloads/vagrant-2.2.7.deb

#Vagrant Root Setup
mkdir vagrant_projet_3
cd vagrant_projet_3

#WWW Setup
mkdir html
cd html
echo '<!DOCTYPE html>' >> index.html  | sudo tee -a /etc/apt/sources.list
echo '<html>' >> index.html  | sudo tee -a /etc/apt/sources.list
echo '  <body>' >> index.html  | sudo tee -a /etc/apt/sources.list
echo '    <h1>Getting started with Vagrant!</h1>' >> index.html  | sudo tee -a /etc/apt/sources.list
echo '  </body>' >> index.html  | sudo tee -a /etc/apt/sources.list
echo '</html>' >> index.html  | sudo tee -a /etc/apt/sources.list
cd ..

#Vagrant Config Setup
vagrant init generic/debian10
vagrant box add generic/debian10 --provider=virtualbox

#Vagrant Plugin for box generic/debian10
vagrant plugin install vagrant-vbguest

#Vagrant Vagrantfile Setup
mv Vagrantfile Vagrantfile.old
echo 'Vagrant.configure("2") do |config|' >> Vagrantfile  | sudo tee -a /etc/apt/sources.list
echo '  config.vm.box = "generic/debian10"' >> Vagrantfile  | sudo tee -a /etc/apt/sources.list
echo '  config.vm.synced_folder "", "/vagrant"' >> Vagrantfile  | sudo tee -a /etc/apt/sources.list
echo '  config.vm.provision :shell, path: "bootstrap.sh"' >> Vagrantfile  | sudo tee -a /etc/apt/sources.list
echo '  config.vm.network "forwarded_port", guest: 80, host: 4567' >> Vagrantfile  | sudo tee -a /etc/apt/sources.list
echo '  config.vm.provider "virtualbox" do |v|' >> Vagrantfile  | sudo tee -a /etc/apt/sources.list
echo '    v.memory = 4096' >> Vagrantfile  | sudo tee -a /etc/apt/sources.list
echo '  end' >> Vagrantfile  | sudo tee -a /etc/apt/sources.list
echo 'end' >> Vagrantfile  | sudo tee -a /etc/apt/sources.list

#Vagrant Bootstrap Setup : Visual Studio Code
echo 'curl https://az764295.vo.msecnd.net/stable/ff915844119ce9485abfe8aa9076ec76b5300ddd/code_1.44.2-1587059832_amd64.deb --output /home/$USER/Downloads/code.deb' >> bootstrap.sh  | sudo tee -a /etc/apt/sources.list
echo 'sudo dpkg -i /home/$USER/Downloads/code.deb' >> bootstrap.sh  | sudo tee -a /etc/apt/sources.list

#Vagrant Bootstrap Setup : Ansible - Latest
echo 'echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu bionic main" | sudo tee -a /etc/apt/sources.list' >> bootstrap.sh  | sudo tee -a /etc/apt/sources.list
echo 'sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367' >> bootstrap.sh  | sudo tee -a /etc/apt/sources.list
echo 'sudo apt -y update' >> bootstrap.sh  | sudo tee -a /etc/apt/sources.list
echo 'sudo apt -y install ansible' >> bootstrap.sh  | sudo tee -a /etc/apt/sources.list

#Vagrant Bootstrap Setup : Docker CE - Latest
echo 'sudo apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common' >> bootstrap.sh  | sudo tee -a /etc/apt/sources.list
echo 'curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -' >> bootstrap.sh  | sudo tee -a /etc/apt/sources.list
echo 'sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"' >> bootstrap.sh  | sudo tee -a /etc/apt/sources.list
echo 'sudo apt -y update' >> bootstrap.sh  | sudo tee -a /etc/apt/sources.list
echo 'apt-cache policy docker-ce' >> bootstrap.sh  | sudo tee -a /etc/apt/sources.list
echo 'sudo apt install -y docker-ce docker-ce-cli containerd.io' >> bootstrap.sh  | sudo tee -a /etc/apt/sources.list
echo 'sudo usermod -aG docker $USER' >> bootstrap.sh  | sudo tee -a /etc/apt/sources.list
echo 'pkill -KILL -u $USER' >> bootstrap.sh  | sudo tee -a /etc/apt/sources.list


#Vagrant Startup
vagrant up --provider=virtualbox
