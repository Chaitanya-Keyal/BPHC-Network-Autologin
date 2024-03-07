@echo off
set /p xml_path= Enter the path of the XML file: 
set /p script_path= Enter the path of the script: 
SCHTASKS /CREATE /TN "BPHC Network Login" /XML "%xml_path%" /RU "SYSTEM"
SCHTASKS /CHANGE /TN "BPHC Network Login" /TR "%script_path%"