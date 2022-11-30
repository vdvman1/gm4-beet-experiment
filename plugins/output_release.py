from beet import Context
import os


def beet_default(ctx: Context):
	version = os.getenv("VERSION", "1.19")
	print('Saving pack', ctx.data.mcmeta)
	ctx.data.save(
		path=f"release/{version}/{ctx.project_id}_{version}.zip",
		overwrite=True,
		zipped=True,
	)
