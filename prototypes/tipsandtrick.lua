local simulations=require("prototypes.tatsimulations")

data:extend({
	{
		type = "tips-and-tricks-item-category",
		name = "lihop-SpaceContinuum",
		order = "l-[SpaceContinuum]",
	},
	{
		type = "tips-and-tricks-item",
		name = "lihop-SpaceContinuum-spidertron",
		localised_description={"tips-and-tricks-item-description.lihop-SpaceContinuum-spidertron"},
		category = "lihop-SpaceContinuum",
		order = "0",
		starting_status = "locked",
		trigger =
		{
			type = "research",
			technology = "spidertron"
		},
		--tag = "[img=lihop-rate-tool]",
		--is_title = false,
        image="__SpaceContinuum__/graphics/tipsandtrick/spider.png",
		--simulation=simulations.spidertron
	},
})