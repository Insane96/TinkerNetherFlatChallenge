scoreboard objectives add endCrystalGen dummy

execute in the_end as @e[type=ender_dragon] at @s unless score DummyPlayer endCrystalGen matches 2 run scoreboard players add DummyPlayer endCrystalGen 1
execute if score DummyPlayer endCrystalGen matches 1 run schedule function ticonchallenge:actually_generate_crystals 15s
execute if score DummyPlayer endCrystalGen matches 1 run scoreboard players add DummyPlayer endCrystalGen 1
schedule function ticonchallenge:generate_crystals 5s