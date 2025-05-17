FROM mcr.microsoft.com/mssql/server:2022-latest

# EULA akzeptieren
ENV ACCEPT_EULA=Y

# curl installieren
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

# Northwind Initialisierungsskript herunterladen
RUN curl -sSL \
    https://raw.githubusercontent.com/microsoft/sql-server-samples/master/samples/databases/northwind-pubs/instnwnd.sql \
    -o /var/opt/mssql/scripts/instnwnd.sql
