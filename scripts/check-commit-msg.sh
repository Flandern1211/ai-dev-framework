#!/usr/bin/env sh
# Optional commit-msg hook: block common secret and PII patterns.
# This is a backstop, not a guarantee. Never put sensitive details in a commit message.
#
# Install:
#   cp scripts/check-commit-msg.sh .git/hooks/commit-msg
#   chmod +x .git/hooks/commit-msg
#
# Optional project deny-list: .evidence-deny, one extended regex per line.
# Lines starting with # are comments. Do not commit .evidence-deny.
set -eu

msg_file="${1:?usage: check-commit-msg.sh <commit-msg-file>}"

filtered="$(mktemp)"
trap 'rm -f "$filtered"' EXIT

# Standard identity trailers legitimately contain email addresses.
grep -Eiv '^(Signed-off-by|Co-authored-by|Reviewed-by|Tested-by|Acked-by|Reported-by):' "$msg_file" > "$filtered" || true

fail=0
scan() {
  label="$1"
  pattern="$2"
  if grep -Eiq -- "$pattern" "$filtered"; then
    printf 'commit-msg: blocked %s\n' "$label" >&2
    fail=1
  fi
}

scan "private key" '-----BEGIN [A-Z ]*PRIVATE KEY-----'
scan "known token prefix" '(ghp_[A-Za-z0-9]{20,}|github_pat_[A-Za-z0-9_]{20,}|xox[baprs]-[A-Za-z0-9-]{10,}|AKIA[0-9A-Z]{16}|sk-[A-Za-z0-9]{20,})'
scan "bearer token" 'Bearer[[:space:]]+[A-Za-z0-9._-]{20,}'
scan "credential assignment" '(password|passwd|secret|token|api[_-]?key|authorization)[[:space:]]*[:=][[:space:]]*[^[:space:]<]'
scan "email address" '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}'
scan "private IP" '(^|[^0-9])(10\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}|192\.168\.[0-9]{1,3}\.[0-9]{1,3}|172\.(1[6-9]|2[0-9]|3[01])\.[0-9]{1,3}\.[0-9]{1,3})([^0-9]|$)'
scan "absolute user path" '(C:\\Users\\|/home/[^/ ]+/|/Users/[^/ ]+/)'

if [ -f .evidence-deny ]; then
  while IFS= read -r pattern; do
    case "$pattern" in
      ''|'#'*) continue ;;
    esac
    scan "project deny-list" "$pattern"
  done < .evidence-deny
fi

if [ "$fail" -ne 0 ]; then
  printf '%s\n' 'commit-msg: redact the message or move details to a private evidence store.' >&2
  exit 1
fi