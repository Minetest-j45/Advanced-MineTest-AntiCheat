local oldpos = {}

local function noclip_check(player)
	local name = player:get_player_name()
	local pos = player:get_pos()
	if minetest.check_player_privs(name, {noclip = true}) then
		return true
	end
	if minetest.get_node(pos).name ~= "air" and minetest.get_node({x = pos.x, y = pos.y - 1, z = pos.z}).name ~= "air" then
		local v = player:get_velocity()
		if v.x ~= 0 or v.y ~= 0 or v.z ~= 0 then
			return false
		end
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
