# AGENTS.md

## Purpose

This document defines mandatory operating instructions for AI agents working on the Master List Framework.

Applies to:

* Codex
* ChatGPT
* Claude
* Gemini
* Cursor
* Copilot
* Any AI-assisted framework engineering workflow

Required Startup Procedure

Before performing any work:

1. Determine repository root.

2. Read AGENTS.md completely.

3. Read README.md completely.

4. Read all files in:
   - /Current_Production
   - /spec

5. Report missing artifacts.

6. Execute startup verification:

   git status -sb
   git remote -v
   git branch --show-current
   git log -1 --oneline
   git ls-remote origin
   git fetch origin --prune

7. Report:
   - Current branch
   - Current commit
   - Remote URL
   - Synchronization status
   - Missing artifacts
   - Readiness status

8. Do not modify files during startup verification.

9. Wait for instructions after reporting results.

Required Artifacts

- AGENTS.md
- README.md
- /Current_Production
- /spec

If any required artifact is missing:
- Report the missing artifact.
- Stop and wait for instructions.
- Do not assume missing artifacts exist.


- Diff Exclusion Rules

Do not modify, stage, or include in generated diffs:

- Archive/
- Report/
- Codex_Ignore/
- Governance/
- Reference/
- Report/
- spec/
- *.pdf
- *.xlsx
- *.png
- *.jpg
- *.zip
-

These folders are reference/storage only.
Do not include them in commits, patches, reviews, or generated diffs unless explicitly instructed.

Diff Cleanup Policy

Before generating a diff:

1. Remove Archive/
2. Remove Report/
3. Remove Codex_Ignore/
4. Remove all binary files:
   - pdf
   - xlsx
   - docx
   - pptx
   - png
   - jpg
   - zip

Only include:
- Current_Production/
- scripts/
- spec/
- AGENTS.md
- README.md

Do not read these directories.
.codexignore/

If the diff exceeds 25 files or 2000 lines:
- Stop
- Clean the diff
- Split the work into phases
---
Temporary Branch Policy

Allowed persistent branches:
- main
- work

