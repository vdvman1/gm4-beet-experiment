from beet import Context


def beet_default(ctx: Context):
	manifest = ctx.cache["gm4_manifest"].json
	contributors = manifest.get("contributors", [])
	credits = next((m["credits"] for m in manifest.get("modules", []) if m["id"] == ctx.project_id), {})
	if len(credits) == 0:
		return
	ctx.data.mcmeta.data["credits"] = {
		title: [
			dict(**contributors.get(p, {'name': p}))
			for p in credits[title]
		]
		for title in credits
		if isinstance(credits[title], list)
	}
