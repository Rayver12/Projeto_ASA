#!/bin/bash
#
cd provedor
docker compose up --build &
cd ../cliente1
docker compose up --build &
