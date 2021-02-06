minetest.register_privilege("amtac", {
    description = "Can use amatc commands",
    give_to_singleplayer = false,
    give_to_admin = false
})

minetest.register_chatcommand("amtac_warn", {
    description = "Warn a player",
    params = "<player> <message>",
    privs = {amtac = true},

    func = function(name, param)
        local player = param:split(" ")[1]
        local message = param:match(" (.*)")

        if not player or not message then return end

        local player_data = minetest.get_player_by_name(player)

        amtac.warn_player(player_data, message)

        return true, "[AMTAC] " .. "Warned " .. player
    end
})
