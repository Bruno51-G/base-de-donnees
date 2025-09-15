# On utilise l'image de mariadb comme base
FROM mariadb:11

# variables d'environnement

# Mot de passe ROOT du serveur de base de données
ENV MYSQL_ROOT_PASSWORD=azer

# Nom de la base de données qui sera créée au 1er démarrage du conteneur
ENV MYSQL_DATABASE=mydatabase

# Nom d'utilisateur pour se connecter à la base de données
ENV MYSQL_USER=bruno

# Mot de passe pour se connecter à la base de données
ENV MYSQL_PASSWORD=12345

# CMD...
# Mets à jour la liste des paquets disponibles / Mets à jour la liste des logiciels du conteneur
RUN apt-get update

# installe les paquets openssh-client et openssh-server / Installer la couche SSH (pour sécuriser les connexions et permettre de se connecter au terminal à distance)
# -y accepter automatiquement l'installation
# --fix-missing permet de corriger les dépendances manquantes dans un projet, généralement en réinstallant ou synchronisant les paquets manquants dans le dossier
RUN apt-get install -y --fix-missing openssh-client openssh-server
