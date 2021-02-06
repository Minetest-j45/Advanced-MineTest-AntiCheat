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
		local reason_with_targetname = param:match(" (.*)")
		local reason = reason_with_targetname:match(" (.*)")

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
