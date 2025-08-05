@echo off
set /p xml_path= Enter the path of the XML file: 
set /p username= Enter your username: 
set /p password= Enter your password: 

SCHTASKS /CREATE /TN "BPHC Network Login" /XML "%xml_path%" /RU "SYSTEM"
SCHTASKS /CHANGE /TN "BPHC Network Login" /TR "curl 'http://172.16.0.30:8090/login.xml' --data-urlencode 'mode=191' --data-urlencode 'username=%username%' --data-urlencode 'password=%password%'"
