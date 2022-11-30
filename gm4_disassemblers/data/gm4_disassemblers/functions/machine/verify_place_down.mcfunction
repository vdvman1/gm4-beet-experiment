# verifies that the placed down machine was from this module and places the disassembler down
# @s = player who placed down the machine
# located at the machine block marker (at the center of the placed down block)
# run from #gm4_machines:place_down

from gm4_disassemblers:summon import place_block, summon_stand, summon_marker, directions_from_rotations

execute
    if score $placed_block gm4_machine_data matches 0
    store success score $placed_block gm4_machine_data
    if data storage gm4_machines:temp {id:"gm4_disassembler"}
    run function gm4_disassemblers:machine/create:
        # place block depending on rotation
        for i, direction in enumerate(directions_from_rotations):
            execute
                if score $rotation gm4_machine_data matches f"{i+1}"
                run function f"gm4_disassemblers:machine/rotate/{direction}":
                    place_block(direction)
                    summon_stand(direction)
                    summon_marker(direction)
        
        # mark block as placed
        playsound minecraft:block.anvil.place master @a ~ ~ ~ 0.9 0.1
        scoreboard players set $placed_block gm4_machine_data 1
        scoreboard players set @e[distance=..2,tag=gm4_new_machine] gm4_entity_version 1
        tag @e[distance=..2] remove gm4_new_machine
