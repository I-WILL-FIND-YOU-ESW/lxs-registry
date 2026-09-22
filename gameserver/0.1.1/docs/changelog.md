# Changelog

## 0.1.1

- Real matchmaking queue: `cb_battle` is defined with `filterBy: ["accepting"]`
  and sets `accepting` metadata, so concurrent players join the same waiting
  room (via `joinOrCreate`) instead of each creating a private room and
  waiting forever. `accepting` is cleared once both seats are filled.

## 0.1.0

- Initial LXS release: Chronic Battle Colyseus game server packaged as a
  self-contained binary (Node via Bun-compile).
- Rooms: `cb_battle` (PvP) and `room_scene` (persisted world).
- HTTP: `GET /health`, `GET /cb-battles`.
- MongoDB persistence for players and world state.
- NDJSON logging to stdout.
- Contract standardized on eco env conventions: `SERVER_PORT`, `MONGODB_URI`,
  `JWT_SECRET`, `CORS_ALLOWED_ORIGINS`.
