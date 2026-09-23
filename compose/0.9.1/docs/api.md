# compose — API

A static tool page plus its assets. No data endpoints, no auth, no database.

| Method | Path | Response |
|---|---|---|
| GET | `/compose` | The composer page (`text/html`) |
| GET | `/compose/` | Same as `/compose` |
| GET | `/compose-app/static/composer.css` | Stylesheet (`text/css`) |
| GET | `/compose-app/static/composer.js` | Composer client (`text/javascript`) |
| GET | `/compose-app/static/wizard.js` | Wizard client (`text/javascript`) |

For running the binary standalone in local development, the same assets are
also served at `/`, `/static/composer.css`, `/static/composer.js` and
`/static/wizard.js`.

## Registry reads

The client fetches **`/api/lxs`** relative to the page origin. In an estate the
gateway routes that to the registry LXS. The composer does not talk to the
registry directly and holds no registry credentials.

## Environment

| Var | Required | Meaning |
|---|---|---|
| `SERVER_PORT` | yes | Port to listen on (default `4202`) |

## Query parameters

| Param | Meaning |
|---|---|
| `embed` | `1` (or any value other than `0`) hides the composer's own top bar |
| `hero` | `0` skips the warm intro and opens the builder directly (e.g. a narrow side panel) |

## Wizard

`wizard.js` is the warm, non-technical front door: it says anyone can build
software now, asks the visitor's profession from a fixed set
(`accountant`, `doctor`, `teacher`, `cafe`, `designer`), shows the app that
work could become as toggleable capabilities, then reveals the builder with a
contextual title and a pre-filled selection. It drives the composer through
`window.ecoCompose` (`setSelection`, `setWay`, `selected`) rather than owning
any composition state itself.

A host that bridges a real estate (see the `eco-compose:load` postMessage)
lands straight in the builder: the wizard steps aside. This is also what
`&hero=0` does.
