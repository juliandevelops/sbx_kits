## Forge SSH authentication

Host keys for `github.com` and `codeberg.org` are pre-populated in
`~/.ssh/known_hosts`, so SSH operations against both forges (clone, fetch,
pull, push) work without interactive host verification prompts. The host
SSH agent is forwarded; authenticate as the `git` user. Push branches you
want to keep; the sandbox clone is lost when the sandbox is removed.
