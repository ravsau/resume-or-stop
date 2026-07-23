# Resume or Stop

Several Claude Code sessions are open. Which ones are actually done?

`resume-or-stop` checks the current session's goal, completed work, validation,
active processes, safety, and handoff state. It returns one verdict:

- `STOP`: close the session
- `RESUME`: keep working in this session
- `HANDOFF`: close now and resume when a specific external gate clears

It judges the current session only. It does not turn the question into another
backlog or priority review.

## Install as a Claude Code plugin

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

Plugin skills are namespaced by design. This prevents collisions with other
installed plugins.

## Keep the shorter command

For a personal installation with the exact `/resume-or-stop` name:

```bash
git clone https://github.com/ravsau/resume-or-stop.git ~/resume-or-stop
mkdir -p ~/.claude/skills
ln -s ~/resume-or-stop/plugins/session-tools/skills/resume-or-stop ~/.claude/skills/resume-or-stop
```

Then run:

```text
/resume-or-stop
```

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

## License

MIT
