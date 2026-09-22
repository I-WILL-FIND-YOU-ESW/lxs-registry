# compose — gotchas

- **It needs a registry to read.** The page fetches same-origin `/api/lxs`. If
  the estate does not compose the registry LXS and route `/api/lxs`, the
  palette shows "the live registry is unavailable" and only the starter presets
  and manifest remain usable.
- **The manifest it prints is a starting point.** It is a valid `ecompose.yml`
  skeleton (project, estate, gateway + app, one service per selected LXS). It
  does not know your domain core's ports, grants or access routes — edit those,
  or use `eco lxs add`, which merges the LXS's own `compose:` recipe.
- **Assets live under `/compose/*`.** Declare both `/compose` and `/compose/*`
  as public routes, or the stylesheet and client 404 and the page renders
  unstyled with no registry data.
- **No secrets, no state.** The page is static and per-visitor; the selection is
  kept in the browser's `localStorage` only.
