minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack, pointed_thing)
	if not placer then return end
	local control = placer:get_player_control()

	if not control.RMB then
		amtac.handle_cheater(placer, "Scaffold", {})
	end
end)
