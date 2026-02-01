# Reserve with Google — Agent Browser Skill

An [agentskills.io](https://agentskills.io/specification) skill that books reservations through Google Maps using [agent-browser](https://github.com/vercel-labs/agent-browser) automation.

## What it does

- Searches Google Maps for businesses
- Detects "Reserve with Google" availability
- Completes bookings through Google-native widgets or 3rd-party providers (OpenTable, Resy, Vagaro, Yelp, Toast)
- Confirms before submitting, captures confirmation details

## Supported business types

- **Restaurants** (primary) — table reservations with date, time, party size
- **Salons & Spas** — service and staff selection
- **Fitness studios** — class booking
- **Healthcare** — appointment scheduling

## Install

```bash
npx skills add koala73/reservewithgoogle-skill
```

## Prerequisites

- [agent-browser](https://github.com/vercel-labs/agent-browser) installed (`npm install -g agent-browser`)
- Internet access

### Optional: Persistent Google profile

Set up once for authenticated sessions (reduces CAPTCHAs, enables more booking providers):

```bash
agent-browser --headed --profile ~/.reservegoogle open "https://accounts.google.com"
# Log in manually, then close the browser
```

### Optional: Authenticated proxy

Route traffic through an HTTP or SOCKS5 proxy with username/password authentication:

```bash
export AGENT_BROWSER_PROXY="http://user:pass@proxy.example.com:10001"
```

All scripts pick up this env var automatically. Supports formats:
- `http://user:pass@host:port`
- `socks5://user:pass@host:port`

Add to `~/.zshrc` for persistence across terminal sessions.

## Usage

Once installed, tell your AI agent:

> "Book a table for 2 at an Italian restaurant downtown tonight at 7pm"

The agent will:
1. Search Google Maps
2. Present bookable options
3. Walk through the reservation flow
4. Ask for confirmation before submitting

## File structure

```
├── SKILL.md                        # Skill definition & agent instructions
├── scripts/
│   ├── setup-profile.sh            # One-time Google account profile setup
│   ├── search-places.sh            # Search & list bookable places
│   └── search-and-book.sh          # Full booking flow launcher
├── references/
│   ├── REFERENCE.md                # Google Maps element patterns
│   ├── FORMS.md                    # Form templates per business type
│   └── THIRD-PARTY-PROVIDERS.md    # OpenTable, Resy, Vagaro, Yelp, Toast flows
└── assets/
    └── selectors.json              # Known UI text patterns & field labels
```

## License

MIT
