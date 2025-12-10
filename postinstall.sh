
#!/bin/bash

echo Mise a jour du pc
apt update -y
apt upgrade -y

echo install truc ssh
apt install ssh -y
apt install zip -y
apt install unzip -y
apt install nmap -y
apt install locate -y
apt install ncdu -y
apt install curl -y
apt install git -y
apt install screen -y
apt install dnsutils -y
apt install net-tools -y
apt install sudo -y
apt install lynx -y

updatedb

echo samba et winbif
apt install samba -y
apt install winbind -y

echo je modifi nsswitch mais je sais pas faire donc je met tout
echo "hosts: files dns wins" >> /etc/nsswitch.conf

echo alias qui marche peut etre
echo alias ll=\'ls -l\' >> /root/.bashrc

echo config ip (j'espere ca marche)
echo auto ens33 > /etc/network/interfaces
echo iface ens33 inet static >> /etc/network/interfaces
echo address 192.168.1.71/24 >> /etc/network/interfaces
echo gateway 192.168.1.1 >> /etc/network/interfaces

echo dns j'ajoute a la main tampi
echo search tssr.lan >> /etc/resolv.conf
echo nameserver 192.168.1.1 >> /etc/resolv.conf

echo hostnmae
echo deb.tssr.lan > /etc/hostname

echo test dns
curl -I https://raw.githubusercontent.com

echo webmin a voir
curl -o webmin-setup-repo.sh https://raw.githubusercontent.com/webmin/webmin/master/webmin-setup-repo.sh
echo y | sh webmin-setup-repo.sh
apt update -y
apt install webmin -y

echo jeux bsd truc
apt install bsdgames -y

echo c fini je croi
