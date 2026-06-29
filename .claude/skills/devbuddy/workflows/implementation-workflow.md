# Implementation Workflow

1. Confirm the approved plan.
2. Make the smallest scoped change.
3. Follow existing project patterns.
4. Add or update focused tests based on risk.
5. Avoid unrelated refactors and formatting churn.
6. After code changes, name the targeted unit, integration, or UI automation checks that cover the changed behavior and ask whether to run them when test execution was not already approved.
7. When tests are run, capture the command, result, key failure lines, and artifact paths. Use `templates/qa-test-summary-template.md` under `reports/qa/` when a durable QA summary is useful.
8. Summarize changes and verification.
