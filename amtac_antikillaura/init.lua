minetest.register_on_punchplayer(function(player, hitter, time_from_last_punch, tool_capabilities, dir, damage)
	if not hitter or not player then return end
	if not hitter:is_player() or not player:is_player() then return end

	local control = hitter:get_player_control()

	if not control.LMB then
		amtac.handle_cheater(hitter, "Killaura", {})
	end
end)
