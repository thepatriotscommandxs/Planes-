scoreboard players add @s cycle 1
execute if score @s cycle matches 3.. run scoreboard players set @s cycle 0
item replace entity @s weapon.offhand with air
give @s minecraft:carrot_on_a_stick{display:{Name:'{"text":"Flight Stick"}'},CustomModelData:1001,PlaneConsole:1b,PlaneID:9b} 1
execute if score @s cycle matches 0 run tellraw @s [{"text":"[Debug]: ","color":"yellow","bold":true,"italic":false},{"text":"Engine Control","color":"white","bold":false,"italic":false}]
execute if score @s cycle matches 1 run tellraw @s [{"text":"[Debug]: ","color":"yellow","bold":true,"italic":false},{"text":"Mouse Control: guns","color":"white","bold":false,"italic":false}]
execute if score @s cycle matches 2 run tellraw @s [{"text":"[Debug]: ","color":"yellow","bold":true,"italic":false},{"text":"Freecam: guns","color":"white","bold":false,"italic":false}]
