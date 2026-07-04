# Runs once when the datapack loads or when you type /reload.
# Sets up the two counters the pack needs.

# Counts every time a player right-clicks a carrot-on-a-stick.
scoreboard objectives add ws_use minecraft.used:minecraft.carrot_on_a_stick

# A timer we put on each flying skull so we can remove it after a few seconds.
scoreboard objectives add ws_age dummy

tellraw @a {"text":"[Wither Sword] loaded! Type /function withersword:give","color":"dark_purple"}
