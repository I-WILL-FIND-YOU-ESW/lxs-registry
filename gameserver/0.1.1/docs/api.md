# gameserver API

Base: the estate maps this LXS to its own public WebSocket hostname
(e.g. `wss://ws-chronic.battlerivals.online`).

## HTTP

### `GET /health`

Liveness probe.

```json
{ "ok": true, "service": "rwid-gameserver" }
```

### `GET /cb-battles`

Live battle summaries (no cache).

```json
[
  {
    "roomId": "abc123",
    "status": "waiting|selecting|active|ended",
    "diseaseId": "hypertension|diabetes|cancer",
    "players": { "hero": { "username": "…", "avatarUrl": "…" },
                 "diseases": { "username": "…", "avatarUrl": "…" } },
    "heroHp": 100, "bossHp": 100,
    "heroBaseHp": 100, "diseaseBaseHp": 100,
    "elapsedMs": 0, "spectatorCount": 0, "progress": 0,
    "preview": { "hero": { "x": 0, "y": 0 }, "boss": { "x": 0, "y": 0 } }
  }
]
```

## WebSocket (Colyseus)

Transport is Colyseus `@colyseus/ws-transport`. Join/create a room by name.

Rooms:

- `cb_battle` — PvP battles. Options: `{ username, avatarUrl, mode: "player" | "spectator", token? }`.
- `room_scene` — shared world scene. Options include `roomOwnerId` (filterBy).

Authentication: pass a bearer JWT (HS512, shared `JWT_SECRET`) as `token`.
Without a token the client joins as a guest (ephemeral, not persisted).

Client → server message types live in `src/types/messages.ts`; server → client
events include `queued`, `matchFound`, `diseaseSelect`, `state`, `attack`,
`dash`, `heal`, `chat`, `matchStart`, `matchEnd`, `matchClosed`, `error`.
