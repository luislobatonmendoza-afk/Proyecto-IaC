#!/bin/bash
set -e 

PROXY_IP=$1
DB_STATUS_OK_STRING="Data Retrieved Successfully"

echo "--- Iniciando prueba E2E contra http://${PROXY_IP}:80 ---"

RESPONSE_BODY_LOG=$(
    for i in {1..4}; do
        curl -s http://${PROXY_IP}:80
    done
)

if [[ "$RESPONSE_BODY_LOG" != *"frontend-0"* ]] || [[ "$RESPONSE_BODY_LOG" != *"frontend-1"* ]]; then
    echo " Falla E2E: El balanceo de carga no alcanzó a ambos frontends."
    echo "Respuestas recibidas: ${RESPONSE_BODY_LOG}"
    exit 1
fi

if [[ "$RESPONSE_BODY_LOG" != *"$DB_STATUS_OK_STRING"* ]]; then
    echo " Falla E2E: El contenido de la aplicación no confirma la conexión con la Base de Datos privada."
    exit 1
fi

echo " Éxito E2E: El flujo completo ha pasado."
exit 0