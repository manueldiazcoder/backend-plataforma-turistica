# Working Agreements — Calima Explorer

> **Purpose:** This document establishes the team's shared rules, conventions, and expectations for how we collaborate, communicate, and deliver value on the Calima Explorer project. It is a living agreement created by the team, for the team.
>
> **Governance:** These agreements are reviewed and refined during every Sprint Retrospective.

---

## 1. Team Identity & Roles

| Role | Responsibility |
|------|---------------|
| **Product Owner (PO)** | Owns the Product Backlog, defines priorities, writes Acceptance Criteria, and validates completed work |
| **Scrum Master (SM)** | Facilitates ceremonies, removes impediments, coaches the team on Scrum practices, and enforces these agreements |
| **Developers** | Design, build, test, and deliver the Increment. Collectively own quality and technical decisions |

> All roles collaborate as **one Scrum Team**. Silos between "dev" and "QA" or "design" do not exist — quality is everyone's responsibility.

---

## 2. Sprint Cadence & Ceremonies

### 2.1 Sprint Duration

- **Sprint length:** 2 weeks (10 business days)
- **Sprint start:** Monday
- **Sprint end:** Friday (Sprint Review + Retrospective)

### 2.2 Ceremony Timeboxes

| Ceremony | Duration | Frequency | Attendees | Purpose |
|----------|----------|-----------|-----------|---------|
| **Sprint Planning** | Max 2 hours | Every Sprint (Day 1) | Full Scrum Team | Select Sprint Goal and commit to Sprint Backlog |
| **Daily Standup** | Max 15 minutes | Every business day | Full Scrum Team | Sync on progress, surface blockers, align on daily plan |
| **Backlog Refinement** | Max 1 hour | Mid-Sprint (Day 4–6) | Full Scrum Team | Clarify, estimate, and prepare upcoming stories |
| **Sprint Review** | Max 1 hour | Sprint end (Friday) | Scrum Team + Stakeholders | Demo the Increment, gather feedback |
| **Sprint Retrospective** | Max 1 hour | Sprint end (after Review) | Full Scrum Team | Inspect process, adapt, and update Working Agreements |

### 2.3 Ceremony Rules

- **Standup format:** Each member answers three questions:
  1. What did I accomplish since the last standup?
  2. What will I work on today?
  3. What is blocking me or needs help?
- **No problem-solving in standup:** Technical discussions are taken offline ("parking lot") with only the relevant people.
- **Ceremonies start on time:** Respect everyone's calendar. If key participants are missing, start without them.
- **Cameras on for remote sessions** (when applicable): Encourages engagement and non-verbal communication.

---

## 3. Sprint Goal Standard

### 3.1 Outcome-Oriented, Not Output-Oriented

Every Sprint **must** have a Sprint Goal that describes a **measurable outcome**, not a list of tasks.

| ❌ Bad (Output-Oriented) | ✅ Good (Outcome-Oriented) |
|--------------------------|---------------------------|
| "Complete 10 Jira tickets" | "Users can successfully search and filter exploration data" |
| "Finish the API endpoints" | "Field researchers can submit survey data from offline mode" |
| "Write unit tests for module X" | "The data import pipeline is reliable and handles malformed files gracefully" |

### 3.2 Sprint Goal Rules

- Defined during **Sprint Planning** by the full Scrum Team
- Written as a single, clear sentence
- Used as the **north star** for daily decisions: *"Does this work help us achieve the Sprint Goal?"*
- Evaluated during the **Sprint Review**: Was the goal achieved?

---

## 4. Work In Progress (WIP) Limits

To maintain flow and prevent context-switching, the following WIP limits apply to the team's Kanban board (within the Sprint):

| Board Column | WIP Limit | Rationale |
|-------------|-----------|-----------|
| **In Progress** | **3 items per developer** (max **N × 3** for N developers) | Prevents multitasking and ensures focus |
| **In Review** (PR open) | **2 items** | Ensures reviews happen quickly and don't bottleneck |
| **In QA / Testing** | **2 items** | Prevents a testing backlog from building up |

### 4.1 WIP Limit Rules

- **Stop starting, start finishing:** Before pulling a new item, check if you can help finish something already In Progress.
- **If a WIP limit is hit:** The team swarms on existing items before pulling new work.
- **Violations are discussed** in the Retrospective to identify root causes (e.g., blocked items, unclear requirements).

---

## 5. Spikes Protocol

### 5.1 What Is a Spike?

A Spike is a **timeboxed research or investigation task** used when the team lacks the knowledge to estimate or define a User Story. Spikes produce **knowledge**, not production code.

### 5.2 Spike Rules

