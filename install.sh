#!/usr/bin/env bash

set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source_dir="${repo_dir}/plugins/session-tools/skills/resume-or-stop"
claude_config_dir="${CLAUDE_CONFIG_DIR:-${HOME}/.claude}"
target_dir="${claude_config_dir}/skills/resume-or-stop"

if [[ ! -f "${source_dir}/SKILL.md" ]]; then
  printf 'Could not find the resume-or-stop skill at %s\n' "${source_dir}" >&2
  exit 1
fi

if [[ -L "${target_dir}" ]]; then
  if [[ "$(readlink "${target_dir}")" == "${source_dir}" ]]; then
    printf '/resume-or-stop is already installed.\n'
    exit 0
  fi

  printf 'A different skill link already exists at %s\n' "${target_dir}" >&2
  printf 'Nothing was changed. Review that link before replacing it.\n' >&2
  exit 1
fi

if [[ -e "${target_dir}" ]]; then
  printf 'A skill already exists at %s\n' "${target_dir}" >&2
  printf 'Nothing was changed. Review that skill before replacing it.\n' >&2
  exit 1
fi

mkdir -p "$(dirname "${target_dir}")"
ln -s "${source_dir}" "${target_dir}"

printf 'Installed /resume-or-stop\n'
printf 'Skill: %s -> %s\n' "${target_dir}" "${source_dir}"
printf 'Start a new Claude Code session if the command does not appear immediately.\n'
