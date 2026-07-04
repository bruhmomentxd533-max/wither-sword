# Runs AS the player who fired, standing AT the player.

# --- Cast effects: sound + a little burst in front of the face ---
playsound minecraft:entity.wither.shoot player @a[distance=..40] ~ ~ ~ 1 1.4
execute anchored eyes run particle minecraft:soul_fire_flame ^ ^ ^1 0.05 0.05 0.05 0.01 12

# --- Aim trick (no math needed) ---
# Put an invisible "marker" 1 block in front of the eyes. That point sits
# exactly along the line you're looking down.
execute anchored eyes run summon minecraft:marker ^ ^ ^1 {Tags:["ws_aim"]}

# Spawn the wither skull right at the eyes, standing still for now.
execute anchored eyes run summon minecraft:wither_skull ^ ^ ^0 {Tags:["ws_shot","ws_new"],Motion:[0.0,0.0,0.0]}

# Turn the fresh skull so it faces the marker = exactly where you're looking.
execute as @e[tag=ws_new,limit=1] run rotate @s facing entity @e[tag=ws_aim,limit=1]

# Start its life timer and clean up the temporary tags/marker.
scoreboard players set @e[tag=ws_new] ws_age 0
tag @e[tag=ws_new] remove ws_new
kill @e[tag=ws_aim]
