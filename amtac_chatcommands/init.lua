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

minetest.register_privilege("amtac", {
	description = "Can use amatc commands",
	give_to_singleplayer = false,
	give_to_admin = false,
})

minetest.register_chatcommand("amtac", {
	description = "Commands for your Anticheat Bot",
	params = "<command> <target> <reason>",
	privs = {amtac = true},
	func = function(name, param)
		local command = param:split(" ")[1]
		local target = param:split(" ")[2]
		local reason = param:match(" %a* (.*)")

		local player = minetest.get_player_by_name(target)
		if not target or not command or not reason or not player then return end

		if command == "warn" then
			amtac.warn_player(player, reason)
			return true, "Warned " .. target
		elseif command == "kick" then
			amtac.kick(player, reason)
			return true, "Kicked " .. target
		elseif command == "ban" then
			amtac.ban(player, reason)
			return true, "Banned " .. target
		end
	end,
})
