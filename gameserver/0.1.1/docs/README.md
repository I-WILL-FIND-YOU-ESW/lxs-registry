# gameserver

Realtime multiplayer game server for **Chronic Battle** — a self-contained
Colyseus WebSocket server compiled to a single binary (Node via Bun-compile).
One bounded capability: authoritative game rooms, PvP battle sync, and
player/world persistence in MongoDB.

## What it does

- Hosts authoritative Colyseus rooms:
  - `cb_battle` — 1v1 hero-vs-disease battles.
  - `room_scene` — shared world scene, keyed by owner, with persisted objects.
- Verifies bearer JWTs (HS512) minted by the estate's identity provider.
- Persists players and world state in MongoDB.

## Contract

| Field | Value |
|---|---|
| Port env | `SERVER_PORT` (also accepts `PORT`) |
| Database | MongoDB (`MONGODB_URI`) |
| Runtime | self-contained-static binary (no Node runtime on the host) |

Environment:

- `SERVER_PORT` (required) — listen port assigned by the estate.
- `MONGODB_URI` (required) — managed by the estate.
- `JWT_SECRET` (optional) — shared estate secret; enables authenticated players.
- `CORS_ALLOWED_ORIGINS` (optional) — comma-separated allowed browser origins
  for WebSocket upgrades. Rewritten to the estate's public origin in production.

## HTTP surface

- `GET /health` → `{"ok":true,"service":"rwid-gameserver"}`
- `GET /cb-battles` → JSON array of live battle summaries
- `WS /` → Colyseus transport (room join/create)

See `docs/api.md` for the wire protocol and `docs/changelog.md` for releases.
