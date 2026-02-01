#!/usr/bin/env bash
set -euo pipefail

PROFILE_DIR="$HOME/.reservegoogle"

echo "=== Reserve with Google — Profile Setup ==="
echo ""
echo "This will open Google Accounts in a persistent browser profile."
echo "Log in to your Google account manually. The session will persist"
echo "for future bookings."
echo ""
echo "Profile location: $PROFILE_DIR"
echo ""

PROXY_ARGS=()
if [ -n "${AGENT_BROWSER_PROXY:-}" ]; then
  PROXY_ARGS=(--proxy "$AGENT_BROWSER_PROXY")
fi

agent-browser --headed --profile "$PROFILE_DIR" "${PROXY_ARGS[@]}" open "https://accounts.google.com"

echo ""
echo "Browser opened. Please log in to your Google account."
echo "Once logged in, close the browser. Your session is saved."
echo ""
echo "To verify, run:"
echo "  agent-browser --profile $PROFILE_DIR open https://www.google.com/maps"
