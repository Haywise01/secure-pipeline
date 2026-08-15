#!/bin/bash
# upload-findings.sh — called after each scan in CI pipeline

DEFECTDOJO_URL=https://defectdojo.internal
ENGAGEMENT_ID=42

# Upload SAST findings
curl -X POST "${DEFECTDOJO_URL}/api/v2/import-scan/" \
  -H "Authorization: Token ${DOJO_API_KEY}" \
  -F "scan_type=Semgrep JSON Report" \
  -F "file=@semgrep.json" \
  -F "engagement=${ENGAGEMENT_ID}" \
  -F "minimum_severity=Medium" \
  -F "push_to_jira=true"

# Upload SCA findings
curl -X POST "${DEFECTDOJO_URL}/api/v2/import-scan/" \
  -H "Authorization: Token ${DOJO_API_KEY}" \
  -F "scan_type=Dependency Check Scan" \
  -F "file=@dependency-check-report.xml" \
  -F "engagement=${ENGAGEMENT_ID}"
