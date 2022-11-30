# @s = command block placed by "gm4_relocators:backwards_compatibility/place_down/replace_head"
# located at the command block (where the player head was)

from gm4_disassemblers:summon import block_name

for cb_facing, dropper_facing in [
        ("east" , "west" ),
        ("west" , "east" ),
        ("south", "north"),
        ("north", "south"),
        ("down" , "up"   )
    ]:
    execute if block ~ ~ ~ command_block[facing=cb_facing] run setblock ~ ~ ~ dropper[facing=dropper_facing]

data merge block ~ ~ ~ {CustomName:block_name}
# TODO: Extract common functionality between gm4_disassemblers/place_down_check, gm4_disassemblers:upgrade_machine_stand, and gm4_disassemblers/place_down
summon armor_stand ~ ~-.4 ~ {
    Small:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,DisabledSlots:2039552,
    Tags:["gm4_no_edit","gm4_disassembler"],
    HasVisualFire:1,CustomName:'"gm4_disassembler"',
    ArmorItems:[{},{},{},{id:"minecraft:tnt",Count:1b,tag:{CustomModelData:3420001}}]
}
playsound minecraft:block.anvil.place master @a ~ ~ ~ 0.9 0.1
