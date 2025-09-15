# On utilise l'image de mariadb comme base
FROM mariadb:11

# variables d'environnement
ENV MYSQL_ROOT_PASSWORD=azer
ENV MYSQL_DATABASE=mydatabase
ENV MYSQL_USER=bruno
ENV MYSQL_PASSWORD=12345

# CMD...
# Mets à jour la liste des paquets disponibles
RUN apt-get update
# installe les paquets openssh-client et openssh-server
RUN apt-get install -y --fix-missing openssh-client openssh-server
