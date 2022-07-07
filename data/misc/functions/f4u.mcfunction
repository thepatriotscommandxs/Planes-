execute as @s[type=armor_stand,tag=f4u_model] at @s if entity @s[type=armor_stand,tag=f4u_model,nbt={HandItems:[{id:"minecraft:charcoal",Count:1b,tag:{display:{Name:'{"text":"Fuel","italic":false}'},CustomModelData:1001}},{}]}] run function fuel:f4u
execute as @s[type=armor_stand,tag=f4u_model] at @s if entity @s[type=armor_stand,tag=f4u_model,nbt={HandItems:[{id:"minecraft:gold_nugget",Count:1b,tag:{display:{Name:'{"text":"Bullet","italic":false}'},CustomModelData:1005}},{}]}] run function ammo:f4u
execute as @s[type=armor_stand,tag=f4u_model] at @s unless entity @a[distance=..4] unless entity @s[type=armor_stand,nbt={HandItems:[{},{id:"minecraft:iron_nugget",Count:1b,tag:{CustomModelData:1006}}]}] run item replace entity @s weapon.offhand with minecraft:iron_nugget{CustomModelData:1006} 1
execute as @s[type=minecart,tag=f4u_seat] at @s run execute store result entity @s Rotation[0] float 1 run data get entity @e[type=armor_stand,tag=f4u_stand,limit=1,sort=nearest] Rotation[0] 1
execute as @s[type=minecart,tag=f4u_seat] at @s run execute store result entity @s Rotation[2] float 1 run data get entity @e[type=armor_stand,tag=f4u_stand,limit=1,sort=nearest] Rotation[2] 1
execute as @s[type=armor_stand,tag=f4u_stand] at @s run function plane_durability:f4u
execute as @s[scores={f4utakeoff=100..},type=armor_stand,tag=f4u_stand] at @s unless entity @a[distance=..2] unless block ~ ~-0.1 ~ #main:voids run function planes:crash
execute as @s[scores={f4utakeoff=100..},type=armor_stand,tag=f4u_stand] at @s unless entity @a[distance=..2] if block ~ ~-0.01 ~ #main:voids run tp @s ^ ^-0.2 ^0.3 ~ 0
execute as @s[type=armor_stand,tag=f4u_stand] at @s if block ~ ~1 ~ water run particle falling_water ~ ~1 ~ 3 1 3 0.001 300 normal
execute as @s[type=armor_stand,tag=f4u_stand] at @s if block ~ ~1 ~ water run function planes:crash
execute as @s[scores={f4utakeoff=100..,f4u_fuel=..0},type=armor_stand,tag=f4u_stand] at @s unless block ~ ~-0.1 ~ #main:voids run function planes:crash
execute as @s[scores={f4utakeoff=100..,f4u_fuel=..0},type=armor_stand,tag=f4u_stand] at @s if block ~ ~-0.01 ~ #main:voids run tp @s ^ ^-0.2 ^0.3 ~ 0

execute as @s at @s if entity @s[type=armor_stand,nbt={HandItems:[{id:"minecraft:stick",Count:1b,tag:{display:{Name:'{"text":"Bomb","italic":false}'},CustomModelData:1009}},{}]}] run item replace entity @s weapon.mainhand with green_terracotta{CustomModelData:1001} 1

execute as @s[type=armor_stand,tag=f4u_stand] at @s store result score @s f4u_fuel run scoreboard players get @e[type=armor_stand,tag=f4u_model,limit=1,sort=nearest] f4u_fuel
execute as @s[type=armor_stand,tag=f4u_stand] at @s store result score @s f4u_ammo run scoreboard players get @e[type=armor_stand,tag=f4u_model,limit=1,sort=nearest] f4u_ammo
