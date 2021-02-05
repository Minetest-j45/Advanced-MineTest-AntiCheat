amtac = {}

function amtac.kick(player, reason)
        minetest.kick_player(player:get_player_name(), reason)
end

function amtac.ban(player, reason)
        minetest.kick_player(player:get_player_name(), reason)
        minetest.ban_player(player:get_player_name(), reason)
end

function amtac.notify_all_of_cheater(player, reason)
        minetest.chat_send_all(player:get_player_name() .. " was caught using " .. reason:lower())
end

function amtac.handle_cheater(player, reason, punishment, options)
        if not player or not reason or not punishment then return end

        if punishment == "kick" then
                amtac.kick(player, "AMTAC: " .. reason)

                if options.log then
                        minetest.log("action", "AMTAC " .. player:get_player_name() .. " was caught using " .. reason:lower())
                end

                if options.kill then
                        player:set_hp(0)
                end

                if options.notify_all then
                        amtac.notify_all_of_cheater(player, reason)
                end
        else
                amtac.ban(player, "AMTAC: " .. reason)
        end
end