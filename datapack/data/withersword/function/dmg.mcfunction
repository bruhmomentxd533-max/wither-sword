# Hurt nearby mobs. Instead of the SKULL damaging a list (which the /damage
# command chokes on in 26.2), we run the damage AS each nearby mob on itself.
execute as @e[distance=..3.5,type=!minecraft:player,tag=!ws_shot] run damage @s 20
