# Étape 1 : Utiliser l'image Open Liberty avec Java 11
FROM openliberty/open-liberty:full-java11-openj9-ubi

# Étape 2 : Copier la configuration du serveur Liberty
COPY src/main/liberty/config /config/

# Étape 3 : Copier l'application Java packagée (par exemple un fichier .war)
COPY target/user_management.war /config/dropins/

# Étape 4 : Exposer les ports nécessaires (9080 pour HTTP, 9443 pour HTTPS)
EXPOSE 9082 9443

# Étape 5 : Démarrer le serveur Liberty
CMD ["/opt/ol/wlp/bin/server", "run", "defaultServer"]
