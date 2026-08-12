# Exercise 1.4: OIDC Cloud Authentication & SLSA Provenance

## Overview
This module satisfies ASVS Machine Secrets and Build Integrity requirements by eliminating long-lived credentials and generating verifiable build provenance.

## Implemented Controls
1. **OIDC Federation**: Configured GitHub Actions to authenticate directly with AWS using temporary tokens instead of static credentials.
2. **SLSA Level 2 Provenance**: Generates a cryptographically verified build record to guarantee software supply chain integrity.
