# Pansen Agent Scripts

[`nono`](https://github.com/nolabs-ai/nono) wrapper scripts for popular agents.

## Zed Integration

Once installed, Zed can be configured to use these wrappers easily. I made them nono sandboxed versions to have a name _ 🔐 ..._ to be on top of the agent provider list. Claude Code does not require this treatment, cause we can override the binary of the Zed extension via `CLAUDE_CODE_EXECUTABLE`.

```
  "agent_servers": {
    " 🔐 Codex": {
      "default_config_options": {
        "reasoning_effort": "high",
        "mode": "agent-full-access",
      },
      "type": "custom",
      "command": "nono-codex-acp",
      "args": [],
      "env": {
        "RUST_LOG": "info",
        "INITIAL_AGENT_MODE": "agent-full-access",
      },
    },
    "claude-acp": {
      "default_config_options": {
        "mode": "auto",
      },
      "type": "registry",
      "env": {
        // https://code.claude.com/docs/en/env-vars
        "CLAUDE_CODE_EXECUTABLE": "nono-claude",
        "CLAUDE_CODE_SUBPROCESS_ENV_SCRUB": "1",
      },
    },
    "claude-agent-acp": {
      "type": "registry",
      "env": {
        // https://code.claude.com/docs/en/env-vars
        "CLAUDE_CODE_EXECUTABLE": "nono-claude",
        "CLAUDE_CODE_SUBPROCESS_ENV_SCRUB": "1",
      },
    },
    " 🔐 OpenCode-CLI": {
      "default_config_options": {
        "effort": "max",
        "reasoning_effort": "max",
        "model": "opencode-go/qwen3.8-max",
      },
      "favorite_config_option_values": {
        "model": [
          "opencode-go/qwen3.8-max",
          "opencode-go/deepseek-v4-pro",
          "opencode-go/minimax-m3",
          "opencode-go/glm-5.3",
        ],
      },
      "type": "custom",
      "command": "nono-opencode",
      "args": ["acp"],
    },
    " 🔐 Antigravity": {
      "default_config_options": {
        "model": "gemini-3.8-flash-high",
      },
      "type": "custom",
      "command": "nono-agy-acp",
      "args": [],
    },
```

## Versioning

Releases use calendar versions in UTC: `vYYYY.MM.DD.HHMM` (e.g. `v2026.09.27.1405`).
Every push to `main` that changes `bin/`, `libexec/` or `packaging/` creates a new tag and updates the formula in [`pansen/homebrew-tap`](https://github.com/pansen/homebrew-tap).
To re-publish an existing tag, run the Release workflow manually and pass the tag.
