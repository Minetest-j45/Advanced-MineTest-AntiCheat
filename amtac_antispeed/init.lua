minetest.register_globalstep(function(dtime)
	local speed_limit = tonumber(minetest.settings:get("movement_speed_walk"))
	local players = minetest.get_connected_players()
	for _, player in ipairs(players) do
		local playerVelocity = player:get_player_velocity()

		if math.abs(playerVelocity.x) > speed_limit or math.abs(playerVelocity.z) > speed_limit then
			amtac.handle_cheater(player, "Speed", {})
		end
	end
end)
