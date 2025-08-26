require("__space-age__.prototypes.entity.fusion-system-pictures")
local meld = require("meld")
local Shared = require("shared")

local recipe_category = {
  type = "recipe-category",
  name = Shared.mod_name_prefix .. "internal"
}

local recipe = {--table.deepcopy(data.raw.recipe["fluoroketone-cooling"])
	name = Shared.mod_name_prefix .. "internal-plasma-forwarding",
	type = "recipe",
	category = Shared.mod_name_prefix .. "internal",
	icon = "__space-age__/graphics/icons/fluid/fusion-plasma.png",
	ingredients = {
		{type = "fluid", name = "fusion-plasma", amount = 2}
	},
	results = {
		{type = "fluid", name = "fusion-plasma", amount = 1.5},
		{type = "fluid", name = "fluoroketone-hot", amount = 0.45}
	},
}


--@type (LuaAssemblingMachinePrototype)
local assembler = {
	name = assemblerName,
	type = "assembling-machine",
	hidden = true,
	hidden_in_factoriopedia = true,
	energy_source = {
		type = "electric",
		usage_priority = "secondary-input",
		buffer_capacity = "1GJ",
		drain = "10MW"
	},
	energy_usage = "500MW",

	fixed_recipe = Shared.mod_name_prefix .. "internal-plasma-forwarding",
	created_effect = {
		type = "direct",
		action_delivery = {
			type = "instant",
			source_effects = {
					type = "script",
					effect_id = assemblerName
			}
		}
	},
}

local generator_portal_base_entity = table.deepcopy(data.raw.entity["fusion-generator"])
generator_portal_base_entity.name = Shared.base_portal_entity

data:extend{recipe_category, recipe, generator_portal_base_entity}