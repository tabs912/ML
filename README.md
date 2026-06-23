# Master List Framework

## Overview

The Master List Framework is a Google Apps Script–based participant management framework used to process monthly operational reports and produce governed outputs including:

* Raw Data
* Demo P
* Banner Report
* Care Plan Due Report
* Unlocked Care Plan Report
* Master List
* Monthly Change Report
* Disenrolled Exclusion List
* Master List Change Log
* Dashboard Quality Report
* Framework Timing Report

The framework operates under the Master List Framework Specification v1.9 and uses a dashboard-driven architecture.

---

# Current Governance

**Current Governing Specification**

* Master List Framework Specification v1.9

**Current Production Baseline**

* v1.4.23 Production Baseline

**Current Approved Production Script**

* Current Approved Production Script

**Architecture Status**

* Production Stabilization

---

# Core Architecture Principles

## Single File Architecture

The framework remains a single-file Google Apps Script architecture until production stabilization is complete.

Do not introduce modular architecture without governance approval.

---

## Dashboard Driven Architecture

The Format Dashboard is the authoritative configuration source.

The dashboard controls:

* Sheet Definitions
* Header Definitions
* Column Definitions
* Sheet Behavior Definitions
* Template Configuration
* Dashboard Quality Configuration
* Timing Configuration

Business processing does not own formatting.

Formatting ownership belongs to the Dashboard.

---

## Template First Formatting

Templates are formatted once.

Operational reports inherit formatting from templates.

Runtime processing should avoid repeated formatting passes.

---

## Primary PMR Architecture

Every participant has exactly one Primary PMR Row.

Primary PMR assignment occurs during Raw Data processing only.

Primary PMR ownership is not reassigned downstream.

Synchronization targets only the Primary PMR Row.

---

## One Pass Processing

Framework processing should follow:

```text
Read Once
↓
Process In Memory
↓
Write Once
```

Repeated spreadsheet reads/writes should be minimized.

---

# Dashboard Quality Framework

Dashboard Quality Report is the consolidated QA artifact.

Sections:

| Section | Purpose                    |
| ------- | -------------------------- |
| A       | Template Validation        |
| B       | Template Header Audit      |
| C       | Date Formatting Validation |
| D       | Validation Failure Testing |
| E       | Monthly Change Validation  |
| F       | Dashboard Audit            |
| G       | Framework Health Check     |
| H       | Signoff                    |
| I       | Summary                    |
| J       | Timing Summary             |

Dashboard Quality performs section-only updates.

Dashboard Quality does not rebuild the report structure during execution.

---

# Framework Timing

Framework Timing Report provides:

* Process Execution Summary
* Timing Severity Analysis
* Detailed Timing Log
* Performance Findings
* Optimization Recommendations
* Timing Signoff

Only major framework processes should be timed.

Helper functions are excluded from timing metrics.

---

# Governed System Sheets

* Format Dashboard
* Dashboard Quality Report
* Framework Timing Report
* Master List Change Log
* Disenrolled Exclusion List

System sheets are framework-owned assets.

Business workflows may not modify system sheet structure.

---

# Development Standards

Required Standards:

* Single File Architecture
* Dashboard Driven Framework
* Template First Formatting
* Primary PMR Ownership
* One Pass Processing
* Dashboard Quality Consolidation
* Timing Framework
* Full Function Replacement Updates

Avoid:

* Runtime column additions
* Runtime column removals
* Dashboard rebuilds during processing
* Full Dashboard Quality rebuilds
* Reintroduction of retired architecture

---

# Required Governance Documents

Review in this order:

1. Master List Framework Specification
2. Daily Framework Review Protocol
3. Current Approved Production Script
4. Production Baseline
5. Current Framework Update Log
6. Dashboard Quality Specifications
7. Timing Specifications
8. Mapping Documents
9. Knowledge Base Index

---

# Repository Structure

```text
src/
├── Code.gs

spec/
├── v1.9_Master_List_Framework_Specification.pdf
├── v1.9_Daily_Framework_Review_Protocol.pdf
├── Current_Framework_Update_Log.docx
├── Dashboard Specifications
├── Timing Specifications
└── Architecture Specifications

Current_Production/
├── Current Approved Production Script

Archive/
├── Production Script Archive
└── Historical Reference Archive
```

---

# Release Philosophy

Preserve working business logic.

Replace only:

* Performance bottlenecks
* Dashboard architecture issues
* Validation architecture issues
* Timing architecture issues
* Formatting architecture issues

Do not rewrite stable production business logic without governance approval.
