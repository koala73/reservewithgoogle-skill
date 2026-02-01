#!/usr/bin/env bash
set -euo pipefail

PROFILE_DIR="$HOME/.reservegoogle"
QUERY="${1:?Usage: search-places.sh \"search query\"}"
SESSION="${2:-search-$$}"

PROFILE_ARGS=()
if [ -d "$PROFILE_DIR" ]; then
  PROFILE_ARGS=(--profile "$PROFILE_DIR")
fi

echo "=== Searching Google Maps: $QUERY ==="

agent-browser "${PROFILE_ARGS[@]}" --session "$SESSION" open "https://www.google.com/maps"
agent-browser --session "$SESSION" wait --load networkidle

agent-browser --session "$SESSION" snapshot -i
# Agent should parse snapshot output to find search box ref (e.g., @e1)
# Then continue with:
#   agent-browser --session "$SESSION" fill @e1 "$QUERY"
#   agent-browser --session "$SESSION" press Enter
#   agent-browser --session "$SESSION" wait --load networkidle
#   agent-browser --session "$SESSION" snapshot -i

echo ""
echo "Session: $SESSION (use this to continue interacting)"
echo "Next: find the search box ref in the snapshot above, then run:"
echo "  agent-browser --session $SESSION fill @<ref> \"$QUERY\""
echo "  agent-browser --session $SESSION press Enter"
