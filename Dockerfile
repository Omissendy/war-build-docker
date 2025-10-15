# -----------------------------
# 🧱 Base de l'image
# -----------------------------
# Utilisation de l'image officielle Tomcat (version 9, compatible Java 8/11)
FROM tomcat:9.0

# -----------------------------
# 👤 Informations sur le mainteneur
# -----------------------------
LABEL maintainer="jean <jean@localhost>"

# -----------------------------
# 🧹 Nettoyage des applications par défaut de Tomcat
# -----------------------------
# (on supprime ROOT, examples, docs, etc. pour éviter les conflits)
RUN rm -rf /usr/local/tomcat/webapps/*

# -----------------------------
# 📦 Copie du fichier WAR Maven dans le dossier webapps de Tomcat
# -----------------------------
# Le fichier .war est généré par Maven dans target/hello-world.war
COPY target/hello-world.war /usr/local/tomcat/webapps/ROOT.war

# -----------------------------
# 🌐 Exposition du port de Tomcat
# -----------------------------
# Par défaut, Tomcat écoute sur le port 8080
EXPOSE 8080

# -----------------------------
# 🚀 Commande de lancement du serveur
# -----------------------------
# Démarre Tomcat au premier plan (important pour Docker)
CMD ["catalina.sh", "run"]


