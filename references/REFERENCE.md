# Reference: Google Maps Booking Element Patterns

## Google Maps Search Results

After searching, the results panel typically contains:

- **Result cards**: Each with business name, rating, price range, cuisine type
- **Booking indicators**: Text like "Reserve a table" or "Book online" appears below the business info
- **Action buttons**: "Directions", "Website", "Call", and booking buttons

### Common Snapshot Patterns

Search box: Look for `textbox` with name containing "Search" or "search Google Maps"

Results list: Look for `listitem` or `link` elements with business names

Booking buttons: Look for `button` or `link` containing:
- "Reserve a table"
- "Book online"
- "Book an appointment"
- "Find a table"
- "Schedule"

## Business Detail Panel

After clicking a result, the detail panel shows:

- Business name (heading)
- Rating, reviews count
- Address, hours
- Photos
- **Booking section**: Usually a prominent button or embedded widget

### Booking Button Variants

| Business Type | Button Text | Notes |
|--------------|-------------|-------|
| Restaurant | "Reserve a table" | Most common |
| Restaurant | "Find a table" | OpenTable-powered |
| Salon/Spa | "Book online" | Links to provider |
| Fitness | "Book an appointment" | Class booking |
| Healthcare | "Schedule" | Appointment scheduling |

## Google-Native Booking Widget

When booking stays within Google Maps:

- Date picker: Usually a calendar grid with selectable dates
- Time slots: Buttons showing available times (e.g., "7:00 PM", "7:30 PM")
- Party size: Dropdown or number input (restaurants)
- Form fields: Name, phone, email in standard form layout
- Confirm button: "Book now", "Reserve", or "Confirm"

## iframe Detection

The booking widget often loads inside an iframe. Indicators:
- Snapshot shows an `iframe` element
- The booking form elements are NOT in the main snapshot
- URL remains on google.com/maps but form is from a provider

To enter the iframe, use its CSS selector (id, name, or positional):
```bash
agent-browser frame "#booking-iframe"
agent-browser snapshot -i
```

To return to main page:
```bash
agent-browser frame main
```

## Date Navigation

Calendar widgets vary but common patterns:
- Left/right arrows to navigate months
- Day numbers as clickable buttons
- "Today" or current date highlighted
- Unavailable dates grayed out or non-interactive

Strategy:
1. Snapshot the calendar
2. If target month is visible, click the date directly
3. If not, click next/prev month arrow, snapshot again, repeat

## Time Slot Selection

- Slots shown as buttons with times
- Available slots are interactive (clickable)
- Unavailable slots are disabled/grayed
- Some show estimated wait time

## Post-Booking Confirmation

Confirmation page typically shows:
- "Confirmed" or "Reservation confirmed" heading
- Confirmation number/reference
- Booking details (date, time, party size)
- Restaurant name and address
- Option to add to calendar
- Cancellation/modification links
