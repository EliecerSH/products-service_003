@ECHO OFF
setlocal enabledelayedexpansion

set MAVEN_VERSION=3.9.6
set MAVEN_DIR=%USERPROFILE%\.m2\wrapper\dists\apache-maven-%MAVEN_VERSION%
set MAVEN_ZIP=%MAVEN_DIR%-bin.zip
set MVN_CMD=%MAVEN_DIR%\bin\mvn.cmd

if not exist "%MVN_CMD%" (
    echo Descargando Apache Maven %MAVEN_VERSION%...
    if not exist "%USERPROFILE%\.m2\wrapper\dists" mkdir "%USERPROFILE%\.m2\wrapper\dists"
    curl -L "https://archive.apache.org/dist/maven/maven-3/%MAVEN_VERSION%/binaries/apache-maven-%MAVEN_VERSION%-bin.zip" -o "%MAVEN_ZIP%"
    echo Extrayendo Maven...
    powershell -command "Expand-Archive -Path '%MAVEN_ZIP%' -DestinationPath '%USERPROFILE%\.m2\wrapper\dists' -Force"
    del "%MAVEN_ZIP%"
    echo Maven listo.
)

if "%JAVA_HOME%"=="" set JAVA_HOME=C:\Program Files\Java\jdk-21
"%MVN_CMD%" %*
