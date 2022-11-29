from beet import Context, LootTable

def beet_default(ctx: Context):
	print('Disassemblers')
	ctx.generate("disassembly", LootTable({
		"pools": [
			{
				"rolls": 3,
				"entries": []
			}
		]
	}))
