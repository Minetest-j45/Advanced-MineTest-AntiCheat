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

local function fly_check(player)
	local name = player:get_player_name()
	local pos = player:get_pos()
	if not pos then return true end
	if minetest.check_player_privs(name, {fly = true}) then
		return true
	end
	if minetest.get_node(pos).name == "air" and minetest.get_node({x = pos.x, y = pos.y - 1, z = pos.z}).name == "air" then
		local airnodes = minetest.find_nodes_in_area({x = pos.x - 2, y = pos.y - 2, z = pos.z - 2}, {x = pos.x + 2, y = pos.y + 2, z = pos.z + 2}, {"air"})
		local v = player:get_player_velocity()
		if #airnodes >= 125 and v.y >= 0 then
			return false
		end
	end

	return true
end

local function posdel(player)
	if fly_check(player) then
		oldpos[player:get_player_name()] = nil
	else
		minetest.after(3, posdel, player)
	end
end

minetest.register_globalstep(function(dtime)
	local players = minetest.get_connected_players()
	for _, player in ipairs(players) do
		local name = player:get_player_name()
		local pos = player:get_pos()
		if not fly_check(player) then
			if oldpos[name] then
				player:set_pos(oldpos[name])
			end
			amtac.handle_cheater(player, "Fly", {})

			if not oldpos[name] then oldpos[name] = pos end
			minetest.after(3, posdel, player)
		end
	end
end)
