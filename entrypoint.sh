#!/bin/bash

# SQL Server im Hintergrund starten
/opt/mssql/bin/sqlservr &

# Warte bis SQL Server bereit ist (Port 1433 offen)
echo "Warte auf SQL Server..."
until /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$SA_PASSWORD" -Q "SELECT 1" &> /dev/null
do
    sleep 1
done

echo "SQL Server ist bereit. Starte Northwind-Initialisierung..."

# SQL-Datei laden, falls sie nicht vorhanden ist
if [ ! -f /var/opt/mssql/scripts/instnwnd.sql ]; then
  echo "📥 instnwnd.sql nicht gefunden – lade von Microsoft-Repo..."
  curl -sSL https://raw.githubusercontent.com/microsoft/sql-server-samples/master/samples/databases/northwind-pubs/instnwnd.sql \
    -o /var/opt/mssql/scripts/instnwnd.sql
fi

# Prüfe, ob Northwind bereits existiert
DB_EXISTS=$(/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$SA_PASSWORD" -Q "IF EXISTS (SELECT name FROM sys.databases WHERE name = 'Northwind') SELECT 1" -h -1)

if [ "$DB_EXISTS" != "1" ]; then
  /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$SA_PASSWORD" -i /var/opt/mssql/scripts/instnwnd.sql
  echo "Northwind-Datenbank wurde erfolgreich erstellt!"
else
  echo "Northwind-Datenbank existiert bereits."
fi

# Halte den SQL Server im Vordergrund aktiv
wait
