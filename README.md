# README — Script de post-installation Debian

Ce dépôt contient un script qui automatise une partie de la post-installation d’un serveur Debian.
Je l’ai écrit pour gagner du temps après l’installation de base : installation des outils essentiels,
configuration réseau, personnalisation minimale du shell, ajout de la résolution NetBIOS et installation
de Webmin pour l’administration Web.

---

## 1. Description générale du script

Le script enchaîne automatiquement plusieurs étapes :

- mise à jour du système ;
- installation des utilitaires de base ;
- configuration de SMB / NetBIOS (winbind, samba, nsswitch.conf) ;
- personnalisation simple du shell root (alias de sécurité) ;
- exemple de configuration réseau en IP fixe ;
- exemple de configuration DNS ;
- installation de Webmin ;
- installation optionnelle des jeux BSD.

Les exemples d’adressage et de DNS sont à adapter à la machine et au réseau utilisés.

---

## 2. Mise à jour du système

Mise à jour de la liste des paquets et installation des mises à jour disponibles :

```bash
apt update && apt upgrade -y
