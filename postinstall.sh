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
# On ajoute le DNS SANS ECRASER resolv.conf
echo "search tssr.lan" | tee -a /etc/resolv.conf > /dev/null
echo "nameserver 192.168.1.1" | tee -a /etc/resolv.conf > /dev/null

echo "== Configuration du hostname =="
echo "deb.tssr.lan" > /etc/hostname

echo "== Vérification DNS avant installation Webmin =="
if curl -Is https://raw.githubusercontent.com >/dev/null 2>&1; then
    echo "[OK] DNS opérationnel"
else
    echo "[ERREUR] DNS ne fonctionne pas. Webmin ne pourra pas s’installer."
fi

echo "== Installation Webmin =="
curl -o webmin-setup-repo.sh https://raw.githubusercontent.com/webmin/webmin/master/webmin-setup-repo.sh

# YES AUTOMATIQUE POUR LE SCRIPT
echo "y" | sh webmin-setup-repo.sh

apt update
apt install -y webmin --install-recommends

echo "== Installation des jeux BSD =="
apt install -y bsdgames

echo "=== INSTALLATION TERMINÉE ==="
