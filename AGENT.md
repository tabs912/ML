# AGENTS.md

# Master List Framework - Codex Operating Instructions

## Purpose

This repository contains the production source code, specifications, governance documents, and supporting artifacts for the Master List Framework.

The objective is to evolve the current production framework while preserving approved business logic, governance decisions, architecture standards, and workflow behavior.

---

# Governing Authority

When conflicts exist, use the following hierarchy:

1. Framework Specification (highest authority)
2. Current Approved Production Script
3. Production Baseline
4. Governance Decisions
5. Validation Reports
6. Timing Reports
7. Architecture Reports
8. README.md

Never override Framework Specification requirements without explicit instruction.

---

# Required Startup Procedure

Before performing any work:

1. Determine repository root.
2. Read README.md.
3. Read all files in /spec.
4. Read all files in /review.
5. Identify Current Approved Production Script.
6. Identify Framework Specification version.
7. Summarize findings.
8. Report missing files.
9. Stop and wait for instructions if required artifacts are missing.

Do not assume missing files exist.

---

# Development Rules

## Rule 1 - No Patch Style Fixes

Do not layer fixes on top of existing logic.

When updating a function:

* Review the entire function.
* Replace obsolete logic.
* Remove deprecated logic.
* Remove duplicate logic.
* Remove orphaned logic.

Avoid accumulation of technical debt.

---

## Rule 2 - Preserve Working Functionality

Do not modify:

* working business logic
* working workflow logic
* approved governance behavior

unless specifically requested.

---

## Rule 3 - Remove Orphaned Code

Identify and remove:

* unused functions
* duplicate functions
* obsolete helpers
* abandoned validation logic
* dead code

No orphaned code should remain after a rebuild.

---

## Rule 4 - Full Dependency Review

Before modifying a function:

Identify:

* callers
* downstream dependencies
* helper dependencies
* workflow dependencies

Do not break dependency chains.

---

# Architecture Standards

Approved architecture:

* Template First Architecture
* Dashboard Driven Governance
* Dashboard Controlled Templates
* Single File Production Architecture (until approved otherwise)
* One Pass Processing
* Full Replacement Updates
* Primary PMR Row Architecture
* Batch Processing Architecture

Do not introduce conflicting architectures.

---

# Performance Standards

Always prefer:

* Batch reads
* Batch writes
* Array processing
* In-memory transformations
* Maps
* Sets
* Single-pass processing

Avoid:

* getValue() inside loops
* setValue() inside loops
* getRange() inside loops
* repeated sheet lookups
* excessive SpreadsheetApp.flush()

---

# Master List Framework Standards

## Header Standards

All production sheets:

* Title Rows: 1-4
* Header Row: 4
* Data Row Start: 5

Freeze:

* Rows 1-4
* Columns A-B

---

## Processing Order

Current approved workflow:

1. Format Banner Report
2. Format Care Plan Due Date Report
3. Format Unlocked Care Plan Report
4. Format Raw Data
5. Create Disenrollment Exclusion List
6. Process Demo P
7. Create Master List
8. Monthly Change Report
9. Master List Change Log
10. Dashboard Quality Review

---

## Primary PMR Row Governance

Primary PMR Row is authoritative.

Requirements:

* Primary PMR assignment occurs in Demo P.
* Downstream processing uses Primary PMR Row.
* Non-primary rows may be hidden or removed according to approved workflow.

---

## Disenrollment Governance

Disenrollment operates at PMR level.

If any row for a PMR is disenrolled:

* Entire PMR is excluded from Master List.
* Entire PMR is excluded from Monthly Change Report.
* PMR is added to Disenrollment Exclusion List.

---

## Banner Synchronization

Banner information synchronizes during Demo P processing.

Preserve approved synchronization behavior.

Do not remove synchronization logic without explicit approval.

---

## Care Plan Synchronization

Care Plan Due Date and Unlocked Care Plan reports synchronize from Master List using approved matching logic.

Maintain synchronization integrity.

---

# Code Review Requirements

When performing reviews:

Audit:

* Runtime errors
* Architecture
* Dependencies
* Performance
* Workflow integrity
* Governance compliance

Identify:

* orphaned functions
* duplicate logic
* performance bottlenecks
* governance violations
* workflow regressions

---

# Rebuild Requirements

Before any rebuild:

1. Review current production script.
2. Review specification.
3. Review governance decisions.
4. Review dependency chains.
5. Review validation reports.

Rebuild only after complete analysis.

---

# Output Requirements

For all code modifications provide:

* Summary of changes
* Functions modified
* Functions removed
* Functions added
* Dependency impact
* Performance impact
* Test plan
* Known risks

---

# Prohibited Actions

Do not:

* rebuild framework from memory
* ignore specification requirements
* assume missing files
* create duplicate workflows
* create conflicting architectures
* leave orphaned code
* bypass dependency review
* remove governance behavior without approval

---

# Success Criteria

Every change must improve at least one of:

* Stability
* Performance
* Maintainability
* Scalability
* Governance Compliance

while preserving approved framework behavior.

