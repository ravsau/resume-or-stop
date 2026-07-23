# Resume or Stop

Several Claude Code sessions are open. Which ones are actually done?

`resume-or-stop` checks the current session's goal, completed work, validation,
active processes, safety, and handoff state. It returns one verdict:

- `STOP`: close the session
- `RESUME`: keep working in this session
- `HANDOFF`: close now and resume when a specific external gate clears

It judges the current session only. It does not turn the question into another
backlog or priority review.

## Install `/resume-or-stop`

For the short command across all your projects:

```bash
git clone https://github.com/ravsau/resume-or-stop.git
cd resume-or-stop
./install.sh
```

Then use:

```text
/resume-or-stop
```

The installer links the skill into your personal `~/.claude/skills/` directory
without overwriting an existing skill. Start a new Claude Code session if the
command does not appear immediately.

## Install from the plugin marketplace

This repository follows Anthropic's current plugin and Agent Skills format.
Inside Claude Code, run:

```text
/plugin marketplace add ravsau/resume-or-stop
/plugin install session-tools@saurav-claude-tools
/reload-plugins
```

Then use:

```text
/session-tools:resume-or-stop
```

Anthropic requires plugin skills to use a `plugin-name:skill-name` namespace.
The personal installer above is the supported path for the bare command.

## What it checks

1. Was the original request completed?
2. Was the work verified?
3. Is the current state safe to leave?
4. Does remaining work have an owner?
5. Is anything genuinely urgent enough to keep this session open?

## Develop and validate

```bash
claude plugin validate .
claude plugin validate ./plugins/session-tools
claude --plugin-dir ./plugins/session-tools
```

The plugin uses `skills/<name>/SKILL.md`, which Anthropic recommends for new
shareable workflows. The older `commands/` format still works, but new commands
and skills now use the same underlying mechanism.

Official references:

- [Create Claude Code plugins](https://code.claude.com/docs/en/plugins)
- [Extend Claude with skills](https://code.claude.com/docs/en/slash-commands)
- [Distribute plugin marketplaces](https://code.claude.com/docs/en/plugin-marketplaces)

## Contributing

Bug reports, unclear verdicts, documentation improvements, and new calibration
examples are welcome. See [CONTRIBUTING.md](CONTRIBUTING.md) before opening a
pull request.

## License

MIT
