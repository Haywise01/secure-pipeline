#!/bin/bash
# scan-containers.sh — Local container security scanner

IMAGE_NAME="secure-pipeline-app:latest"

echo "[*] Building local container image..."
docker build -t ${IMAGE_NAME} .

echo "[*] Running Snyk container scan..."
snyk container test ${IMAGE_NAME} --severity-threshold=high

echo "[*] Running Trivy vulnerability scan..."
trivy image --severity HIGH,CRITICAL ${IMAGE_NAME}
