FROM mcr.microsoft.com/mssql/server:2022-latest

# Akzeptiere die Lizenzbedingungen
ENV ACCEPT_EULA=Y
# Der SA_PASSWORD wird beim Containerlaufzeit übergeben
ARG SA_PASSWORD

# Root-Rechte aktivieren für Paketinstallation
USER root

# Hilfsprogramme installieren
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

# Erstelle Verzeichnisse
RUN mkdir -p /var/opt/mssql/scripts

# Lade Northwind-Installationsskript herunter
RUN curl -sSL \
    https://raw.githubusercontent.com/microsoft/sql-server-samples/master/samples/databases/northwind-pubs/instnwnd.sql \
    -o /var/opt/mssql/scripts/instnwnd.sql

# Kopiere Initialisierungsskript
COPY entrypoint.sh /usr/src/app/entrypoint.sh
RUN chmod +x /usr/src/app/entrypoint.sh

# Start-Befehl setzen
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]
