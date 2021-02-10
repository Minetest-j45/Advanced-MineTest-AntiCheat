--[[
AMTAC
Copyright (C) 2021  HimbeerserverDE

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
]]--

local oldpos = {}
local rn = minetest.registered_nodes

local function noclip_check(player)
	local name = player:get_player_name()
	local pos = player:get_pos()
	if not pos then return true end
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
			amtac.handle_cheater(player, "Noclip", {})
		else
			oldpos[name] = player:get_pos()
		end
	end
end)
