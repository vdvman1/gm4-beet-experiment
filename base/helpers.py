from typing import Any
import json

JsonTextProps = dict[str, Any]


def stringify_json_text(text: JsonTextProps) -> str:
    return json.dumps(text, separators=(",", ":"), ensure_ascii=False)


def translate_fallback(
    fallback: Any, original: Any, props: JsonTextProps = {}
) -> JsonTextProps:
    return {
        "translate": "%1$s%3427655$s",  # check if GM4 translations are loaded
        "with": [
            fallback,  # No GM4 translations, fallback to basic text
            original,  # Has GM4 translations, use them
        ],
        **props,
    }


def translate_fallback_str(
    fallback: Any, original: Any, props: JsonTextProps = {}
) -> str:
    return stringify_json_text(translate_fallback(fallback, original, props))


def resource_fallback(
    fallback: Any, original: Any, props: JsonTextProps = {}
) -> JsonTextProps:
    return {
        "translate": "%1$s%3427656$s",  # check if GM4 resource pack is loaded
        "with": [
            fallback,  # GM4 resource pack not loaded, fallback to basic text
            original,  # GM4 resource pack is loaded, use it
        ],
        **props,
    }
