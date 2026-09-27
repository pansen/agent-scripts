# nono-sandbox.bash — sandbox grants shared by the nono agent wrappers.
#
# Not executable: source it, then append whatever is specific to the agent.
#
#   source "$bin_dir/../libexec/nono-sandbox.bash"
#   sandbox=(
#     "${nono_sandbox_common[@]}"
#     --profile always-further/foo
#     --allow "$HOME/.foo"
#   )
#
# --allow = read+write, --read = read-only subtree, --read-file = one file.
# Anything agent-specific (nono profile, injected credential, the agent's own
# config dir) belongs in the wrapper, not here.

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  echo "nono-sandbox.bash is a library; source it from a wrapper." >&2
  exit 1
fi

nono_sandbox_common=(
  -s
  --allow-net
  --allow-cwd

  # Tooling caches & data dirs (read+write)
  --allow "$HOME/.cache/uv"
  --allow "$HOME/.local/share/uv"
  --allow "$HOME/.cache/node"
  --allow "$HOME/.cache/yarn"
  --allow "$HOME/.cache/gh"
  --allow "$HOME/.cache/huggingface"
  --allow "$HOME/.cache/pyright-python"
  --allow "$HOME/.yarn"
  --allow "$HOME/.npm"
  --allow "$HOME/.go"
  --allow "$HOME/.cargo/registry"
  --allow "$HOME/.mem0"
  --allow "$HOME/.local/state/mise"
  --allow "$HOME/.local/share/mise"
  --allow "/opt/homebrew/Library/Homebrew/vendor/bundle"

  # App config & state (read+write)
  --allow "$HOME/.ansible"
  --allow "$HOME/Library/Application Support/Zed"
  --allow "$HOME/Library/Application Support/com.apple.container"

  # Read-only
  --read "$HOME/.config/tunmux"
  --read "$HOME/.cargo"
  --read "$HOME/.config/gh"
  --read "$HOME/.config/k3d"
  --read "$HOME/.config/incus"
  --read /usr/local/libexec/container
  --read-file "$HOME/.config/git/ssh-rewrites"
)
