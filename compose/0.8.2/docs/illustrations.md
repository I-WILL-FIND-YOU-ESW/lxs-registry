# compose — illustration assets (prompts & spec)

Supporting artwork for the composer: one image per profession on the intro
(the "pick the work you do" cards) and one per wizard step ("Your app" and
"Your build"). Generated externally (Midjourney / DALL·E / Flux / Imagen),
then dropped into `backend/static/img/` and baked into the LXS.

## Style contract (keep every image in one language)

- **Look:** flat vector / modern editorial tech illustration. Clean geometric
  shapes, rounded corners, subtle soft gradients, gentle long soft shadows.
  Friendly, warm, optimistic, human. Minimal, generous negative space, one
  clear focal subject — never busy.
- **Palette (strict):** primary violet `#5B3FD6`, soft lavender `#E9E3FF`,
  warm off-white background `#F7F6F2`, near-black ink line `#17141D`, muted
  warm grey `#665F6E`, tiny accents of green `#198653`.
- **Must not contain:** text, letters, numbers, logos, watermarks, UI labels,
  captions, signatures. (AI-rendered text is always wrong; we label in HTML.)
- **Composition:** subject centered with comfortable margins; the off-white
  `#F7F6F2` background must touch all four edges so it blends with the page.
- **Critical for consistency:** run the same tool, the same model version, and
  the same style block. Lock it with a style reference (`--sref` in
  Midjourney), a fixed seed, or a fixed "style" in your generator, so the set
  reads as one family.

### Shared style block (append to every prompt)

> Flat vector illustration, modern editorial tech style, clean geometric
> shapes, rounded corners, subtle soft gradients, gentle long soft shadows.
> Strict palette: primary violet #5B3FD6, soft lavender #E9E3FF, warm off-white
> background #F7F6F2, near-black ink line #17141D, muted warm grey #665F6E,
> tiny green accent #198653. Friendly, warm, optimistic, human, minimal,
> generous negative space, one clear focal subject. No text, no letters, no
> numbers, no logos, no watermarks. 16:9.

## Delivery spec

| Item | Value |
|---|---|
| Aspect ratio | **16:9** |
| Size | **1600×900** (deliver 2400×1350 @2x if easy) |
| Format | **WebP** (quality ~80), sRGB |
| Weight | ≤ 250 KB each |
| Background | solid `#F7F6F2`, edge to edge |
| Filenames | exactly as in the table below |

Drop the files at `backend/static/img/`:

| File | Used by |
|---|---|
| `prof-accountant.webp` | Accountant card, and steps 2/3 when Accountant is chosen |
| `prof-doctor.webp` | Doctor card, and steps 2/3 when Doctor is chosen |
| `prof-teacher.webp` | Teacher card, and steps 2/3 when Teacher is chosen |
| `prof-cafe.webp` | Café owner card, and steps 2/3 when Café owner is chosen |
| `prof-designer.webp` | Freelance designer card, and steps 2/3 when Freelance designer is chosen |
| `step-app.webp` | Step 2 fallback (no profession picked, e.g. "start directly") |
| `step-build.webp` | Step 3 fallback (no profession picked) |

The chosen profession's illustration **follows the visitor**: steps 2 ("Your
app") and 3 ("Your build") show that role's artwork. The `step-*` images are the
fallback for the "start directly" / host path where no profession was chosen.
Until a file exists, its slot shows the themed placeholder.

## Prompts

Each prompt below is the **subject line**; append the shared style block above
(or paste the fully-composed prompt with the block already included).

**prof-accountant.webp** — *The accountant / client portal.*
> A compact desk scene for a small-business accountant: an open laptop showing
> a simple abstract financial dashboard (a bar chart and a rising line graph),
> a neat stack of paper receipts, a calculator, a coffee cup, and a small
> floating document-with-padlock icon suggesting secure client uploads, plus a
> tiny envelope icon for reminders.

**prof-doctor.webp** — *The doctor / booking & patient portal.*
> A calm clinic front-desk scene: a wall tablet or calendar showing simple
> abstract appointment time-slot blocks, a stethoscope draped neatly, a small
> floating heart-with-pulse-line icon, a waiting-room chair, and a tiny
> checkmark badge suggesting a confirmed booking.

**prof-teacher.webp** — *The teacher / class space.*
> A bright classroom desk scene: an open notebook with a worksheet and three
> simple checkmarks, a pencil, a small stack of graded papers, a tiny
> blackboard with a simple geometric doodle, and an apple resting on the corner.

**prof-cafe.webp** — *The café owner / menu & booking page.*
> A cosy independent café scene: a takeaway coffee cup with gentle steam, a
> small chalkboard menu with only a simple doodle, a little round table with a
> blank "reserved" tag shape, a croissant on a plate, and a small floating
> phone showing a simple booking card.

**prof-designer.webp** — *The freelance designer / portfolio & client area.*
> A freelance designer's workspace: a laptop, overlapping colour-swatch cards,
> layered artboard panels, a stylus, a small framed portfolio thumbnail with
> abstract shapes, and a tiny version-check badge suggesting an approved design.

**step-app.webp** — *Step 2 — "Your app": capabilities composing into an app.*
> A person assembling an app from glowing modular capability tiles — rounded
> tiles carrying single simple icons (padlock, open book, picture, bell, person)
> orbiting a central glowing app card, joined by thin lines like a small
> constellation / node graph.

**step-build.webp** — *Step 3 — "Your build": an agent builds it.*
> A person at a laptop beside a friendly glowing AI orb/agent, an open terminal
> window drawn as simple abstract lines, a speech bubble with three dots, and a
> faint node-graph motif in the background — "describe it and an agent builds it".

## Tool notes

- **Midjourney:** append the style block, then
  `--ar 16:9 --style raw --stylize 150 --v 6.1`, and add `--sref <url-of-your-best-one>`
  to lock the family together.
- **DALL·E / GPT-image:** paste the composed prompt; ask for "no text".
- **Flux / SDXL:** 1600×900 or 2400×1350; keep the same seed across the set.
- After export, compress: `cwebp -q 80 -resize 1600 0 in.png -o out.webp`.

## How it lands in the LXS

`compose` embeds its assets at compile time. Once the files are in
`backend/static/img/`, register them in `backend/src/main.rs` (the `IMAGES`
map + `/compose-app/static/img/:name` route), then
`eco lxs build && eco lxs publish compose@<v>`. Until a file exists the page
shows a themed placeholder, so the layout is already correct.
