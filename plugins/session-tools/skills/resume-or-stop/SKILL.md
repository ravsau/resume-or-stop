---
name: resume-or-stop
description: Review the current conversation for unfinished or worth-saving loose threads, then say STOP or RESUME. Use when the user asks whether a session is safe to close, whether anything remains worth pursuing or following up, or says "resume or stop", "is this session done?", "safe to close?", or "any loose threads?"
---

# Resume or Stop

Review only the current conversation. The user may have several sessions open,
including multiple sessions for the same project, and may no longer be able to
scroll back far enough to remember what happened.

Answer one question: is this session safe to close, or is there something here
worth continuing now?

## Look for

- What the user came here to do
- What was completed or decided
- Anything promised, started, or asked but not finished
- Useful ideas or planning conclusions worth remembering or following up

Use the conversation and tool results already in this session. Do not scan other
projects, rank a backlog, run `/next`, or inspect other open sessions.

## Choose

Choose `STOP` when the session is safe to close. List any useful follow-up under
`Loose threads` so the user does not lose it.

Choose `RESUME` when meaningful work remains and continuing in this session would
usefully preserve its context.

Do not choose `RESUME` for optional polish, a new tangent, an external reply, or
work that is already recorded elsewhere.

This skill is read-only. Do not edit files or create tasks unless the user asks.

## Reply

```text
VERDICT: STOP | RESUME
Why: one plain sentence
Loose threads:
- None, or the few things worth remembering
Worth doing now:
- Nothing, or one concrete action
```
