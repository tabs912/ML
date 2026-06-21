# Framework Timing Report Specification

## Purpose

The Framework Timing Report is the performance-governance output for the Master List Framework. It summarizes timed framework processes, identifies slow/bottleneck/critical steps, preserves recent timing detail, and generates optimization recommendations.

## Governed Sheet

- Sheet name: `Framework Timing Report`
- Title: `Report Timing Framework - v<version> - Framework Timing Report`
- Required width: 6 columns
- Required shell sections:
  - `SECTION A - PROCESS SUMMARY`
  - `SECTION B - PERFORMANCE ISSUES`
  - `SECTION C - DETAILED TIMING LOG`
  - `SECTION D - OPTIMIZATION RECOMMENDATIONS`

## Section Contract

| Section | Required Headers | Purpose |
|---|---|---|
| A - Process Summary | `Process`, `Runtime (Sec)`, `Status`, `Benchmark`, `Variance`, `Notes` | One row per timed process with benchmark comparison and worst severity. |
| B - Performance Issues | `Priority`, `Process`, `Runtime (Sec)`, `Threshold`, `Issue`, `Recommendation` | Rows only for slow, bottleneck, or critical timing entries. |
| C - Detailed Timing Log | `Timestamp`, `Process`, `Step`, `Step Seconds`, `Severity`, `Details` | Recent detailed timing rows used as the source for summary and issue analysis. |
| D - Optimization Recommendations | `Process`, `Finding`, `Impact`, `Recommendation`, `Priority`, `Status` | Deduplicated recommendations generated from issue rows. |

## Processing Requirements

1. The report shell must be initialized only when missing or structurally incomplete.
2. A valid shell must not be fully rebuilt during population.
3. Report sections must be replaced section-by-section without shifting unrelated sections unnecessarily.
4. Section writes must normalize row width before writing to the sheet.
5. Timing detail used for combined/dashboard summaries should be bounded by configured lookback limits to avoid unbounded reads.

## Performance Requirements

- Batch section writes with `setValues()` whenever rows are available.
- Avoid per-cell writes in section population except placeholder fallback cells.
- Avoid full-sheet rebuilds after the shell has already been validated.
- Keep expensive styling operations centralized in the report styling helper.

## Review Checklist

- Verify all four section titles exist.
- Verify title text includes the current framework version.
- Verify the section registry headers match report writers.
- Verify `replaceFrameworkTimingSectionRows_` cannot delete or overwrite the next section title.
- Verify timing issue severity thresholds are documented and aligned to recommendations.
- Verify combined Dashboard Quality timing summaries use bounded lookback rows.
