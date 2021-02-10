--[[
AMTAC
Copyright (C) 2021  Zander200-glitch

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

minetest.register_globalstep(function(dtime)
	local speed_limit = tonumber(minetest.settings:get("movement_speed_walk"))
	local players = minetest.get_connected_players()
	for _, player in ipairs(players) do
		local playerVelocity = player:get_player_velocity()

		if math.abs(playerVelocity.x) > speed_limit or math.abs(playerVelocity.z) > speed_limit then
			amtac.handle_cheater(player, "Speed", {})
		end
	end
end)
