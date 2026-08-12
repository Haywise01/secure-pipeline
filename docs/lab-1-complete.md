# Lab 1: Build a Complete CI/CD Security Pipeline

## Summary
This project establishes a comprehensive, automated security pipeline implementing:
- **Build Integrity (ASVS V10.2)**: Signed commits, branch protections, and SLSA provenance.
- **Dependency & Configuration (ASVS V14.2)**: CycloneDX SBOM generation and Trivy container scanning.
- **Machine Secrets (ASVS V2.10)**: OIDC-based temporary AWS authentication and Gitleaks scanning.
