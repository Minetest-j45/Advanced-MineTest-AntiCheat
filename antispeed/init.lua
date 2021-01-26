minetest.register_globalstep(function(dtime)
    local players = minetest.get_connected_players();
        for _,player in pairs(players) do
            if(player) then
                local playerName = player:get_player_name();
                local playerVelocity = player:get_player_velocity()
                if playerVelocity.x > 5 then
                    minetest.kick_player(playerName, "AMTAC: Speed")
                end
                if playerVelocity.x < -5 then
                    minetest.kick_player(playerName, "AMTAC: Speed")
                end
                if playerVelocity.z > 5 then
                    minetest.kick_player(playerName, "AMTAC: Speed")
                end
                if playerVelocity.z < -5 then
                    minetest.kick_player(playerName, "AMTAC: Speed")
                end
            end
		end
end)