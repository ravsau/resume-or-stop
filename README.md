# Resume or Stop

I keep several Claude Code sessions open, sometimes more than one for the same
project. Eventually I cannot scroll back far enough to remember what happened or
whether anything is still unfinished.

`/resume-or-stop` asks the current session to look back through its own
conversation, surface any loose threads, and give one answer:

- `STOP`: it is safe to close, with any later follow-ups listed
- `RESUME`: something here is still worth continuing now

That is it. It does not scan your backlog, inspect your other sessions, or invent
more work.

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
