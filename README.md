📘 README — Script post-installation Debian
🎯 Description

Ce projet contient un script permettant d’automatiser la post-installation d’un serveur Debian.
Il installe des outils essentiels, configure le réseau, personnalise l’environnement shell, ajoute la résolution NetBIOS, et installe Webmin pour l’administration Web.

⚙️ Contenu du script

Le script réalise :

🟦 Mise à jour du système

apt update && apt upgrade -y

🟩 Installation des utilitaires essentiels

ssh

zip / unzip

nmap

locate (+ updatedb)

ncdu

curl

git

screen

dnsutils (dig)

net-tools (ifconfig)

sudo

lynx

🟨 Installation SMB / NetBIOS

winbind

samba

Modifie /etc/nsswitch.conf pour ajouter :

hosts: files dns wins

🟪 Personnalisation du shell root

Décommentage des alias dans /root/.bashrc :

alias rm='rm -i'

alias cp='cp -i'

alias mv='mv -i'

🟥 Configuration réseau (exemple)

À adapter selon la machine :

auto ens33
iface ens33 inet static
    address 192.168.X.Y/24
    gateway 192.168.X.Z

🟧 Configuration DNS

Dans /etc/resolv.conf :

search tssr.lan
nameserver 192.168.X.Z

🟦 Installation de Webmin
curl -o webmin-setup-repo.sh https://raw.githubusercontent.com/webmin/webmin/master/webmin-setup-repo.sh
sh webmin-setup-repo.sh
apt install webmin --install-recommends -y


Accès :
➡️ https://votre-ip:10000

🎮 Bonus : jeux systèmes BSD
apt install bsdgames
cd /usr/games
./snake

🏃‍♂️ Exécution du script

Sur une machine Debian fraîchement installée :

wget https://raw.githubusercontent.com/jcbernard37-spec/postinstalldebian/main/postinstall.sh
sh postinstall.sh

👤 Auteur

Jean-Christophe Bernard – CEFIM TSSR
Dépôt GitHub : https://github.com/jcbernard37-spec/postinstalldebian
