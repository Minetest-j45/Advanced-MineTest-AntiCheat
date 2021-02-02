minetest.register_on_punchplayer(function(player, hitter, time_from_last_punch, tool_capabilities, dir, damage)
        if hitter == nil then return end
        if player == nil then return end
        if not hitter:is_player() then return end
        if not player:is_player() then return end

        local control = hitter:get_player_control()

        if not control.LMB then
                minetest.kick_player(hitter:get_player_name(), "[AMTAC]: Killaura!")
                minetest.log("[AMTAC]: " .. hitter:get_player_name() .. " was caught using killaura")
        end
end)
