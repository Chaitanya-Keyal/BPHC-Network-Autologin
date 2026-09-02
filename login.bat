@echo off
setlocal

REM Credentials to try, in order. Format: "username|password"
REM Add more as CRED_3, CRED_4, ... and update CRED_COUNT accordingly.
REM Note: usernames/passwords containing the pipe character are not supported.
set "CRED_1=faaaabbbb|Bits@cccccccc"
set "CRED_2=fxxxxyyyy|Bits@zzzzzzzz"
set "CRED_COUNT=2"

for /l %%i in (1,1,%CRED_COUNT%) do (
    call :try_login "%%CRED_%%i%%"
    if not errorlevel 1 exit /b 0
)

echo All credentials failed
exit /b 1

:try_login
for /f "tokens=1,2 delims=|" %%a in ("%~1") do (
    for /f "delims=" %%r in ('curl --silent --location --max-time 15 "http://172.16.0.30:8090/login.xml" --data-urlencode "mode=191" --data-urlencode "username=%%a" --data-urlencode "password=%%b" ^| findstr /c:"CDATA[LIVE]"') do (
        echo Logged in as %%a
        exit /b 0
    )
    echo Login failed for %%a, trying next credential...
)
exit /b 1
