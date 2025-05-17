param()
# Passwort als SecureString einlesen
$pwd = Read-Host "Enter SA password for SQL Server" -AsSecureString
# Umwandeln in plain text
$BSTR = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($pwd)
$Env:SA_PASSWORD = [Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)

docker-compose up --build
