# compose — API

A static tool page plus its assets. No data endpoints, no auth, no database.

| Method | Path | Response |
|---|---|---|
| GET | `/compose` | The composer page (`text/html`) |
| GET | `/compose/` | Same as `/compose` |
| GET | `/compose/static/composer.css` | Stylesheet (`text/css`) |
| GET | `/compose/static/composer.js` | Composer client (`text/javascript`) |

For running the binary standalone in local development, the same assets are
also served at `/`, `/static/composer.css` and `/static/composer.js`.

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
