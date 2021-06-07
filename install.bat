@echo off
IF NOT EXIST BuildTools (
    mkdir BuildTools
)
cd BuildTools
curl -z BuildTools.jar -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastBuild/artifact/target/BuildTools.jar
set /p Input=Enter the version: || set Input=latest
git config --global --unset core.autocrlf
java -jar BuildTools.jar --rev %Input% --compile craftbukkit --compile spigot
pause