# checks if this is the next module to generate pages and adds pages to the guidebook
# @s = player who's updating their guidebook
# located at @s
# run from #gm4_guidebook:add_pages

from base.helpers import stringify_json_text, translate_fallback, translate_fallback_str, resource_fallback

execute if data storage gm4_guidebook:temp module{id:"disassemblers"} run function gm4_disassemblers:guidebook/add_pages:
    back_props = {
        "color":"#4AA0C7",
        "clickEvent":{"action":"change_page","value":"2"},
        "hoverEvent":{
            "action":"show_text",
            "contents":[
                translate_fallback({"text":"Return to Table of Contents"},{"translate":"text.gm4.guidebook.return_to_table"},{"italic":True,"color":"gold"})
            ]
        }
    }
    open_wiki = {
        "clickEvent":{"action":"open_url","value":"https://wiki.gm4.co/wiki/Disassemblers"},
        "hoverEvent":{
            "action":"show_text",
            "contents":[
                translate_fallback({"text":"Open External Wiki"},{"translate":"text.gm4.guidebook.open_wiki"},{"italic":True,"color":"gold"})
            ]
        }
    }
    start = [
        {"text":"◀ ",**back_props},
        translate_fallback({"text":"Back"},{"translate":"text.gm4.guidebook.back"},back_props),
        {"text":"\n"},
        {
            "text":"☶ ",
            "color":"#864BC7",
            "bold":true,
            **open_wiki
        },
        translate_fallback({"text":"Wiki"},{"translate":"text.gm4.guidebook.wiki"},{"color":"#864BC7",**open_wiki}),
        {"text":"\n\n"},
        {"text":"Disassemblers","underlined":true},
        {"text":"\n"},
    ]
    undiscovered = {
        "text":"???",
        "hoverEvent":{
            "action":"show_text",
            "contents":[
                translate_fallback({"text":"Undiscovered"},{"translate":"text.gm4.guidebook.undiscovered"},{"italic":True,"color":"red"})
            ]
        }
    }
    undiscovered_page = stringify_json_text(["",undiscovered])

    execute unless entity @s[advancements={gm4_guidebook:disassemblers/page_0=true}] run data modify storage gm4_guidebook:temp insert set value [
        '',
        stringify_json_text(["",*start,undiscovered]),
        undiscovered_page
    ]

    execute if entity @s[advancements={gm4_guidebook:disassemblers/page_0=true}] run data modify storage gm4_guidebook:temp insert set value [
        '',
        stringify_json_text([
            "",
            *start,
            translate_fallback(
                {"text":"Custom Crafters can be converted into Disassmeblers to take apart metal armour, tools, and weapons.\n\nThe disassembler will return ingots based on the item's durability."},
                {"translate":"text.gm4.guidebook.disassmeblers.1"}
            )
        ]),
        undiscovered_page
    ]

    # unlockable pages
    cobblestone_icon = resource_fallback(
        {"text":"☒","color":"#353b40"},
        {
            "translate":"text.gm4.guidebook.crafting.display.block.minecraft.cobblestone",
            "font":"gm4:guidebook",
            "color":"white"
        },
        {
            "hoverEvent":{
                "action":"show_item",
                "contents":{"id":"cobblestone"}
            }
        }
    )
    execute if entity @s[advancements={gm4_guidebook:disassemblers/page_1=true}] run data modify storage gm4_guidebook:temp insert[2] set value stringify_json_text([
        "",
        translate_fallback(
            {"text":"To create a Disassembler, the following recipe must be arranged in a Custom Crafter:"},
            {"translate":"text.gm4.guidebook.disassemblers.2_0"}
        ),
        "\n\n  ",
        translate_fallback("Custom Crafter",{"translate":"container.gm4.custom_crafter"}),
        "\n      ",
        cobblestone_icon,cobblestone_icon,cobblestone_icon,
        "\n","      ",
        cobblestone_icon,
        resource_fallback(
            {"text":"☒","color":"#c90202"},
            {
                "translate":"text.gm4.guidebook.crafting.display.block.minecraft.tnt",
                "font":"gm4:guidebook",
                "color":"white"
            },
            {
                "hoverEvent":{
                    "action":"show_item",
                    "contents":{"id":"tnt"}
                }
            }
        ),
        cobblestone_icon,
        " → ",
        resource_fallback(
            {"text":"█","color":"#96381b"},
            {
                "translate":"text.gm4.guidebook.crafting.display.block.gm4.disassembler",
                "font":"gm4:guidebook",
                "color":"white"
            },
            {
                "hoverEvent":{
                    "action":"show_item",
                    "contents":{
                        "id":"dropper",
                        "tag":"{display:{Name:'" + translate_fallback_str("Disassembler",{"translate":"block.gm4.disassembler"},{"italic":False}) + "'}}"
                    }
                }
            }
        ),
        "\n",
        "      ",
        cobblestone_icon,
        resource_fallback(
            {"text":"☒","color":"#8f1103"},
            {
                "translate":"text.gm4.guidebook.crafting.display.item.minecraft.redstone",
                "font":"gm4:guidebook",
                "color":"white"
            },
            {
                "hoverEvent":{
                    "action":"show_item",
                    "contents":{"id":"redstone"}
                }
            }
        ),
        cobblestone_icon,
        "\n\n",
        translate_fallback({"text":"To disassemble items, drop them on the disassembler."},{"translate":"text.gm4.guidebook.disassemblers.2_1"})
    ])
