minetest.register_globalstep(function(dtime)
	local players = minetest.get_connected_players();
		for _,player in pairs(players) do
			local playerName = player:get_player_name();
			local pos = player:getpos();
            if minetest.get_node({pos.x, pos.y - 1, pos.z}).name ~= "air" then
                if minetest.get_node({pos.x, pos.y - 2, pos.z}).name ~= "air" then
                    if minetest.get_node({pos.x, pos.y - 3, pos.z}).name ~= "air" then
                        if player:get_velocity().y > 0.1 then
                            minetest.kick_player(playerName, "AMTAC: Fly")
                        end
                    end
                end
            end
		end
end)