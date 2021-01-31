minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack, pointed_thing)
        if placer:is_player() then
                local control = placer:get_player_control()
                local pre540 = false

                if control.place == nil then pre540 = true end -- Check for pre 5.4.0 servers

                if pre540 ~= true then
                        if not control.place then
                                minetest.kick_player(placer:get_player_name(), "AMTAC: Scaffold or other abnormal block placement!")
                        end
                else
                        if not control.RMB then
                                minetest.kick_player(placer:get_player_name(), "AMTAC: Scaffold or other abnormal block placement!")
                        end
                end
        end
end)
