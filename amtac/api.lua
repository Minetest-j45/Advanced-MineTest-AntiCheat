amtac = {}

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
