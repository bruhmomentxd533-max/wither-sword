# Gives YOU (whoever runs this) one Wither Sword.
# It's secretly a carrot-on-a-stick so the game can detect right-clicks,
# but it's named "Wither Sword" and tagged with custom_data {ws:true}
# so our code knows it's THE special item.

give @s minecraft:carrot_on_a_stick[minecraft:item_name='{"text":"Wither Sword","color":"dark_purple","bold":true}',minecraft:custom_data={ws:true},minecraft:item_model="withersword:wither_sword",minecraft:unbreakable={},minecraft:enchantment_glint_override=true,minecraft:lore=['{"text":"Right-click to fire a wither skull","color":"gray","italic":false}']]
