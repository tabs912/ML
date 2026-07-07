#!/usr/bin/env bash
set -euo pipefail
echo "== Codex Diff Reset (strict) =="

git rev-parse --is-inside-work-tree >/dev/null 2>&1 || exit 1

git restore --staged . || true
git reset --hard HEAD
git clean -fdx

rm -rf Archive Report Governance .codexignore node_modules dist build __pycache__ || true
find . -type f \( -iname "*.pdf" -o -iname "*.xlsx" -o -iname "*.docx" -o -iname "*.pptx" -o -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.zip" -o -iname "*.log" \) -delete || true

NEW_SCRIPT="$(ls -1 scripts/v*_Full_Script.txt 2>/dev/null | sort -V | tail -n 1 || true)"
git restore --staged . || true
[ -f AGENT.md ] && git add AGENT.md
[ -f README.md ] && git add README.md
[ -n "${NEW_SCRIPT:-}" ] && [ -f "$NEW_SCRIPT" ] && git add "$NEW_SCRIPT"

FILES=$(git diff --cached --name-only | sed '/^\s*$/d' | wc -l | tr -d ' ')
LINES=$(git diff --cached --numstat | awk '{a+=$1;d+=$2} END {print a+d+0}')
echo "FILES=$FILES LINES=$LINES"

if [ "$FILES" -gt 25 ] || [ "$LINES" -gt 2000 ]; then
  git restore --staged .
  exit 2
fi
echo "== Codex Diff Reset: done =="
