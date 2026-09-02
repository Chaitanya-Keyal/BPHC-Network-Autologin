@echo off
set /p xml_path= Enter the path of the XML file:

SCHTASKS /CREATE /TN "BPHC Network Login" /XML "%xml_path%" /RU "SYSTEM"
SCHTASKS /CHANGE /TN "BPHC Network Login" /TR "\"%~dp0login.bat\""

echo.
echo Task created. Edit login.bat to set your credentials (format: username^|password).
pause
