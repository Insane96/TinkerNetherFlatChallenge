execute as @e[type=wandering_trader,tag=!spawn_checked] run tellraw @a ["",{"text":"The "},{"text":"Loot Bag","strikethrough":true},{"text":" Wandering Trader has spawned"}]
execute as @e[type=wandering_trader,tag=!spawn_checked] run tag @s add spawn_checked
schedule function ticonchallenge:trader_spawn 1s