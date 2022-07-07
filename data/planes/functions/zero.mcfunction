
#zero
#Rotation
scoreboard players set @e[type=armor_stand,tag=zero_stand,limit=1,sort=nearest,distance=..2] turn_rate 2
function rotation:main

#engine toggle
execute as @s at @s if entity @s[scores={cycle=0,click=1..}] run scoreboard players add @s engine_toggle_3 1
#fly
execute as @s[scores={engine_toggle_3=1,speed_toggle=0}] at @s run execute as @e[type=armor_stand,tag=zero_stand,limit=1,sort=nearest,distance=..2] at @s run tp @s ^ ^ ^1
execute as @s[scores={engine_toggle_3=1,speed_toggle=1}] at @s run execute as @e[type=armor_stand,tag=zero_stand,limit=1,sort=nearest,distance=..2] at @s run tp @s ^ ^ ^.5
execute as @s[scores={engine_toggle_3=1,speed_toggle=2}] at @s run execute as @e[type=armor_stand,tag=zero_stand,limit=1,sort=nearest,distance=..2] at @s run tp @s ^ ^ ^0.25

execute as @s[scores={dropped=1..}] at @s if entity @e[type=item,distance=..3,nbt={Item:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{display:{Name:'{"text":"Flight Stick"}'},CustomModelData:1001,PlaneConsole:1b,PlaneID:3b}}}] run function control_panel:speed_zero

execute as @s[scores={engine_toggle_3=0}] at @s run execute as @e[type=armor_stand,tag=zero_stand,limit=1,sort=nearest,distance=..2] at @s run tp @s ^ ^ ^ ~ 0
execute as @s at @s unless entity @e[type=armor_stand,tag=zero_stand,limit=1,sort=nearest,distance=..2,scores={zerotakeoff=60}] run execute as @e[type=armor_stand,tag=zero_stand,limit=1,sort=nearest,distance=..2] at @s if block ~ ~-0.1 ~ #du:non-solid run tp @s ^ ^-0.1 ^ ~ 0


execute as @s[scores={engine_toggle_3=1}] at @s run execute as @e[type=armor_stand,tag=zero_stand,limit=1,sort=nearest,distance=..2] at @s unless block ~ ~-1 ~ air unless block ~ ~-2 ~ air unless block ~ ~-3 ~ air unless block ~ ~-4 ~ air unless block ~ ~-5 ~ air run item replace entity @s weapon.offhand with minecraft:iron_axe{CustomModelData:1003} 1
execute as @s[scores={engine_toggle_3=1}] at @s run execute as @e[type=armor_stand,tag=zero_stand,limit=1,sort=nearest,distance=..2,scores={rot_y=-20..20}] at @s if block ~ ~-1 ~ air if block ~ ~-2 ~ air if block ~ ~-3 ~ air if block ~ ~-4 ~ air if block ~ ~-5 ~ air run item replace entity @s weapon.offhand with minecraft:stone_axe{CustomModelData:1003} 1
execute as @s[scores={engine_toggle_3=1}] at @s run execute as @e[type=armor_stand,tag=zero_stand,limit=1,sort=nearest,distance=..2,scores={rot_y=-90..-21}] at @s if block ~ ~-1 ~ air if block ~ ~-2 ~ air if block ~ ~-3 ~ air if block ~ ~-4 ~ air if block ~ ~-5 ~ air run item replace entity @s weapon.offhand with minecraft:diamond_axe{CustomModelData:1003} 1
execute as @s[scores={engine_toggle_3=1}] at @s run execute as @e[type=armor_stand,tag=zero_stand,limit=1,sort=nearest,distance=..2,scores={rot_y=17..90}] at @s if block ~ ~-1 ~ air if block ~ ~-2 ~ air if block ~ ~-3 ~ air if block ~ ~-4 ~ air if block ~ ~-5 ~ air run item replace entity @s weapon.offhand with minecraft:netherite_axe{CustomModelData:1003} 1

execute as @s at @s unless entity @s[scores={engine_toggle_3=1}] run execute as @e[type=armor_stand,tag=zero_stand,limit=1,sort=nearest,distance=..2] at @s run item replace entity @s weapon.offhand with minecraft:golden_axe{CustomModelData:1003} 1
stopsound @a * item.armor.equip_generic

#guns
execute as @s at @s if entity @s[scores={zero_ammo=1..,cycle=1..2,click=1..}] run execute as @e[type=minecart,tag=zero_seat,limit=1,sort=nearest,distance=..0.4] at @s run function gun:zero_gun


#runway
execute if entity @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{display:{Name:'{"text":"Flight Stick"}'},CustomModelData:1001,PlaneConsole:1b,PlaneID:3b}}}] unless entity @s[scores={cycle=2}] run execute as @e[type=armor_stand,tag=zero_stand,limit=1,sort=nearest,distance=..2] store result entity @s Rotation[0] float 1 run scoreboard players get @s rot_x



execute if entity @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{display:{Name:'{"text":"Flight Stick"}'},CustomModelData:1001,PlaneConsole:1b,PlaneID:3b}}}] unless entity @s[scores={cycle=2}] if entity @e[type=armor_stand,tag=zero_stand,limit=1,sort=nearest,distance=..2,scores={zerotakeoff=60}] unless entity @e[type=armor_stand,tag=zero_stand,limit=1,sort=nearest,distance=..2,scores={rot_y=-90..-22}] run execute store result entity @e[type=armor_stand,tag=zero_stand,limit=1,sort=nearest,distance=..2] Rotation[1] float 1 run data get entity @s Rotation[1] 1

