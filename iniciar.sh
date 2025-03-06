#!/bin/bash

if [[ $1 == "start" ]]; then
    # Checa se a rede praia-net-proxy existe e cria caso não exista.
    if ! docker network inspect praia-net-proxy >/dev/null 2>&1; then
        echo "Creating praia-net-proxy network..."
        docker network create praia-net-proxy
    else
        echo "Network praia-net-proxy already exists."
    fi

    cd provedor
    docker compose up --build &
    cd ../clientes/pitangui
    docker compose up --build &
    cd ../pontanegra
    docker compose up --build &

elif [[ $1 == "stop" ]]; then

    cd provedor
    docker compose down &
    cd ../clientes/pitangui
    docker compose down &
    cd ../pontanegra
    docker compose down &

fi
