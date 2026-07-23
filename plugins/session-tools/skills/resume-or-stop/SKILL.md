---
name: resume-or-stop
description: Inspect the current work session and issue a STOP, RESUME, or HANDOFF verdict based on whether the requested outcome is complete, verified, safe, and properly handed off. Use when the user asks whether to close a session, keep it open, resume it, whether anything urgent remains, or says "resume or stop", "is this session done?", "safe to close?", or "do we need to keep going?". This is a session-completion gate, not a task-prioritization command.
---

# Resume or Stop

Judge only the current session. Do not scan unrelated projects or turn the
question into a general task-prioritization exercise.

## Inspect

- The original user request and any explicit terminal condition
- Work actually completed in this session
- Tests, validation, and tool results
- Running processes, deployments, agents, or background tasks
- Diffs for files touched in this session, ignoring unrelated pre-existing work
- Whether follow-up work created by this session has a durable owner

## Apply the five gates

1. **Outcome:** Is the original request actually complete?
2. **Verification:** Did proportionate checks pass?
3. **Safety:** Is there no half-applied migration, destructive state, pending
   deployment, or process that still needs monitoring?
4. **Handoff:** Does future work have an exact owner, task, or resume trigger?
5. **Urgency:** Will anything in scope be lost, missed, or cause harm before the
   likely next session?

## Choose one verdict

### STOP

Close this session when the outcome is complete, validation is done, and the
state is safe. Optional polish, new ideas, external work, human-only work, and
already-tracked follow-ups do not justify keeping the session alive.

### RESUME

Keep this session open when required work remains and can be completed safely
now, mandatory validation is missing, the session left unsafe partial state, or
an active process must reach the requested terminal result.

### HANDOFF

Close now and resume on a specific trigger when the remaining gate is a user
action, external reply, missing authority, credential, or work that belongs in
a separate session. Record the exact owner and resume trigger.

## Workflow

1. Restate the current session contract in one sentence.
2. Separate remaining items into required now, later with an owner, human or
   external, and unrelated.
3. Check active processes, agents, background tasks, and touched files.
4. Apply the five gates.
5. Return one decisive verdict. Do not invent work or generate a broad task list.

This skill is read-only by default. Invoking it does not authorize writes.

## Output

```text
VERDICT: STOP | RESUME | HANDOFF
Why: one sentence
Completed:
- up to three bullets
Still open:
- up to three bullets, each with owner/status
Before closing: nothing, or exactly one required action
Resume when: exact trigger, or "not needed"
Resume with: exact task ID, file, one-line prompt, or "not needed"
```

## Guardrails

- Do not rank the user's entire backlog.
- Do not use nice-to-have polish or unrelated dirty files to justify `RESUME`.
- Missing required validation or unsafe partial state does justify `RESUME`.
- Never list more than one action under `Before closing`.
- If open work is already logged and is not urgent, choose `STOP`.
- A user or external gate normally means `HANDOFF`, not an indefinitely open
  session.

## Calibration

- Analysis delivered, logs saved, checks pass, future tasks tracked: `STOP`.
- Code changed but required tests have not run and can run now: `RESUME`.
- An approval or external reply is required and the next task is captured:
  `HANDOFF`.
- A new interesting idea surfaced after the goal was completed: `STOP`.
