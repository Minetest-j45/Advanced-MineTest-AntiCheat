local oldpos = {}
local rn = minetest.registered_nodes

local function noclip_check(player)
	local name = player:get_player_name()
	local pos = player:get_pos()
	if minetest.check_player_privs(name, {noclip = true}) then
		return true
	end
	local n1, n2 = minetest.get_node(pos), minetest.get_node({x = pos.x, y = pos.y - 1, z = pos.z})
	if n1.name ~= "air" and rn[n1.name].walkable and not rn[n1.name].liquid and n2.name ~= "air" and rn[n2.name].walkable and not rn[n2.name].liquid then
		return false
	end

	return true
end

minetest.register_globalstep(function(dtime)
	local players = minetest.get_connected_players()
	for _, player in ipairs(players) do
		local name = player:get_player_name()
		local pos = player:get_pos()
		if not noclip_check(player) then
			if oldpos[name] then
				player:set_pos(oldpos[name])
			end
			minetest.log("action", "[AMTAC] Noclip detected for " .. name)
		else
			oldpos[name] = player:get_pos()
		end
	end
end)
