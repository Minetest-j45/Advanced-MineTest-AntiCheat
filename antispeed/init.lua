minetest.register_globalstep(function(dtime)
    local SpeedLimit = 1
    local players = minetest.get_connected_players();
        for _,player in pairs(players) do
            if(player) then
                local playerName = player:get_player_name();
                local playerVelocity = player:get_player_velocity()
                if playerVelocity.x > SpeedLimit then
                    minetest.kick_player(playerName, "AMTAC: Speed")
		    minetest.log("[AMTAC]: " .. playerName .. " was caught using speed hacks")
                end
                if playerVelocity.x < -SpeedLimit then
                    minetest.kick_player(playerName, "AMTAC: Speed")
		    minetest.log("[AMTAC]: " .. playerName .. " was caught using speed hacks")
                end
                if playerVelocity.z > SpeedLimit then
                    minetest.kick_player(playerName, "AMTAC: Speed")
		    minetest.log("[AMTAC]: " .. playerName .. " was caught using speed hacks")
                end
                if playerVelocity.z < -SpeedLimit then
                    minetest.kick_player(playerName, "AMTAC: Speed")
		    minetest.log("[AMTAC]: " .. playerName .. " was caught using speed hacks")
                end
            end
		end
end)
