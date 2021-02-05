minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack, pointed_thing)
	if placer == nil then return end
	if placer:is_player() then
		local control = placer:get_player_control()
			
		if not control.RMB then
				amtac.handle_cheater(placer, "Scaffold", {punishment = "kick", log = true, kill = true, notify_all = true})
		end
	end
end)
