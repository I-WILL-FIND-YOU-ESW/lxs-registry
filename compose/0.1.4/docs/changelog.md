# compose — changelog

## 0.1.4

- Fix: the extracted stylesheet still hid the page title under `?embed=1`, so
  `hero=0` had no effect. `embed` now hides only the composer's bar.

## 0.1.3

- Split the embed flags: `?embed=1` hides only the composer's own bar (the host
  supplies chrome), while `&hero=0` additionally hides the page title/lede.
  An estate wrapping the tool can therefore keep the title.

## 0.1.2

- Serve the composer at `/compose-app` instead of `/compose`, so an estate can
  keep `/compose` as its own page and wrap the tool in the estate's real
  header/footer (the LXS stays the single implementation of the composer).

## 0.1.1

- Style the composer's own top bar and hide it under `?embed=1` (the first
  release shipped it unstyled and visible in embedded hosts).

## 0.1.0

- First release. Composer page extracted from the getecosphere estate so it can
  be composed anywhere (and framed by the Ecosphere Assistant side panel).
- Live LXS registry palette (via the host estate's `/api/lxs`), estate canvas
  with docked capability nodes and rays into the application core, live
  `ecompose.yml` + `eco lxs add` / `eco up dev` output with copy buttons, and
  starter-estate presets.
- `?embed=1` to drop the composer's own top bar for embedding hosts.
- Newline-delimited JSON logging on stdout per the LXS logging contract.
