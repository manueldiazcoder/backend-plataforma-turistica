# Definition of Done (DoD) — Calima Explorer

> **Purpose:** This document defines the shared agreement that states the exact conditions a Product Backlog item must meet to be considered complete. It applies to all development work on the Calima Explorer project.
>
> **Source of Truth:** Scrum.org — *"The Definition of Done is a formal description of the state of the Increment when it meets the quality measures required for the product."*

---

## 1. When Does the DoD Apply?

The DoD applies to **every** Product Backlog item — User Stories, bug fixes, technical tasks, and Spikes — that the team commits to delivering within a Sprint. If an item does not satisfy every criterion below, it is **not Done** and must return to the Product Backlog.

---

## 2. DoD Checklist

Each criterion is a **boolean gate**: either it is fully satisfied, or the item is not Done.

### 2.1 Code Quality

| # | Criterion | Verification Method |
|---|-----------|-------------------|
| D-01 | All new and modified code follows the project's coding standards and style guide | Linter / formatter passes with zero errors |
| D-02 | Code has been reviewed via Pull Request (PR) with at least **one** approving review from a peer | PR approved in version control (GitHub/GitLab/Bitbucket) |
| D-03 | No critical or blocker-level static analysis issues remain | SonarQube / equivalent scan passes quality gate |
| D-04 | Code is committed to the main development branch with a meaningful, conventional commit message | Git history review |
| D-05 | No `TODO`, `FIXME`, or `HACK` comments remain without an associated tracking issue | Code search / grep |

### 2.2 Testing

| # | Criterion | Verification Method |
|---|-----------|-------------------|
| D-06 | Unit tests are written for all new logic with a minimum **80% branch coverage** on changed files | Coverage report (e.g., Istanbul, Coverage.py, JaCoCo) |
| D-07 | All existing unit tests pass without failures or regressions | CI pipeline — test stage green |
| D-08 | Integration tests covering external dependencies (APIs, databases, file systems) pass | CI pipeline — integration test stage green |
| D-09 | For UI-related changes, end-to-end (E2E) tests are written and passing for critical user flows | E2E test suite (e.g., Playwright, Cypress) green |
| D-10 | Security scans (SAST/DAST) pass with no high or critical vulnerabilities | Security tooling in CI pipeline |

### 2.3 CI/CD & Deployment

| # | Criterion | Verification Method |
|---|-----------|-------------------|
| D-11 | The CI/CD pipeline completes successfully with all stages passing (build, test, lint, security) | Pipeline status: green |
| D-12 | The feature is deployed to a **staging/QA environment** and is smoke-testable | Environment URL accessible; smoke test passes |
| D-13 | No build warnings are introduced by the change (or they are explicitly documented and accepted) | Build log review |
| D-14 | Database migrations (if any) are reversible and have been tested in staging | Migration rollback test passes |

### 2.4 Documentation

| # | Criterion | Verification Method |
|---|-----------|-------------------|
| D-15 | Technical documentation is updated (README, architecture diagrams, ADRs) | Docs diff reviewed in PR |
| D-16 | API documentation (e.g., OpenAPI/Swagger) is updated if endpoints changed | Swagger UI reflects new/changed endpoints |
| D-17 | User-facing documentation or release notes are drafted for features visible to end users | Confluence / wiki / changelog updated |
| D-18 | Inline code documentation (docstrings, JSDoc, etc.) is present for public functions and classes | Code review |

### 2.5 Product Validation & Sign-off

| # | Criterion | Verification Method |
|---|-----------|-------------------|
| D-19 | All Acceptance Criteria defined in the User Story are verified and met | PO or delegate confirms each AC |
| D-20 | The Product Owner (or designated delegate) has reviewed and accepted the increment | Jira status moved to "Done" by PO |
| D-21 | The feature is demo-ready for the Sprint Review | Demonstrable in staging environment |

### 2.6 Performance & Accessibility (When Applicable)

| # | Criterion | Verification Method |
|---|-----------|-------------------|
| D-22 | Page/component load time does not regress beyond defined thresholds (e.g., < 3s on 3G) | Lighthouse / WebPageTest report |
| D-23 | Accessibility (a11y) checks pass — minimum WCAG 2.1 AA compliance for user-facing features | axe-core / Lighthouse a11y audit |

---

## 3. DoD by Work Type

Not every criterion applies equally to every type of work. The table below maps applicability:

| Criterion | User Story | Bug Fix | Technical Debt | Spike |
|-----------|:----------:|:-------:|:--------------:|:-----:|
| D-01 – D-05 (Code Quality) | ✅ | ✅ | ✅ | N/A |
| D-06 – D-10 (Testing) | ✅ | ✅ | ✅ | N/A |
| D-11 – D-14 (CI/CD) | ✅ | ✅ | ✅ | N/A |
| D-15 – D-18 (Documentation) | ✅ | ⚠️ If needed | ✅ | ✅ (research notes) |
| D-19 – D-21 (Validation) | ✅ | ✅ | ✅ | ✅ (findings reviewed) |
| D-22 – D-23 (Performance/a11y) | ⚠️ If applicable | ⚠️ If applicable | ⚠️ If applicable | N/A |

> ✅ = Required &nbsp;&nbsp; ⚠️ = Apply if relevant to the change &nbsp;&nbsp; N/A = Not applicable

---

## 4. Exceptions & Technical Debt

- **No exceptions without tracking:** If a criterion cannot be met due to a legitimate constraint, a **technical debt ticket** must be created in the Product Backlog, linked to the original item, and prioritized by the Product Owner.
- **Accumulated debt is visible:** The team reviews open technical debt tickets during every Sprint Retrospective.
- **DoD evolves:** The team revisits and refines this DoD during Retrospectives as the project matures.

---

## 5. DoD vs. Acceptance Criteria

| Aspect | Definition of Done (DoD) | Acceptance Criteria (AC) |
|--------|------------------------|------------------------|
| **Scope** | Applies to **all** items universally | Specific to **each** User Story |
| **Purpose** | Ensures quality standards across the board | Defines what "done" means for a specific feature |
| **Ownership** | Owned by the **entire Scrum Team** | Defined by the **Product Owner** with team input |
| **Example** | "All tests pass, code reviewed, deployed to staging" | "User can filter results by date range and export to CSV" |

---

## 6. Revision History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2026-04-03 | Calima Explorer Team | Initial creation |

---

> **Remember:** *"Done" means Done.* If it is not Done according to this definition, it is not part of the Increment and cannot be presented at the Sprint Review.
