# Dashboard Quality Report Specification

## Purpose

The Dashboard Quality Report is the framework quality-gate output for dashboard governance, template validation, formatting tests, workflow verification, system-sheet verification, and framework sign-off.

## Governed Sheet

- Sheet name: `Dashboard Quality Report`
- Title: `Report Formatter Framework - v<version> - Dashboard Quality Report`
- Required report width: 7 columns for stored section blocks
- Section block size: fixed block rows controlled by `RFF_DASHBOARD_QUALITY_SECTION_BLOCK_ROWS`
- Quality sections must remain in fixed-position blocks so one section can be refreshed without deleting or shifting unrelated sections.

## Governed Sections

The Dashboard Quality Report must include the registered quality sections defined by the framework section registry. Key report areas include:

- Dashboard Global Inputs
- Dashboard Sheet Definitions
- Dashboard Sheet Headers
- Dashboard Column Definitions
- Dashboard Sheet Behaviors
- Template Validation
- Template Header Audit
- Date Formatting Validation
- Validation Failure Test
- Monthly Change Subheader Test
- Dashboard Audit
- Framework Health Check
- Performance Summary
- Master List Health Check
- Care Plan Sync Diagnostics
- Workflow & Synchronization Verification
- System Sheet Verification
- Framework Summary / Sign-Off

## Processing Requirements

1. Quick and Workflow quality runs must remain separate menu paths.
2. Stored compact rows are the source of truth for Dashboard Quality sections.
3. Section refreshes must use fixed-position, section-scoped writes.
4. Full shell rebuilds are allowed only when the shell is missing or invalid.
5. Dashboard Quality summary rows must calculate overall readiness from stored section statuses.
6. Missing sections must surface as `MISSING` rather than being silently ignored.

## Performance Requirements

- Use compact stored rows rather than reading entire source reports whenever possible.
- Bound source-report reads using configured maximum source rows.
- Avoid row deletion and section shifting during routine section updates.
- Use batched `setValues()` for section content and summary writes.

## Review Checklist

- Verify every registered section has a stable title, key, and block position.
- Verify section writes cannot overwrite neighboring fixed blocks.
- Verify summary/sign-off treats `FAIL` and `MISSING` as action-required states.
- Verify timing summaries read only bounded lookback rows and remain mapped to Section O Performance Summary.
- Verify Quick checks update format/template quality sections and Workflow checks update workflow/dependency quality sections.
- Verify Dashboard Quality Report remains the owner of retired standalone audit output.
