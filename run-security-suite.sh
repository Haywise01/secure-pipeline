#!/bin/bash
# run-security-suite.sh — Master DevSecOps Pipeline Local Orchestrator

echo "=========================================="
echo "[*] Starting Local Security Suite Execution"
echo "=========================================="

# 1. Semgrep Static Analysis
echo "[*] Running Semgrep static security analysis..."
semgrep --config=policies/semgrep/sqli-detection.yaml . || echo "[!] Semgrep found policy findings."

# 2. Container Security Scan
if [ -f "./scan-containers.sh" ]; then
    echo "[*] Running container security scan..."
    ./scan-containers.sh
fi

# 3. SBOM Validation
if [ -f "./validate-sbom.sh" ]; then
    echo "[*] Validating Software Bill of Materials..."
    ./validate-sbom.sh
fi

# 4. Governance Gate Check
if [ -f "./governance-check.sh" ]; then
    echo "[*] Evaluating governance gate..."
    ./governance-check.sh
fi

echo "=========================================="
echo "[+] Security suite execution completed!"
echo "=========================================="
