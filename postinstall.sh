#!/bin/bash

echo "== Mise à jour =="
apt update && apt upgrade -y

echo "== Installation des utilitaires =="
apt install -y ssh zip unzip nmap locate ncdu curl git screen dnsutils net-tools sudo lynx

echo "== Mise à jour de la base locate =="
updatedb

echo "== Installation Winbind + Samba (NetBIOS) =="
apt install -y winbind samba

echo "== Modification de /etc/nsswitch.conf (ajout de wins) =="
sed -i 's/^hosts:.*/hosts:          files dns wins/' /etc/nsswitch.conf

echo "== Personnalisation du bash root (activation alias) =="
sed -i 's/^# alias/alias/' /root/.bashrc

echo "== Configuration réseau IP statique =="
cat > /etc/network/interfaces <<EOF
auto ens33
iface ens33 inet static
    address 192.168.1.71/24
    gateway 192.168.1.1
EOF

echo "== Configuration DNS =="
cat > /etc/resolv.conf <<EOF
search tssr.lan
nameserver 192.168.1.1
EOF

echo "== Configuration du hostname =="
echo "deb.tssr.lan" > /etc/hostname

echo "== Installation Webmin =="
curl -o webmin-setup-repo.sh https://raw.githubusercontent.com/webmin/webmin/master/webmin-setup-repo.sh
sh webmin-setup-repo.sh
apt update
apt install -y webmin --install-recommends

echo "== Installation des jeux BSD =="
apt install -y bsdgames

echo "=== INSTALLATION TERMINÉE ==="
