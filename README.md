# Docker_Container_Northwind_SQL
Docker container for Exercise 4.1 of the course databases for legal professionals by Prof. Dr. Nahr at University of Passau.
# Northwind SQL Server – Docker Setup für Einsteiger:innen

Willkommen! Dieses Repository stellt dir eine einfache Möglichkeit zur Verfügung, um lokal einen Microsoft SQL Server 2022 mit der bekannten **Northwind-Datenbank** laufen zu lassen – ganz ohne komplizierte Installation oder Vorwissen.

Du brauchst nur **Docker** – und schon kannst du SQL lernen, üben und ausprobieren!

---

## Was ist die Northwind-Datenbank?

Northwind ist eine Beispiel-Datenbank von Microsoft, die häufig in Schulungen verwendet wird. Sie enthält Daten über:

- Kunden (`Customers`)
- Bestellungen (`Orders`)
- Produkte (`Products`)
- Mitarbeiter (`Employees`)
- Lieferanten (`Suppliers`)

Perfekt für SQL-Übungen wie `JOIN`, `GROUP BY`, `ORDER BY`, `WHERE`, Aggregatfunktionen u. v. m.

---

## Voraussetzungen

Bevor du loslegst, stelle sicher, dass du folgendes installiert hast:

1. **Docker Desktop**  
   - [Download für Windows/macOS](https://www.docker.com/products/docker-desktop)

2. **(Optional)**: Ein SQL-Client zum Verbinden mit der Datenbank, z. B.  
   - [DBeaver (Open Source)](https://dbeaver.io/)
   - [Azure Data Studio](https://learn.microsoft.com/de-de/sql/azure-data-studio/)
   - [SQL Server Management Studio (SSMS)](https://learn.microsoft.com/de-de/sql/ssms/)

---

**##  Schnellstart (Step-by-Step)**

**### 1. Repository herunterladen**

Öffne ein Terminal (macOS/Linux) oder PowerShell (Windows) und führe aus:

git clone <-Link-zu-diesem-Repo->

Nach erfolgtem Klonen noch in den Ordner wechseln:
cd Docker_Container_Northwind_SQL/

### 2. Script ausführen um den Container zu erstellen (inkl. Datenbank)
Für Windows (Powershell):
.\start.ps1

Für Linux (Admin-BErechtigung ggfs. notwendig!):
chmod +x start.sh
./start.sh

Oder eben als Admin:
sudo chmod +x start.sh
sudo ./start.sh

### 3. Passwortanforderungen
SQL erfordert ein "starkes" Passwort um initialisiert werden zu können.
Der SA_PASSWORD muss:

Mindestens 8 Zeichen lang sein

Mindestens 1 Großbuchstaben

Mindestens 1 Kleinbuchstaben

Mindestens 1 Zahl

Mindestens 1 Sonderzeichen enthalten
Gültig wäre z.B.: StrongP@ssw0rd


### 4. Container starten
Zum Starten des Containers:
docker compose up -d
# -d wird genutzt um den service zu detachen.

Zum Stoppen des Containers:
docker compose down

### 5. Verbindung zur Datenbank
Du kannst dich mit einem SQL-Tool deiner Wahl verbinden, z. B. mit DBeaver oder Azure Data Studio:
Datenbank-Typ: Microsoft SQL Server
Host: localhost (Oder wenn WSL: IP-Adresse des WSL -> ifconfig)
Port: 1433
Benutzer: SA
Passwort: das Passwort, das du im Startskript angegeben hast

northwind-docker-sqlserver/
├── Dockerfile          # Erstellt das SQL Server-Image & lädt Northwind-Daten
├── docker-compose.yml  # Startet den Container mit allen nötigen Parametern
├── start.sh            # Startskript für Linux/macOS
├── start.ps1           # Startskript für Windows
├── .gitignore          # Ignoriert temporäre Dateien
