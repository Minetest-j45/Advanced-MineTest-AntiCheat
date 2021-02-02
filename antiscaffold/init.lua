minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack, pointed_thing)
        if placer == nil then return end
        if placer:is_player() then
                local playerName = placer:get_player_name()
                local control = placer:get_player_control()
                local pre540 = false

                if control.place == nil then pre540 = true end -- Check for pre 5.4.0 servers

                if pre540 ~= true then
                        if not control.place then
                                minetest.kick_player(placer:get_player_name(), "AMTAC: Scaffold or other abnormal block placement!")
                                minetest.log("[AMTAC]: " .. playerName .. " was caught using scaffold hacks")
                        end
                else
                        if not control.RMB then
                                minetest.kick_player(placer:get_player_name(), "AMTAC: Scaffold or other abnormal block placement!")
                                minetest.log("[AMTAC]: " .. playerName .. " was caught using scaffold hacks")
                        end
                end
        end
end)
