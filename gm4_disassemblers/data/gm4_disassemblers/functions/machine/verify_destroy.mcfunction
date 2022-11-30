# verifies that the destroyed machine was from this module and destroys the disassembler
# @s = machine block marker
# located at @s
# run from #gm4_machines:destroy

from gm4_disassemblers:summon import block_name

execute if entity @s[tag=gm4_disassembler] run function gm4_disassemblers:machine/destroy:
    # kill entities related to machine block
    execute positioned ~ ~-0.4 ~ run kill @e[type=armor_stand,tag=gm4_disassembler_stand,limit=1,distance=..0.01]
    execute store result score $dropped_item gm4_machine_data run kill @e[type=item,distance=..1,nbt={Age:0s,Item:{id:"minecraft:dropper",Count:1b,tag:{display:{Name:block_name}}}},limit=1,sort=nearest]
    kill @s

    # drop item (unless broken in creative mode)
    particle block tnt ~ ~ ~ .1 .25 .1 .05 30 normal @a
    execute if score $dropped_item gm4_machine_data matches 1 run loot spawn ~ ~ ~ loot gm4_disassemblers:items/disassembler
