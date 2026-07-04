# ⚔️ Wither Sword

A custom Minecraft weapon for **Minecraft 26.2** (vanilla, no mods). Right‑click the
Wither Sword to fire a **wither skull** in the direction you're looking — it flies
with a soul trail and **explodes on impact**, dealing damage and applying the
**wither** effect to nearby mobs.

Made as a learn‑by‑building project: it's a **datapack** (the behaviour) plus a
**resource pack** (the custom look).

---

## What's in the box

```
wither-sword/
├── datapack/        → goes in a world's  saves/<World>/datapacks/
│   ├── pack.mcmeta          (pack_format 107 = MC 26.2)
│   └── data/withersword/function/
│       ├── load        – sets up the scoreboards on load/reload
│       ├── give        – gives you the Wither Sword
│       ├── tick        – every tick: detect right‑click, fly the skulls
│       ├── shoot       – spawns + aims one wither skull
│       ├── fly         – moves a skull, trails it, checks for a hit
│       ├── impact      – the explosion (particles + sound)
│       ├── dmg / eff   – deal damage / apply wither
│       └── snd         – explosion sound
└── resourcepack/    → goes in  resourcepacks/
    ├── pack.mcmeta          (pack_format 88 = MC 26.2)
    └── assets/withersword/
        ├── items/wither_sword.json          (item model definition)
        ├── models/item/wither_sword.json    (handheld sword model)
        └── textures/item/wither_sword.png   (64×64 Demonblade-style texture)
```

## How it works (the short version)

- The item is secretly a **carrot‑on‑a‑stick** — that's the only vanilla item whose
  right‑clicks a datapack can reliably detect (via the
  `minecraft.used:minecraft.carrot_on_a_stick` scoreboard). It's renamed *Wither Sword*,
  tagged with `custom_data {ws:true}`, and given a custom **item model** so it looks
  like a sword.
- On right‑click, `shoot` spawns a wither skull at your eyes, drops an invisible marker
  1 block ahead, and rotates the skull to face it — that aims it exactly where you look
  **with no math**.
- Each tick, `fly` teleports every skull forward, leaves a soul trail, and checks whether
  it's inside a solid block or overlapping a mob's hitbox. On a hit, `impact` runs the
  explosion, damage, and wither, then removes the skull.

## Install & play

1. Copy the **`datapack`** folder into your world:
   `…/saves/<YourWorld>/datapacks/`  (rename it to `wither-sword` if you like).
2. Copy the **`resourcepack`** folder into `…/resourcepacks/` and enable it in
   **Options → Resource Packs**.
3. In game (cheats on): `/reload`, then `/function withersword:give`.
4. Hold the sword and **right‑click**. 🗡️💥

## 26.2 gotchas learned while building (so future‑me remembers)

- Datapack `pack_format` = **107**; resource pack `pack_format` = **88**.
- The `explosion` particle takes a **position only** — `particle minecraft:explosion ~ ~ ~`.
  Adding the usual `dx dy dz speed count` numbers is a parse error that stops the whole
  function from loading. `explosion_emitter` and `flash` don't work in commands at all.
- `/damage @e[…] <n>` **chokes if the target list includes the skull itself** — run it as
  each mob on itself instead: `execute as @e[…,tag=!ws_shot] run damage @s <n>`.
- Custom item look uses the **item_model component** → `items/<name>.json` →
  `models/item/<name>.json`, exactly like a vanilla sword.

## TODO / ideas

- [ ] Confirm/replace the explosion **sound** id for 26.2
- [ ] "Owner" tag so your own skulls can't hurt you in Survival
- [ ] **Crafting recipe**
- [ ] Charged shot / blue (block‑breaking) skulls / cooldown
- [ ] A fancier hand‑sculpted 3D model

---

*Built for Minecraft 26.2. The texture is a placeholder — repaint
`resourcepack/…/textures/item/wither_sword.png` in any pixel editor to make it yours.*
