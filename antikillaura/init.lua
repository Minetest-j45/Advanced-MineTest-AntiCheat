minetest.register_on_punchplayer(function(player, hitter, time_from_last_punch, tool_capabilities, dir, damage)
        if hitter == nil then return end
        if player == nil then return end
        if not hitter:is_player() then return end
        if not player:is_player() then return end

        local control = hitter:get_player_control()

        if not control.LMB then
                        amtac.handle_cheater(hitter, "Killaura", "kick", {log = true, kill = true, notify_all = true})
        end
end)
