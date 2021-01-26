nodes = {["default:stone"] = false, ["default:cobble"]= false, ["default:dirt"] = false, ["default:sand"]=false,["default:tree"]= false};
moderators = {["Zander_200"]=true};

minetest.register_globalstep(function(dtime)
	local players = minetest.get_connected_players();
		for _,player in pairs(players) do
			local playerName = player:get_player_name();
			local pos = player:getpos();
			if pos.y<0 then pos.y=pos.y+1 end
			local nodename = minetest.get_node(pos).name;
			local clear=true;
			if nodename ~= "air" then  -- check material
				clear = nodes[nodename]; -- test clip
				if clear == nil then clear = true end
			end
			if not clear then -- player inside wall
				player:set_hp(0)
				minetest.kick_player(playerName, "ZanTicheat: NoClip")
			end
		end
end)