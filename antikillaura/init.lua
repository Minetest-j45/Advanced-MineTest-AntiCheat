minetest.register_on_punchplayer(function(player, hitter, time_from_last_punch, tool_capabilities, dir, damage)
	local control = hitter:get_player_control()

	if not control.LMB then
		-- TODO: Revert action and increment cheat counter instead of kicking
		minetest.kick_player(hitter:get_player_name(), "[AMTAC]: Killaura")
		minetest.log("[AMTAC]: " .. hitter:get_player_name() .. " was caught using killaura")
	end
end)
