minetest.register_globalstep(function(dtime)
    local SpeedLimit = minetest.settings:get("movement_speed_walk")
    local players = minetest.get_connected_players()
        for _,player in pairs(players) do
            if(player) then
                local playerVelocity = player:get_player_velocity()
				
                if playerVelocity.x > SpeedLimit or playerVelocity.x < -SpeedLimit or playerVelocity.z > SpeedLimit or playerVelocity.z < -SpeedLimit then
			amtac.handle_cheater(player, "Speed", {punishment = "kick", log = true, kill = true, notify_all = true})
		end
            end
		end
end)
