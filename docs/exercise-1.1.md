# Exercise 1.1: Source Control Security Controls

## Overview
This module implements foundational source code security controls to satisfy ASVS Build Integrity requirements. By locking down the main branch and enforcing strict review paths via CODEOWNERS, we prevent unauthorized code injections.

## Implemented Controls
1. **Branch Protection**: Requires status checks, signed commits, and linear history.
2. **Granular CODEOWNERS**: Configured security and platform team reviews for sensitive paths (`/src/auth/`, `/.github/workflows/`).
