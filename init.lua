--Register special items

minetest.register_craftitem("buried_treasure:feather", {
	description = "feather",
	inventory_image = "buried_treasure_feather.png",
	wield_image = "buried_treasure_feather.png",
	on_use = function(itemstack, user, pointed_thing)
			user = user:get_player_name()
			mana.add_up_to(user, 100)
			itemstack:take_item(1)
			return itemstack
	end,
})

minetest.register_craftitem("buried_treasure:egg", {
	dexcription = "Bird's Egg",
	inventory_image = "egg.png",
	wield_image = "egg.png",
})

--Overrides to "bury" treasure to drop when digging default nodes
minetest.override_item("default:dirt", {
	drop = {
		max_items = 2,
		items = {
			{items = {"default:dirt"}},
			{items = {"bitchange:minecoin 50"}, rarity = 700},
		}
	}	
})

minetest.override_item("default:sand", {
	drop = {
		max_items = 2,
		items = {
			{items = {"default:dirt"}},
			{items = {"bitchange:minecoin 50"}, rarity = 500},
		}
	}	
})

--Add feathers and eggs to drop from leaves
local leaves = {
"default:leaves",
"default:jungleleaves",
"default:pine_needles",
"default:acacia_leaves",
"default:aspen_leaves",
}

local saplings = {
"default:sapling",
"default:junglesapling",
"default:pine_sapling",
"default:acacia_sapling",
"default:aspen_sapling"
}

for i = 1,5 do
	local leaf = leaves[i]
	local sapling = saplings[i]

	minetest.override_item(leaf, {
    		drop = {
				max_items = 3,
				items = {
					{items = {leaf}},
					{items = {sapling}, rarity = 20, },
					{items = {"buried_treasure:feather"}, rarity = 100, },
					{items = {"buried_treasure:egg"}, rarity = 50, },
				}
    		}
	})
end

if minetest.get_modpath("moretrees") ~= nil then
	local moretrees = {
	"beech",
	"apple_tree",
	"oak",
	"sequoia",
	"birch",
	"palm",
	"date_palm",
	"spruce",
	"cedar",
	"poplar",
	"willow",
	"rubber_tree",
	"fir"
	}
	
	for i = 1,13 do
		local moretree = moretrees[i]
	
		minetest.override_item("moretrees:"..moretree.."_leaves", {
			drop = {
				max_items = 3,
				items = {
					{items = {"moretrees:"..moretree.."_leaves"}},
					{items = {"moretrees:"..moretree.."_sapling"}, rarity = 50, },
					{items = {"buried_treasure:feather"}, rarity = 150, },
					{items = {"buried_treasure:egg"}, rarity = 100, },
				}
			}
		})
	end

end
