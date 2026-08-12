# Exercise 1.3: Dependency Scanning, SBOM, and Container Scanning

## Overview
This module satisfies ASVS Dependency & Configuration requirements by tracking components and scanning container builds.

## Implemented Controls
1. **SBOM Generation (Syft)**: Automatically creates a CycloneDX JSON inventory of application dependencies.
2. **Container Security (Trivy)**: Builds the container image and blocks deployment if CRITICAL or HIGH vulnerabilities are detected.