Temporary branches:
- codex
- codex/*
- backup/*
- Push-Script-Here

must be deleted immediately after:
- merge
- PR creation
- file extraction
- task completion

Do not retain temporary branches between Codex sessions.
# Governing Authority

Review in this order:

1. Master List Framework Specification v1.9
2. Daily Framework Review Protocol v1.9
3. Current Approved Production Script
4. Production Baseline v1.4.23
5. Current Framework Update Log
6. Dashboard Quality Specifications
7. Timing Specifications
8. Mapping Documents
9. Knowledge Base Index
10. Current Conversation Context

Framework Specification is authoritative.

---

# Daily Framework Review Requirement

At the first framework interaction of a work session:

Review:

* Current Governing Specification
* Production Baseline
* Current Approved Production Script
* Dashboard Quality Reports
* Timing Reports
* Validation Reports
* Mapping Documents
* Current Framework Update Log
* Knowledge Base Index

Perform a Framework Delta Review.

If no framework governance changes are identified, state:

```text
No framework governance changes identified since the last framework update.
```

---

# Production Script Access Rule

Before code-level recommendations:

Verify availability of:

* Current Approved Production Script
* Uploaded Source Files
* Approved Script Archives

If unavailable, state:

```text
Current Approved Production Script is not fully available for code-level review.
```

Do not reconstruct missing code from memory.

---

# Framework Continuity Rule

Treat the newest approved artifact as the baseline.

Before recommending changes:

* Compare against current baseline.
* Identify framework deltas.
* Preserve approved architecture.
* Preserve governance decisions.
* Preserve synchronization standards.
* Preserve protected standards.

Do not reintroduce retired architecture.

---

# Architecture Rules

Maintain:

* Single File Architecture
* Dashboard Driven Framework
* Dashboard Controlled Templates
* Template First Formatting
* Primary PMR Architecture
* One Pass Processing
* Dashboard Quality Architecture
* Timing Framework
* Validation Framework

Do not recommend modular architecture until production stabilization is complete.

---

# Appendix Governance

When changes affect:

* Columns
* Headers
* Templates
* Sheet Definitions
* Data Source Mappings
* Synchronization Logic

Verify alignment against:

* Appendix A – Column Configuration Tables
* Appendix B – Sheet Definitions
* Appendix C – Data Source Mapping Tables

Appendix C is the authoritative mapping source.

---

# Dashboard Governance

Dashboard owns:

* Sheet Definitions
* Header Definitions
* Column Definitions
* Sheet Behavior Definitions
* Template Definitions
* Dashboard Quality Definitions
* Timing Definitions

Processing logic does not own formatting.

Formatting ownership belongs to the Dashboard.

---

# Dashboard Quality Governance

Dashboard Quality Report is the authoritative QA artifact.

Tests update only their assigned section.

Do not:

* Rebuild Dashboard Quality
* Delete Dashboard Quality
* Recreate Dashboard Quality
* Insert section rows
* Delete section rows

Use section-only updates.

---

# Timing Governance

Framework Timing Report is the authoritative timing artifact.

Time:

* Major workflows
* Menu processes
* Validation workflows
* Dashboard Quality workflows

Do not time:

* Helper functions
* Utility functions
* Formatting functions
* Color functions

---

# System Sheet Governance

Protected System Sheets:

* Format Dashboard
* Dashboard Quality Report
* Framework Timing Report
* Master List Change Log
* Disenrolled Exclusion List

Business workflows may not modify system sheet structures.

---

# Continuous Execution Protocol

Proceed through all required phases necessary to complete the requested objective.

Do not stop after completing an intermediate phase solely to request confirmation.

Continue automatically through:

* Reviews
* Audits
* Mapping
* Validation
* Source Extraction
* Function Replacement
* Source Merge
* Build Activities

Stop only when:

* A governance blocker exists.
* A required artifact is unavailable.
* Release approval is required.
* The requested objective is complete.

---

# Release Approval Boundary

The agent may perform without additional approval:

* Review
* Audit
* Validate
* Analyze
* Extract
* Map
* Merge
* Build
* Generate Production Candidates
* Generate Release Packages

The agent may not:

* Promote a script to Current Approved Production Script
* Replace Production Baseline
* Modify Governing Authority

without explicit approval.

---

# Required Output Format

Never reuse script version unless instructed to do so. 

When performing framework engineering provide:

1. Framework Delta Review
2. Architecture Audit
3. Helper Audit
4. Dependency Audit
5. Performance Audit
6. Change Summary
7. Testing Recommendations
8. Framework Health Check
9. Recommended Version

---

# Development Philosophy

Use uploaded scripts as source of truth.

Preserve working business logic.

Replace only:

* Performance bottlenecks
* Dashboard architecture
* Validation architecture
* Timing architecture
* Formatting architecture

Avoid unnecessary rewrites.

Always recommend testing after updates.

# Production Release Management

Upon approval of a new production script:

1. Create the new Current Approved Production Script.
2. Move the previous Current Approved Production Script into Production_Script_Archive.
3. Rename the archived script using:

   vX.X.X_Production_Script_Archive.txt

4. Add the new script to:

   Current_Production/

5. Update:

   Current_Framework_Update_Log

6. Commit all release artifacts to the repository.

Only one file may carry the designation:

Current_Approved_Production_Script



# Production Script Storage

All production scripts shall be saved permanently in:

ML/scripts/

Each approved script version shall remain in ML/scripts for lineage, regression review, and historical audit.

The current approved script shall also be copied to:

Current_Production/

Only one script in Current_Production may carry the designation:

_Current_Approved_Production_Script

When a new script is approved:

1. Save the new script in ML/scripts/
2. Copy the same script into Current_Production/
3. Rename the prior current script in ML/scripts/ as:

   vX.X.X_Production_Script_Archive.txt

4. Remove the prior current script from Current_Production/
5. Confirm Current_Production contains only the newest current approved script.

---

