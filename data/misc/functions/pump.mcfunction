execute as @s at @s if score @s fueltimer matches 0 run function fuel:pump
execute as @s at @s run tp @s ^ ^ ^ 0 0
execute as @s[tag=!done] at @s run setblock ^ ^ ^ minecraft:hopper[facing=south] replace
execute as @s[tag=!done] at @s run setblock ^ ^ ^1 minecraft:chest[facing=south]{CustomName:'{"text":"Oil Pump","italic":false}'} replace
execute as @s[tag=!done] at @s run tag @s add done
execute as @s[tag=done] at @s[tag=done] unless block ~ ~ ~ minecraft:hopper run recipe give @p[distance=..5] crafting:oil_pump
execute as @s[tag=done] at @s if block ~ ~ ~ air run kill @s
