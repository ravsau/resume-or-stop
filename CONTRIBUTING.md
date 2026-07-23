# Contributing

Thanks for helping improve `resume-or-stop`.

## Useful contributions

- Report a session where the verdict was wrong or unclear.
- Add examples for STOP or RESUME.
- Improve installation and usage documentation.
- Help the skill catch useful loose threads without inventing more work.

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

- Review only the current conversation.
- Surface unfinished work and ideas worth following up.
- Return exactly one verdict: STOP or RESUME.
- Let STOP include follow-ups that can wait.
- Use RESUME only when continuing here would preserve useful context.
- Do not scan other sessions or turn this into backlog management.

## Pull request checklist

- Explain the session scenario your change handles.
- Update the README if installation or public behavior changes.
- Run both strict validation commands.
- Test the affected verdict with a realistic session.
- Confirm that no private transcript, secret, or proprietary code is included.

By contributing, you agree that your contribution will be licensed under the
repository's MIT License.
