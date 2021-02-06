amtac = {}

local version = "AMTAC V1.0"

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
        minetest.kick_player(player:get_player_name(), reason)
end

function amtac.notify_all_of_cheater(player, reason)
        minetest.chat_send_all(minetest.colorize("#FF0000", "[AMTAC] " .. player:get_player_name() .. " was caught using " .. reason:lower()))
end

function amtac.handle_cheater(player, reason, options)
        if not player or not reason or not options then return end

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

        if options.punishment then
                local punishment = options.punishment

                if punishment == "kick" then
                        amtac.kick(player, reason)
                else
                        amtac.ban(player, reason)
                end
        end
end
