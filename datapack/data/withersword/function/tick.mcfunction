# Runs every single game tick (20 times per second).

# 1) Fire when a player right-clicks while holding the real Wither Sword.
execute as @a[scores={ws_use=1..}] at @s if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[minecraft:custom_data~{ws:true}] run function withersword:shoot

# 2) Reset the click counter for everyone, ready for the next click.
scoreboard players set @a ws_use 0

# 3) Update every flying skull: move it, trail it, age it, and check for a hit.
execute as @e[type=minecraft:wither_skull,tag=ws_shot] at @s run function withersword:fly
