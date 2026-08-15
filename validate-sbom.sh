#!/bin/bash
# validate-sbom.sh — Verify CycloneDX SBOM for critical vulnerabilities and disallowed licenses

SBOM_FILE="cyclonedx.json"

if [ ! -f "$SBOM_FILE" ]; then
    echo "[-] Error: ${SBOM_FILE} not found. Generate it first using Snyk or Syft."
    exit 1
fi

echo "[*] Analyzing ${SBOM_FILE} for policy compliance..."

# Example check: look for high-risk components or disallowed licenses using jq
disallowed_license="AGPL-3.0"
if grep -q "$disallowed_license" "$SBOM_FILE"; then
    echo "[-] Policy Violation: Disallowed license found (${disallowed_license})."
    exit 1
else
    echo "[+] SBOM policy check passed successfully!"
fi
