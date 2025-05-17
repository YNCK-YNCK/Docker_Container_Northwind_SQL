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
