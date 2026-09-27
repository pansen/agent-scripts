# Pansen Agent Scripts

[`nono`](https://github.com/nolabs-ai/nono) wrapper scripts for popular agents.

## Versioning

Releases use calendar versions in UTC: `vYYYY.MM.DD.HHMM` (e.g. `v2026.09.27.1405`).
Every push to `main` that changes `bin/`, `libexec/` or `packaging/` creates a new tag and updates the formula in [`pansen/homebrew-tap`](https://github.com/pansen/homebrew-tap).
To re-publish an existing tag, run the Release workflow manually and pass the tag.