#takeoff/landing
execute as @s[scores={engine_toggle_3=1,speed_toggle=0}] at @s run execute as @e[type=armor_stand,tag=zero_stand,limit=1,sort=nearest,distance=..2] at @s unless entity @s[scores={zerotakeoff=60}] unless block ~ ~-0.1 ~ #du:non-solid run scoreboard players add @s zerotakeoff 1
execute as @s[scores={engine_toggle_3=0}] at @s run execute as @e[type=armor_stand,tag=zero_stand,limit=1,sort=nearest,distance=..2] at @s unless entity @s[scores={zerotakeoff=..0}] unless block ~ ~-0.1 ~ #du:non-solid run scoreboard players remove @s zerotakeoff 1
execute as @s[scores={engine_toggle_3=0}] at @s run execute as @e[type=armor_stand,tag=zero_stand,limit=1,sort=nearest,distance=..2] at @s unless entity @s[scores={zerotakeoff=..0}] run tp @s ^ ^ ^0.33

execute as @s[scores={engine_toggle_3=0}] at @s run execute as @e[scores={zerotakeoff=59},type=armor_stand,tag=zero_stand,limit=1,sort=nearest,distance=..2] run playsound minecraft:plane.skrrt master @a[distance=..10] ~ ~ ~

#crashlanding
execute as @s at @s run execute as @e[type=armor_stand,tag=zero_stand,limit=1,sort=nearest,distance=..2] at @s unless block ~ ~ ~ #du:non-solid run function planes:crash

#sounds
#fly
execute as @s at @s if entity @s[scores={engine_toggle_3=1}] run execute as @e[type=armor_stand,tag=zero_stand,limit=1,sort=nearest,distance=..2] at @s run scoreboard players add @s zeroflysound 1
execute as @s at @s if entity @s[scores={engine_toggle_3=1}] run execute as @e[scores={zeroflysound=0..2},type=armor_stand,tag=zero_stand,limit=1,sort=nearest,distance=..2] at @s run playsound minecraft:plane.fly player @a[distance=..40]
#in
execute as @s at @s unless entity @s[scores={engine_toggle_3=1}] if entity @e[type=minecart,tag=zero_seat,distance=..0.4] run execute as @e[type=armor_stand,tag=zero_stand,limit=1,sort=nearest,distance=..2] at @s run scoreboard players add @s zeroinsound 1
execute as @s at @s unless entity @s[scores={engine_toggle_3=1}] if entity @e[type=minecart,tag=zero_seat,distance=..0.4] run execute as @e[scores={zeroinsound=0..2},type=armor_stand,tag=zero_stand,limit=1,sort=nearest,distance=..2] at @s run playsound minecraft:plane.in player @a[distance=..40]

#fuel
execute as @e[type=armor_stand,tag=zero_stand,limit=1,sort=nearest,distance=..2] at @s if entity @s[scores={planefuel=0}] unless entity @s[scores={zero_fuel=0}] run scoreboard players remove @s zero_fuel 1

#Bomb
execute as @s at @s if entity @s[scores={cycle=3,click=1..}] run execute as @e[type=armor_stand,tag=zero_stand,limit=1,sort=nearest,distance=..2] at @s if entity @s[nbt={HandItems:[{id:"minecraft:green_terracotta",Count:1b,tag:{CustomModelData:1001}},{}]}] unless entity @s[scores={rot_y=80..90}] run function gun:bomb
execute as @s at @s if entity @s[scores={cycle=3,click=1..}] run execute as @e[type=armor_stand,tag=zero_stand,limit=1,sort=nearest,distance=..2] at @s if entity @s[nbt={HandItems:[{id:"minecraft:green_terracotta",Count:1b,tag:{CustomModelData:1001}},{}]}] if entity @s[scores={rot_y=80..90}] run function gun:bombdive

#climb
#rot_y
execute as @e[type=armor_stand,tag=zero_stand,limit=1,sort=nearest,distance=..2] at @s run execute store result score @s rot_y run data get entity @s Rotation[1]
execute as @e[type=armor_stand,tag=zero_stand,limit=1,sort=nearest,distance=..2] at @s if entity @s[scores={rot_y=-90..-22}] run tp @s ~ ~ ~ ~ -21

#collison
execute as @e[type=armor_stand,tag=zero_stand,limit=1,sort=nearest,distance=..2] at @s if entity @e[tag=plane,distance=1..4,type=armor_stand,nbt={ShowArms:1b,Invisible:1b}] run execute as @e[distance=..4,type=armor_stand,nbt={ShowArms:1b,Invisible:1b}] at @s run function planes:crash

#max altitude
execute as @e[type=armor_stand,tag=zero_stand,limit=1,sort=nearest,distance=..2] at @s if entity @p[scores={altitude=727..}] run tp @s ~ ~ ~ ~ 1

#sound score restart
execute as @e[type=armor_stand,tag=zero_stand,limit=1,sort=nearest,distance=..2] at @s if score @s zeroflysound matches 20.. run scoreboard players set @s zeroflysound 1
execute as @e[type=armor_stand,tag=zero_stand,limit=1,sort=nearest,distance=..2] at @s if score @s zeroinsound matches 20.. run scoreboard players set @s zeroinsound 1