| Rule | Detail |
|------|--------|
| **Timebox** | Maximum **1 day** (8 hours) per Spike. If more time is needed, split into multiple Spikes or create a separate story |
| **Output** | A documented finding: decision record, prototype link, architecture diagram, or recommendation — **not** production-ready code |
| **Estimation** | Spikes are estimated in **hours**, not Story Points |
| **Acceptance Criteria** | Must define what knowledge will be produced (e.g., "Evaluate 3 charting libraries and recommend one with pros/cons") |
| **Follow-up** | Every Spike must result in at least one actionable User Story or technical task added to the Product Backlog |

### 5.3 When to Use a Spike

- Evaluating a new technology, library, or framework
- Investigating a complex bug with unknown root cause
- Exploring architectural options before committing to a design
- Understanding an external API or data source

---

## 6. Communication & Collaboration

### 6.1 Daily Communication

| Channel | Purpose |
|---------|---------|
| **Daily Standup** | Synchronous sync on progress and blockers |
| **Team chat (Slack/Teams)** | Async questions, quick discussions, links, and updates |
| **Jira comments** | All technical decisions, findings, and status updates related to a specific ticket |

### 6.2 Communication Norms

- **Response time expectation:** Team members should respond to direct messages within **4 business hours**.
- **Blockers are raised immediately:** Do not wait for the next standup to report a blocker. Post in the team chat and tag the Scrum Master.
- **Assume positive intent:** All feedback (code reviews, design critiques) is about the work, not the person.
- **Document decisions:** When a technical decision is made in a conversation, document it in the relevant Jira ticket or an Architecture Decision Record (ADR).

### 6.3 Pair Programming & Mob Programming

- **Encouraged** for complex stories, onboarding new members, or knowledge transfer.
- Not mandatory, but the team should aim for at least **one pair programming session per Sprint**.

---

## 7. Code Review Standards

| Rule | Detail |
|------|--------|
| **Review within 4 hours** | PRs should be reviewed within 4 business hours of being opened |
| **Small PRs** | Aim for PRs under **400 lines of code**. Larger PRs must be split |
| **Constructive feedback** | Use questions and suggestions, not commands. Explain the "why" behind feedback |
| **Approve or request changes** | Every review must end with a clear decision — no "looks good" without actual review |
| **Author responsiveness** | The PR author should address review comments within the same business day |

---

## 8. Branching & Version Control

| Convention | Detail |
|------------|--------|
| **Branch naming** | `feature/JIRA-123-short-description`, `bugfix/JIRA-456-fix-issue`, `spike/JIRA-789-research-topic` |
| **Commit messages** | Follow [Conventional Commits](https://www.conventionalcommits.org/): `type(scope): description` (e.g., `feat(explorer): add CSV export button`) |
| **Squash & merge** | PRs are squash-merged to keep the main branch history clean |
| **Main branch protection** | Direct pushes to `main`/`master` are blocked. All changes go through PRs |

---

## 9. Definition of Ready & Done Enforcement

- The **Scrum Master** is the guardian of the DoR and DoD. They have the authority to reject items that do not meet the criteria.
- During **Sprint Planning**, any team member can challenge an item's readiness. If the challenge is valid, the item is returned to the backlog.
- During the **Sprint Review**, any item that does not meet the DoD is not demoed and is returned to the backlog.

---

## 10. Continuous Improvement

- **Retrospective actions** are tracked as Jira tickets and prioritized in the next Sprint.
- **Working Agreements are living documents.** Any team member can propose changes at any time. Changes are discussed and agreed upon during the Retrospective.
- **Blameless culture:** When something goes wrong, we ask *"What in our process allowed this to happen?"* not *"Who made the mistake?"*

---

## 11. Glossary

| Term | Definition |
|------|-----------|
| **DoR** | Definition of Ready — criteria an item must meet before entering a Sprint |
| **DoD** | Definition of Done — criteria an item must meet to be considered complete |
| **Spike** | Timeboxed research task that produces knowledge, not code |
| **WIP** | Work In Progress — items actively being worked on |
| **AC** | Acceptance Criteria — conditions that define when a specific story is complete |
| **SP** | Story Points — relative estimation unit using Fibonacci sequence (1, 2, 3, 5, 8, 13) |
| **ADR** | Architecture Decision Record — document capturing an important architectural decision |
| **PR** | Pull Request — mechanism for proposing and reviewing code changes |
| **Increment** | The sum of all completed Product Backlog items at the end of a Sprint |

---

## 12. Revision History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2026-04-03 | Calima Explorer Team | Initial creation |

---

> **Team commitment:** By working on Calima Explorer, every team member agrees to uphold these Working Agreements. They are our social contract for building great software together.
