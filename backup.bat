@echo off

set "MYSQL_PATH=C:\xampp\mysql\bin"
set "DB_USER=root"
set "DB_NAME=test"
set "BACKUP_DIR=C:\Users\..complentar con vuestra carpeta destino..\backup"
set "LOG_FILE=C:\Users\..complentar con vuestra carpeta destino..\backup.log"

rem
for /f "tokens=2-4 delims=/ " %%a in ('date /t') do set "datestamp=%%c%%a%%b"
for /f "tokens=1-2 delims=:." %%a in ("%time%") do set "timestamp=%%a%%b"

rem
set "backup_file=%BACKUP_DIR%\godliferp_backup_%datestamp%_%timestamp%.sql"

"%MYSQL_PATH%\mysqldump" -u %DB_USER% %DB_NAME% > "%backup_file%"

echo Backup completa en la fecha %date% %time% >> "%LOG_FILE%"

powershell.exe -File C:\scripts\DiscordScript.ps1
