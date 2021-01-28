minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack, pointed_thing)
	if placer then
		if pos ~= pointed_thing.above then
			minetest.swap_node(pos, oldnode)
			return true
		end
	end
end)
