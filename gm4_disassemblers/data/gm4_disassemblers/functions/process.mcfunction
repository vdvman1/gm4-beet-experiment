# checks for a single item in the dropper and processes it
# @s = disassembler marker [tag=gm4_disassembler]
# located at the dissasembler block
# run from main

data modify storage gm4_disassemblers:temp Items set from block ~ ~ ~ Items
execute
    if data storage gm4_disassemblers:temp Items[0]
    unless data storage gm4_disassemblers:temp Items[1]
    positioned ~ ~-0.4 ~
    as @e[type=armor_stand,tag=gm4_disassembler_stand,limit=1,distance=..0.01]
    positioned ~ ~0.4 ~
    run function gm4_disassemblers:check_item:
        data modify entity @s HandItems[0] set from storage gm4_disassemblers:temp Items[0]
        execute store result score $damage gm4_disassembler run data get storage gm4_disassemblers:temp Items[0].tag.Damage
        scoreboard players set $dropped gm4_disassembler 0
        function #gm4_disassemblers:before_base
        execute if score $dropped gm4_disassembler matches 0 run function #gm4_disassemblers:during_base
        execute if score $dropped gm4_disassembler matches 0 run function #gm4_disassemblers:after_base
