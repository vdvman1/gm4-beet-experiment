# checks if the block is from this module and summons the entities for this machine
# @s = player who placed the block
# located at the center of the block to be placed
# run from #gm4_relocators:place_down_check

from gm4_disassemblers:summon import summon_stand, summon_marker

execute
    if score $placed_block gm4_rl_data matches 0
    if score gm4_disassemblers load.status matches 1
    store success score $placed_block gm4_rl_data
    if data storage gm4_relocators:temp gm4_relocation{custom_block:"gm4_disassembler"}
    run function gm4_disassemblers:relocate/summon_block_markers:
        summon_stand()
        summon_marker()

        execute as @e[tag=gm4_new_machine,distance=..2] run data modify entity @s Rotation set from storage gm4_relocators:temp gm4_relocation.entity_data.Rotation
        execute as @e[tag=gm4_new_machine,distance=..2] at @s rotated as @e[type=marker,tag=gm4_new_machine,distance=..2,limit=1] run tp ~ ~ ~
        execute as @e[type=armor_stand,tag=gm4_new_machine,distance=..2] run data modify entity @s ArmorItems set from storage gm4_relocators:temp gm4_relocation.entity_data.ArmorItems
        scoreboard players set @e[distance=..2,tag=gm4_new_machine] gm4_entity_version 1
        tag @e[distance=..2] remove gm4_new_machine
