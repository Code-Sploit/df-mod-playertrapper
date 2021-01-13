local function trap_player(pos)
	minetest.place_node(vector.add(pos, {x = 0, y = 2, z = 0}))
	minetest.place_node(vector.add(pos, {x = 0, y = -0.6, z = 0}))
	minetest.place_node(vector.add(pos, {x = 1, y = 0.4, z = 0}))
	minetest.place_node(vector.add(pos, {x = 1, y = 1.4, z = 0}))
	minetest.place_node(vector.add(pos, {x = -1, y = 0.4, z = 0}))
	minetest.place_node(vector.add(pos, {x = -1, y = 1.4, z = 0}))
	minetest.place_node(vector.add(pos, {x = 0, y = 0.4, z = 1}))
	minetest.place_node(vector.add(pos, {x = 0, y = 1.4, z = 1}))
	minetest.place_node(vector.add(pos, {x = 0, y = 0.4, z = -1}))
	minetest.place_node(vector.add(pos, {x = 0, y = 1.4, z = -1}))
end

minetest.register_globalstep(function()
	local player = minetest.localplayer
	
	if minetest.settings:get_bool("playertrapper") then
		for _, obj in ipairs(minetest.get_objects_inside_radius(player:get_pos(), 7)) do
			local trap_object = true
			
			if obj:is_local_player() or not obj:is_player() then
				trap_object = false
			end

			if trap_object then
				trap_player(obj:get_pos())
			end
		end
	end

end)

minetest.register_cheat("PlayerTrapper", "Combat", "playertrapper")
