minetest.register_privilege("amtac", {
    description = "Can use amatc commands",
    give_to_singleplayer = false,
    give_to_admin = false
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

        if not target or not command or not reason then return end

        local player = minetest.get_player_by_name(target)

        if command == "warn" then
            amtac.warn_player(player, reason)
            
            return true, "[AMTAC] " .. "Warned " .. target
        elseif command == "kick" then
            amtac.kick(player, reason)

            return true, "[AMTAC] " .. "Kicked " .. target
        elseif command == "ban" then
            amtac.ban(player, reason)

            return true, "[AMTAC] " .. "Banned " .. target
        end
    end
})
