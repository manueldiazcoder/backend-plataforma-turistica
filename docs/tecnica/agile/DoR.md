# Definition of Ready (DoR) — Calima Explorer

> **Purpose:** This document defines the minimum criteria a Product Backlog item must satisfy **before** it can be pulled into a Sprint. Items that do not meet these criteria will be rejected during Sprint Planning.
>
> **Source of Truth:** Scrum.org — *"A Product Backlog item is Ready when it is transparent, clear, and detailed enough for Developers to begin work."*

---

## 1. When Does the DoR Apply?

The DoR is the gatekeeper for **Sprint Planning**. During refinement and planning, the Scrum Team evaluates each candidate item against these criteria. If any criterion is not met, the item is **not ready** and must be refined further before it can enter a Sprint.

---

## 2. DoR Checklist

### 2.1 User Story Format

| # | Criterion | Details |
|---|-----------|---------|
| R-01 | Written in standard **User Story** format | `As a [persona], I want [action], so that [value/benefit]` |
| R-02 | The **persona** is clearly identified and represents a real user or system actor | Not vague terms like "the user" — be specific (e.g., "As a data analyst...", "As an admin...") |
| R-03 | The **value/benefit** is explicit and answers "why are we building this?" | Must connect to a measurable outcome or user need |

**Example of a well-formed User Story:**
```
As a field researcher,
I want to export my survey data as a CSV file,
so that I can analyze it in my preferred spreadsheet tool.
```

### 2.2 Acceptance Criteria (AC)

| # | Criterion | Details |
|---|-----------|---------|
| R-04 | At least **2–3 clear, testable Acceptance Criteria** are defined | Each AC must be a boolean condition (pass/fail) |
| R-05 | ACs follow the **Given/When/Then** format (BDD style) or are equally unambiguous | Example: "Given I am on the export page, When I click 'Download CSV', Then a .csv file is downloaded" |
| R-06 | ACs cover both the **happy path** and at least one **edge case** or error scenario | E.g., empty data set, invalid permissions, network failure |
| R-07 | ACs are **independent** of implementation details | They describe *what*, not *how* |

### 2.3 Estimation & Sizing

| # | Criterion | Details |
|---|-----------|---------|
| R-08 | The item is estimated in **Story Points** using the Fibonacci sequence (1, 2, 3, 5, 8, 13) | Estimation done by the Developers during refinement |
| R-09 | The item is **8 Story Points or less** | If estimated at 13+, the item **must be sliced** into smaller stories before it is considered Ready |
| R-10 | The team has enough confidence in the estimate (not a wild guess) | If uncertainty is high, a **Spike** should be created first (see WorkingAgreements.md) |

### 2.4 Dependencies & Prerequisites

| # | Criterion | Details |
|---|-----------|---------|
| R-11 | All **external dependencies** are identified and resolved | E.g., third-party API access, design assets, data availability |
| R-12 | UX/UI designs, wireframes, or mockups are **attached and finalized** (if applicable) | Links to Figma, Sketch, or design specs included in the ticket |
| R-13 | Required **API contracts** or data schemas are defined (if applicable) | OpenAPI spec, database schema, or interface definition available |
| R-14 | The item does not depend on another **incomplete Sprint item** unless both are in the same Sprint and sequenced | Cross-Sprint dependencies must be escalated to the Product Owner |

### 2.5 INVEST Criteria Validation

| # | Criterion | Details |
|---|-----------|---------|
| R-15 | **I**ndependent — Can be developed and delivered without tight coupling to other stories | Minimal coordination needed |
| R-16 | **N**egotiable — Details are open to discussion, not a rigid contract | Leaves room for technical decisions |
| R-17 | **V**aluable — Delivers clear value to the user or the product | Tied to a business or user outcome |
| R-18 | **E**stimable — The team can size it with reasonable confidence | No major unknowns blocking estimation |
| R-19 | **S**mall — Fits within a single Sprint (≤ 8 SP) | Can be completed within the Sprint timebox |
| R-20 | **T**estable — Has clear Acceptance Criteria that can be verified | Someone other than the author can determine if it's Done |

---

## 3. DoR Quick-Reference Card

Print this or keep it visible during Sprint Planning:

```
┌─────────────────────────────────────────────────┐
│           DEFINITION OF READY CHECKLIST          │
├─────────────────────────────────────────────────┤
│  ☐ User Story format (persona + action + value) │
│  ☐ 2-3+ Acceptance Criteria (testable, boolean) │
│  ☐ Estimated in Story Points (≤ 8 SP)           │
│  ☐ Dependencies identified & resolved           │
│  ☐ UX/UI designs attached (if applicable)       │
│  ☐ API contracts defined (if applicable)        │
│  ☐ Meets INVEST criteria                        │
│  ☐ No blocking cross-Sprint dependencies        │
├─────────────────────────────────────────────────┤
│  If ANY box is unchecked → NOT READY            │
│  Return to Product Backlog for refinement        │
└─────────────────────────────────────────────────┘
```

---

## 4. What Happens When an Item Is Not Ready?

1. **During Refinement:** The Scrum Master flags the missing criteria. The Product Owner and team collaborate to fill the gaps before the next refinement session.
2. **During Sprint Planning:** The item is **rejected** and returned to the Product Backlog. The team selects the next highest-priority Ready item.
3. **If a Spike is needed:** When the team cannot estimate or define ACs due to unknowns, a **Spike** is created (timeboxed research task — see WorkingAgreements.md).

---

## 5. DoR vs. Acceptance Criteria vs. DoD

| Aspect | Definition of Ready (DoR) | Acceptance Criteria (AC) | Definition of Done (DoD) |
|--------|--------------------------|------------------------|------------------------|
| **When** | Before Sprint Planning | During story writing | After development, before "Done" |
| **Answers** | "Can we start working on this?" | "What does 'done' look like for this story?" | "Is this increment truly complete?" |
| **Scope** | All candidate items | Individual stories | All items universally |
| **Owner** | Scrum Team (jointly) | Product Owner | Scrum Team (jointly) |

---

## 6. Revision History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2026-04-03 | Calima Explorer Team | Initial creation |

---

> **Rule of thumb:** If the team cannot confidently answer *"What are we building, why, and how will we know it's done?"* — the item is not Ready.
