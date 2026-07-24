import json
import sys

pref_path = sys.argv[1]

with open(pref_path, "r") as f:
    pref = f.read()

pref = json.loads("".join(chr(int(x + y, 16)) for x, y in zip(pref[::2], pref[1::2])))

pref.update({
    "enableAutoUpdate": False,
    "send_usage_info": False,
    "didShowWelcomePanel": True,
    "didShowWelcomePanel2": True,
    "noWarnigForFocusMode": True,
    "noWarnigForTypeWriterMode ": True,
    "noHintForOpenLink": True,
    "noWarnigForDeleteFile": True,

    "can_collapse_outline_panel": True,
    "theme": "d42ker-github.css",

    "match_pari_markdown": True,
    "auto_expand_block": True,
    "copy_markdown_by_default": True,

    "strict_mode": True,
    "enable_inline_math": True,
})

pref = "".join(hex(ord(c))[2:] for c in json.dumps(pref, separators=(",", ":")))

with open(pref_path, "w") as f:
    f.write(pref)
