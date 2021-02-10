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

amtac = {}

local version = "v1.0"

function amtac.get_version()
	return version
end

function amtac.warn_player(player, warning)
	minetest.chat_send_player(player:get_player_name(), minetest.colorize("#FF0000", "[AMTAC] Warning: " .. warning))
end

function amtac.kick(player, reason)
	minetest.kick_player(player:get_player_name(), reason)
end

function amtac.ban(player, reason)
	minetest.ban_player(player:get_player_name(), reason)
end

function amtac.notify_all_of_cheater(player, reason)
	minetest.chat_send_all(minetest.colorize("#FF0000", "[AMTAC] " .. player:get_player_name() .. " was caught using " .. reason:lower()))
end

function amtac.handle_cheater(player, reason, options)
	if not player or not reason or not options then return end

	if options.log or options.log == nil then
		minetest.log("action", "[AMTAC] " .. player:get_player_name() .. " was caught using " .. reason:lower())
	end

	if options.kill or options.kill == nil then
		player:set_hp(0)
	end

	if options.notify_all or options.notify_all == nil then
		amtac.notify_all_of_cheater(player, reason)
	end

	if options.kick or options.kick == nil then
		amtac.kick(player, reason)
	else
		amtac.ban(player, reason)
	end
end
