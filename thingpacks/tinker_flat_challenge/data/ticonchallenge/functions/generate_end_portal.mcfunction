scoreboard objectives add endPortalGen dummy

scoreboard players add DummyPlayer endPortalGen 1
execute if score DummyPlayer endPortalGen matches 1 run spreadplayers 0 0 16 16 false @a
execute if score DummyPlayer endPortalGen matches 1 run schedule function ticonchallenge:actually_generate_portal 10s
execute if score DummyPlayer endPortalGen matches 1 run schedule function ticonchallenge:lightning_bolt 5s
execute if score DummyPlayer endPortalGen matches 1 run scoreboard players add DummyPlayer endPortalGen 1