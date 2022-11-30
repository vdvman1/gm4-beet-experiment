# updates old machine armor stands
# @s = disassembler armor stand
# located at @s
# run from gm4_disassemblers:main

from nbtlib import Float
from gm4_disassemblers:summon import block_name, stand_common_nbt, directions, horizontal_cmd, summon_marker

for direction, values in directions.items():
    execute if block ~ ~ ~ dropper[facing=direction] align xyz:
        summon_marker(direction, False, 0.5)
    execute if block ~ ~ ~ dropper[facing=direction] run data merge entity @s {**stand_common_nbt,Rotation:[values.rot,0.0f]}

execute unless block ~ ~ ~ dropper[facing=up] run data modify entity @s ArmorItems[3].tag.CustomModelData set value horizontal_cmd
execute if block ~ ~ ~ dropper[facing=down] run data modify entity @s ArmorItems[3].tag.CustomModelData set value directions["down"].cmd

data merge block ~ ~ ~ {CustomName:block_name}
scoreboard players set @s gm4_entity_version 1
execute align xyz positioned ~0.5 ~0.5 ~0.5 run scoreboard players set @e[type=marker,tag=gm4_machine_marker,distance=..0.1,limit=1] gm4_entity_version 1
