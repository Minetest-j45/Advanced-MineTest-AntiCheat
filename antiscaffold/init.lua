minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack, pointed_thing)
	if placer == nil then return end
	if placer:is_player() then
		local playerName = placer:get_player_name()
		local control = placer:get_player_control()
			
		if not control.RMB then
			minetest.kick_player(placer:get_player_name(), "AMTAC: Scaffold or other abnormal block placement!")
			minetest.log("action", "[AMTAC]: " .. playerName .. " was caught using scaffold hacks")
		end
	end
end)
