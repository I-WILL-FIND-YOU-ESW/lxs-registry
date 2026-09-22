# Changelog

## 0.1.0

- Initial LXS release: Chronic Battle Colyseus game server packaged as a
  self-contained binary (Node via Bun-compile).
- Rooms: `cb_battle` (PvP) and `room_scene` (persisted world).
- HTTP: `GET /health`, `GET /cb-battles`.
- MongoDB persistence for players and world state.
- NDJSON logging to stdout.
- Contract standardized on eco env conventions: `SERVER_PORT`, `MONGODB_URI`,
  `JWT_SECRET`, `CORS_ALLOWED_ORIGINS`.
