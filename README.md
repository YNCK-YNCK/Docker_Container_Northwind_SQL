# Docker\_Container\_Northwind\_SQL

**Docker-Container für Übung 4.2** des Kurses *Datenbanken für Jurist\:innen* von Prof. Dr. Nahr an der Universität Passau.

---

##  Northwind SQL Server – Docker-Setup für Einsteiger\:innen

Willkommen! Dieses Repository ermöglicht dir, **lokal** einen **Microsoft SQL Server 2022** mit der bekannten **Northwind-Datenbank** in Betrieb zu nehmen – ohne komplexe Installationen oder Vorkenntnisse.

Mit **Docker** kannst du direkt SQL lernen, üben und erste Schritte in relationalen Datenbanken durchführen.

---

## Was ist die Northwind-Datenbank?

Die **Northwind-Datenbank** ist eine von Microsoft bereitgestellte Beispieldatenbank, die in zahlreichen Tutorials und Schulungen verwendet wird. Sie enthält praxisnahe Geschäftsdaten zu:

* **Kunden** (`Customers`)
* **Bestellungen** (`Orders`)
* **Produkte** (`Products`)
* **Mitarbeiter\:innen** (`Employees`)
* **Lieferanten** (`Suppliers`)

Ideal für Übungen zu `SELECT`, `JOIN`, `GROUP BY`, `ORDER BY`, `WHERE`, Aggregatfunktionen u. v. m.

---

## Voraussetzungen

1. **Docker Desktop** (Windows/macOS)
2. **Optional**: Ein SQL-Client deiner Wahl, z. B.

   * [DBeaver (Open Source)](https://dbeaver.io/)
   * [Azure Data Studio](https://learn.microsoft.com/de-de/sql/azure-data-studio/)
   * [SQL Server Management Studio (SSMS)](https://learn.microsoft.com/de-de/sql/ssms/)

---

## Schnellstart

### 1. Repository klonen

```bash
git clone https://github.com/YNCK-YNCK/Docker_Container_Northwind_SQL.git
cd Docker_Container_Northwind_SQL/
```

### 2. Container starten

#### Windows (PowerShell)

```powershell
.
start.ps1
```

#### Linux/macOS

```bash
chmod +x start.sh
./start.sh
```

Bei Bedarf mit `sudo`:

```bash
sudo chmod +x start.sh
sudo ./start.sh
```

### 3. SA-Passwortanforderungen

Der `SA`-Account benötigt ein starkes Passwort:

* Mindestens 8 Zeichen
* Mindestens ein Groß- und ein Kleinbuchstabe
* Mindestens eine Zahl
* Mindestens ein Sonderzeichen

**Beispiel:** `StrongP@ssw0rd!`

---

## Verbindung zur Datenbank

Verbinde deinen SQL-Client mit den folgenden Parametern:

* **Host:** `localhost` (unter WSL ggf. IP aus `ifconfig`)
* **Port:** `1433`
* **Benutzer:** `SA`
* **Kennwort:** (dein `SA`-Passwort)

---

## Northwind-Datenbank importieren

1. **Neue Datenbank erstellen**
   Erstelle in deinem SQL-Client eine Datenbank mit dem Namen **`Northwind`**.

2. **Setup-Skript von Microsoft kopieren**
   Repository: [https://github.com/microsoft/sql-server-samples/blob/master/samples/databases/northwind-pubs/instnwnd.sql](https://github.com/microsoft/sql-server-samples/blob/master/samples/databases/northwind-pubs/instnwnd.sql)

   * Öffne die **Raw-Ansicht** auf GitHub und kopiere das gesamte Skript.

3. **Skript ausführen** *(Beispiel DBeaver)*

   * Rechtsklick auf Datenbank **`Northwind`** → **SQL-Editor → Neues SQL-Skript**
   * Skript einfügen
   * **Hinweis:** Das Skript enthält `GO`-Anweisungen, die in DBeaver nicht als reguläre SQL-Befehle ausgeführt werden.

   **Workaround:**

   * Klicke in das Skriptfenster
   * Führe mit **`ALT + X`** blockweise (bis zum nächsten `GO`) aus

---

## Installation prüfen

### 1. Datenbanken auflisten

```sql
SELECT name FROM sys.databases;
```

> Erwartet: u.a. `Northwind`

### 2. Tabellen anzeigen

```sql
USE Northwind;

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';
```

> Erwartete Tabellen:

```
Employees
Categories
Customers
Shippers
Suppliers
Orders
Products
Order Details
CustomerCustomerDemo
CustomerDemographics
Region
Territories
EmployeeTerritories
```

### 3. Beispielabfrage

```sql
SELECT TOP 5 CompanyName, ContactName
FROM Customers;
```

> Sollte einige Kundendatensätze zurückliefern.

---

##  Tipps & Tricks

* **`GO`-Blöcke**: In DBeaver einzeln ausführen mit **`ALT + X`**
* **Container zurücksetzen**: `docker compose down -v` löscht Volumes und Netzwerke
* **Container Abschalten**: `docker compose down` Beendet den Container in Docker

---

Viel Erfolg beim Lernen mit SQL & der Northwind-Datenbank! 
