#!/usr/bin/env bash
set -euo pipefail

echo "== Codex Diff Reset (strict) =="

git rev-parse --is-inside-work-tree >/dev/null 2>&1 || {
  echo "Not inside a git repository."
  exit 1
}

# 1) Clean repo + index without leaving tracked artifact deletions unstaged.
git restore --staged . || true
git reset --hard HEAD
git clean -fdx

<<<<<<< HEAD
=======
rm -rf Archive Report Governance .codexignore node_modules dist build __pycache__ || true
find . -type f \( -iname "*.pdf" -o -iname "*.xlsx" -o -iname "*.docx" -o -iname "*.pptx" -o -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.zip" -o -iname "*.log" \) -delete || true

>>>>>>> origin/main
# 2) Detect newest script artifact. Stage exact files only; never stage dirs.
NEW_SCRIPT="$(ls -1 scripts/v*_Full_Script.txt 2>/dev/null | sort -V | tail -n 1 || true)"

echo "Newest script found: ${NEW_SCRIPT:-none}"

git restore --staged . || true
[ -f AGENT.md ] && git add AGENT.md
[ -f README.md ] && git add README.md
[ -n "${NEW_SCRIPT:-}" ] && [ -f "$NEW_SCRIPT" ] && git add "$NEW_SCRIPT"

# 3) Enforce STOP policy.
FILES=$(git diff --cached --name-only | sed '/^\s*$/d' | wc -l | tr -d ' ')
LINES=$(git diff --cached --numstat | awk '{a+=$1;d+=$2} END {print a+d+0}')

echo "FILES=$FILES LINES=$LINES"
echo "== Staged files =="
git diff --cached --name-only || true

if [ "$FILES" -gt 25 ] || [ "$LINES" -gt 2000 ]; then
  echo "STOP: diff too large; unstaging."
  git restore --staged .
  exit 2
fi

echo "== Codex Diff Reset: done =="
