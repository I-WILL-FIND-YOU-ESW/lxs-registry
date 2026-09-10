# Changelog

## 0.3.1
- Fix: the command webhook now receives **every** text message, not only
  `/commands`. A confirmation reply like `YA` (no leading slash) never reached
  the consumer before, so two-step confirmations were stuck. The consumer
  returns `None` for ordinary text, which then falls through to conversation
  answer matching as before.

## 0.3.0
- Optional **command webhook**: inbound messages starting with `/` are POSTed
  to `TELEGRAM_COMMAND_WEBHOOK` (Bearer `TELEGRAM_COMMAND_TOKEN`) and the
  returned `{"reply": "..."}` is sent back to the chat. Keeps this domain
  generic — the consumer owns the command set (e.g. eco's `/nodes`). Unset =
  no command handling (notification-only bots unchanged).

## 0.2.1
- Fix: store `last_seen` / `answered_at` as RFC 3339 **strings** (the
  convention email-manager uses) instead of BSON dates. Mixing the two made
  contact/conversation reads fail to deserialize, so `GET /api/telegram/chats`
  returned `[]` even though inbound messages were stored.

## 0.2.0
- `SERVER_HOST` (optional) — bind address; set `127.0.0.1` to keep the
  unauthenticated domain API off the public interface (used by the agent-host
  ops bot). Default remains `0.0.0.0` for estate-internal composition.

## 0.1.0 (initial release)
- Initial release — LXS manifest `telegram@0.1.0`.
  - Telegram bot channel domain: outbound `sendMessage` (private + group),
    inbound `getUpdates` long-polling with persisted offset, bindings
    (`key` → chat) with deep-link self-bind (`?start=<key>`), contacts ledger,
    and ask/answer conversations (reply-to or FIFO matching, timeout expiry).
  - MongoDB persistence (`bindings`, `contacts`, `conversations`, `settings`).
  - NDJSON logs to stdout (tracing-json), provider health endpoint.
