# Contributing

Thanks for helping improve `resume-or-stop`.

## Useful contributions

- Report a session where the verdict was wrong or unclear.
- Add calibration examples for STOP, RESUME, or HANDOFF.
- Improve installation and usage documentation.
- Tighten the skill without turning it into a backlog or project-management tool.

For a documentation typo, feel free to open a pull request directly. For a behavior
change, [open an issue](https://github.com/ravsau/resume-or-stop/issues) first and
describe:

1. The state of the session.
2. The verdict you received.
3. The verdict you expected and why.

Remove private transcripts, secrets, customer information, and proprietary code
before sharing an example.

## Local setup

Clone the repository:

```bash
git clone https://github.com/ravsau/resume-or-stop.git
cd resume-or-stop
```

Validate the marketplace and plugin:

```bash
claude plugin validate . --strict
claude plugin validate ./plugins/session-tools --strict
```

Load the local plugin:

```bash
claude --plugin-dir ./plugins/session-tools
```

Then run the namespaced plugin command:

```text
/session-tools:resume-or-stop
```

To test the bare personal command instead:

```bash
CLAUDE_CONFIG_DIR="$(mktemp -d)" ./install.sh
```

## Design rules

Please preserve these behaviors:

- Judge only the current session.
- Return exactly one verdict: STOP, RESUME, or HANDOFF.
- Base the verdict on current-session evidence.
- Use RESUME only when required work can continue now.
- Use HANDOFF when a named external or human gate remains.
- Do not keep a session open for optional polish or unrelated work.

## Pull request checklist

- Explain the session scenario your change handles.
- Update the README if installation or public behavior changes.
- Run both strict validation commands.
- Test the affected verdict with a realistic session.
- Confirm that no private transcript, secret, or proprietary code is included.

By contributing, you agree that your contribution will be licensed under the
repository's MIT License.
