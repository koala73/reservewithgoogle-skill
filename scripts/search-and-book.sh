#!/usr/bin/env bash
set -euo pipefail

PROFILE_DIR="$HOME/.reservegoogle"
SESSION="book-$$"

QUERY="${1:?Usage: search-and-book.sh \"query\" \"date\" \"time\" \"party_size\" \"name\" \"phone\" \"email\"}"
DATE="${2:?Missing date (e.g., 2026-02-15)}"
TIME="${3:?Missing time (e.g., 7:00 PM)}"
PARTY_SIZE="${4:?Missing party size}"
NAME="${5:?Missing name}"
PHONE="${6:?Missing phone}"
EMAIL="${7:?Missing email}"
SPECIAL="${8:-}"

GLOBAL_ARGS=()
if [ -d "$PROFILE_DIR" ]; then
  GLOBAL_ARGS+=(--profile "$PROFILE_DIR")
fi
if [ -n "${AGENT_BROWSER_PROXY:-}" ]; then
  GLOBAL_ARGS+=(--proxy "$AGENT_BROWSER_PROXY")
fi

echo "=== Reserve with Google ==="
echo "Query: $QUERY"
echo "Date: $DATE | Time: $TIME | Party: $PARTY_SIZE"
echo "Name: $NAME | Phone: $PHONE | Email: $EMAIL"
[ -n "$SPECIAL" ] && echo "Special: $SPECIAL"
echo ""

# Step 1: Open Maps
echo "--- Step 1: Opening Google Maps ---"
agent-browser "${GLOBAL_ARGS[@]}" --session "$SESSION" open "https://www.google.com/maps"
agent-browser --session "$SESSION" wait --load networkidle

echo "--- Step 2: Taking snapshot ---"
agent-browser --session "$SESSION" snapshot -i

echo ""
echo "=== READY FOR AGENT ==="
echo "Session: $SESSION"
echo "The AI agent should now:"
echo "1. Parse the snapshot above to find the search box ref"
echo "2. agent-browser --session $SESSION fill @<ref> \"$QUERY\""
echo "3. agent-browser --session $SESSION press Enter"
echo "4. agent-browser --session $SESSION wait --load networkidle"
echo "5. agent-browser --session $SESSION snapshot -i"
echo "6. Identify places with booking, present to user"
echo "7. Click selected result, find booking button"
echo "8. Fill date ($DATE), time ($TIME), party size ($PARTY_SIZE)"
echo "9. Fill name ($NAME), phone ($PHONE), email ($EMAIL)"
echo "10. Show summary, get confirmation, submit"
