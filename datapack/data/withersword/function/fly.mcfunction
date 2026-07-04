# Runs AS / AT one flying Wither-Sword skull, once per tick.
# Check for a hit at the CURRENT spot FIRST, then move at the very end.

# Age it.
scoreboard players add @s ws_age 1

# Soul trail at the current spot.
particle minecraft:soul ~ ~ ~ 0.03 0.03 0.03 0.0 3

# Reset the hit flag.
tag @s remove ws_hit

# Hit a solid block? (air/water/plants are "replaceable" = NOT a hit.)
execute unless block ~ ~ ~ #minecraft:replaceable run tag @s add ws_hit

# Hit a mob? Any non-player, non-skull entity overlapping a 2-block cube.
execute if score @s ws_age matches 2.. positioned ~-1 ~-1 ~-1 if entity @e[dx=2,dy=2,dz=2,tag=!ws_shot,type=!minecraft:player] run tag @s add ws_hit

# If we hit something, explode (impact removes the skull) and stop here.
execute if entity @s[tag=ws_hit] run function withersword:impact
execute if entity @s[tag=ws_hit] run return 0

# Lived ~5 seconds without hitting anything? Fizzle out.
execute if score @s ws_age matches 100.. run kill @s
execute if score @s ws_age matches 100.. run return 0

# Nothing hit yet -> move forward for the next tick.
tp @s ^ ^ ^1.0
