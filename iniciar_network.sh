#!/bin/bash
echo "--- INICIANDO LA NETWORK ---"

# 1. Iniciar PROXY (Segundo plano)
echo "> Encendiendo Velocity (Proxy)..."
cd Proxy
java -Xms512M -Xmx512M -jar velocity.jar > log.txt 2>&1 &
PID_PROXY=$!
cd ..

# 2. Iniciar LOBBY (Segundo plano)
echo "> Encendiendo Lobby..."
cd Lobby
java -Xms512M -Xmx512M -jar paper.jar --nogui > log.txt 2>&1 &
PID_LOBBY=$!
cd ..

# 3. Iniciar SURVIVAL (Primer plano)
echo "> Encendiendo Survival..."
echo "> NOTA: Escribe 'stop' aquí para apagar todo la network."
cd Survival
java -Xms2G -Xmx2G -jar paper.jar --nogui 

# Apagado
echo "--- APAGANDO EL RESTO DE LA NETWORK ---"
kill $PID_PROXY
kill $PID_LOBBY
echo "Todo apagado correctamente."
