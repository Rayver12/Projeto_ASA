#!/bin/bash

if [[ $1 == "start" ]]; then
       	
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
