# 3rd-Party Booking Provider Flows

When Google Maps redirects to an external provider, detect by checking the URL after clicking the booking button.

## OpenTable

**Detection**: URL contains `opentable.com`

### Flow
1. Page loads with date/time/party-size picker at top
2. Snapshot → find date field, time dropdown, party size dropdown
3. Fill date, select time, select party size
4. Click "Find a table" or "Let's go"
5. Wait for available time slots to load
6. Snapshot → select a time slot button
7. Page transitions to booking form
8. Fill: first name, last name, phone, email
9. Optional: special requests, occasion dropdown
10. Click "Complete reservation"
11. Confirmation page shows with confirmation number

### Key Elements
- Party size dropdown: "2 people", "3 people", etc.
- Time selector: Dropdown with 15/30-min intervals
- Available slots: Buttons showing exact times
- "Complete reservation" is the final submit button
- May show "Points" for OpenTable rewards members

### Notes
- OpenTable may prompt to sign in — skip if possible, use guest checkout
- Some restaurants require credit card for large parties — inform user

---

## Resy

**Detection**: URL contains `resy.com`

### Flow
1. Page shows restaurant with available reservation slots
2. Snapshot → find date selector and time slot buttons
3. Select date (calendar navigation)
4. Available times shown as buttons with seating type labels
5. Click desired time slot
6. Booking modal opens
7. If not logged in: shows sign-up/login form
8. Fill: first name, last name, email, phone (or login)
9. Optional: special occasion, dietary restrictions, notes
10. Click "Reserve" or "Confirm"
11. Confirmation shown

### Key Elements
- Time slots labeled with seating type (e.g., "Dining Room", "Bar", "Patio")
- Slots have visual indicators for availability
- "Reserve Now" or "Confirm" for final submission
- May require Resy account — inform user if login needed

### Notes
- Resy sometimes requires account creation — if so, inform user
- Some restaurants are "Notify" only (no instant booking) — detect and inform user

---

## Vagaro

**Detection**: URL contains `vagaro.com`

### Flow
1. Page shows business with service categories
2. Snapshot → select service category (e.g., "Haircut", "Massage")
3. Select specific service from list
4. Select staff member (or "Any available")
5. Calendar shows available dates
6. Select date → available times appear
7. Select time
8. Booking form: first name, last name, email, phone
9. May require account creation
10. Click "Book" or "Confirm Appointment"
11. Confirmation shown

### Key Elements
- Multi-step wizard: Service → Staff → Date/Time → Info → Confirm
- Each step may require a snapshot and interaction
- "Book Now" or "Confirm Appointment" for final submit

### Notes
- Vagaro is common for salons, spas, and fitness
- Service selection is a required extra step vs restaurant flows
- Duration shown per service

---

## Yelp Reservations

**Detection**: URL contains `yelp.com/reservations`

### Flow
1. Similar to OpenTable — date, time, party size picker
2. Select date and time
3. Click "Find a Table"
4. Available slots shown
5. Select a slot
6. Fill: name, phone, email
7. Optional: special requests
8. Click "Confirm Reservation"
9. Confirmation shown

### Key Elements
- Very similar to OpenTable in structure
- May prompt Yelp login — use guest if available
- "Confirm Reservation" for final submit

---

## Toast (ToastTab)

**Detection**: URL contains `toasttab.com`

### Flow
1. Page may show "Join Waitlist" or "Make a Reservation"
2. If waitlist: enter name, party size, phone → join
3. If reservation: select date, time, party size
4. Fill contact info
5. Confirm

### Key Elements
- Two modes: Waitlist vs Reservation
- Waitlist: simpler flow, no date/time selection needed
- "Join Waitlist" or "Reserve" buttons

### Notes
- Toast is primarily used for casual dining and fast-casual
- Waitlist mode is more common than reservations

---

## Generic 3rd-Party Provider

For any unrecognized booking provider:

1. Snapshot the page after redirect
2. Identify form elements dynamically from the snapshot
3. Look for date/time pickers, name/phone/email fields
4. Fill in order: date → time → party info → personal info
5. Look for confirmation/submit button
6. Snapshot before submitting to verify
7. Submit and capture confirmation

**Always**: snapshot → identify → fill → verify → submit
