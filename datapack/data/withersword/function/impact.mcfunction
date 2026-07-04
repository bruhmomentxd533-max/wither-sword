# Runs AS / AT a skull that just hit something. BOOM.

# Real vanilla explosion puffs. IMPORTANT: in 26.2 the 'explosion' particle only
# accepts a POSITION - adding count/speed numbers breaks the whole function.
# So we spawn a few at small offsets for a chunkier blast.
particle minecraft:explosion ~ ~ ~
particle minecraft:explosion ~0.6 ~0.3 ~0.4
particle minecraft:explosion ~-0.5 ~0.2 ~-0.4

# Extra flair (these particles DO accept the full number form).
particle minecraft:large_smoke ~ ~ ~ 0.4 0.4 0.4 0.03 20
particle minecraft:soul_fire_flame ~ ~ ~ 0.3 0.3 0.3 0.08 40

# Boom sound (isolated so an unknown sound name can't break impact).
function withersword:snd

# Damage + wither (players skipped for now).
function withersword:dmg
function withersword:eff

# Remove the skull now that it has exploded.
kill @s
