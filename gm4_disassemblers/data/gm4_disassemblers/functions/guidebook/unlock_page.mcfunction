# tells the player that they discovered a page from this section
# @s = player who unlocked a guidebook page
# located at @s
# run from advancement gm4_guidebook:disassemblers/page_<number>

from base.helpers import translate_fallback

tellraw @s [
    "",
    {"selector":"@s"},
    {"text":" "},
    translate_fallback(
        {"text":"has discovered a guidebook page from"},
        {
            "translate":"%1$s%3427655$s",
            "with":[{"translate":"text.gm4.guidebook.discovered"}] # Why is this using the translation fallback trick? This component will already only be shown if the translation is available
        }
    ),
    {"text":" "},
    {
        "text":"[Disassemblers]",
        "color":"#4AA0C7",
        "hoverEvent":{
            "action":"show_text",
            "contents":[
                {"text":"Disassemblers","color":"#4AA0C7"},
                {"text":"\n"},
                {"text":"Break apart diamond, gold and iron tools and weapons for materials","italic":true,"color":"gray"}
            ]
        }
    }
]
