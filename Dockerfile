FROM mcr.microsoft.com/windows/nanoserver

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN powershell -command \
    Invoke-WebRequest "https://downloads.mysql.com/archives/get/file/mysql-5.7.16-winx64.zip" -OutFile "mysql.zip" ; \
    Expand-Archive -Path c:\mysql.zip -DestinationPath C:\app\ ; \
    Remove-Item mysql.zip ; \
    Rename-Item C:\app\mysql-5.7.16-winx64 C:\app\MySQL ; \
    New-Item -Path C:\app\MySQL\data -ItemType directory ;
