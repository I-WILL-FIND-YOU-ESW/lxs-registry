# compose — LXS

The **estate composer**: a tool page that turns a selection of reusable
capabilities into an `ecompose.yml`.

A visitor (or a developer maintaining an estate) picks LXS from the live
registry, watches the estate assemble, and gets back the exact manifest plus
the `eco` commands to run it. No account is needed to compose; an account is
only required to host the estate.

## Compose it

```yaml
# ecompose.yml
services:
  compose:
    lxs: compose@0.1.0
    access:
      routes:
        - { path: /compose-app, level: public }
        - { path: /compose-app/*, level: public }
```

The composer reads the registry through the **host estate's** same-origin
`/api/lxs`, so the estate must also compose the registry LXS and route
`/api/lxs` to it (the getecosphere estate does). Nothing else is required.

## Embedding

Add `?embed=1` to drop the composer's own top bar — for hosts that supply
their own chrome, such as the Ecosphere Assistant side panel.

## Estate bridge

When framed by a host that can reach the user's machine (the Ecosphere
Assistant side panel), the composer receives the estate's `ecompose.yml`,
shows its current capabilities, and applies add/remove through `eco` — so the
estate is maintained by the CLI, never by the UI writing YAML. The host
protocol is `postMessage` (`eco-compose:ready|load|add|remove|run|log|done`).

## Docs index

- `api.md` — endpoints and asset paths
- `changelog.md` — version history
- `gotchas.md` — composition constraints
- `examples.sh` — executable smoke test
