--[[
AMTAC
Copyright (C) 2021  Code-Sploit

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

minetest.register_on_punchplayer(function(player, hitter, time_from_last_punch, tool_capabilities, dir, damage)
	if not hitter or not player then return end
	if not hitter:is_player() or not player:is_player() then return end

	local control = hitter:get_player_control()

	if not control.LMB then
		amtac.handle_cheater(hitter, "Killaura", {})
	end
end)
