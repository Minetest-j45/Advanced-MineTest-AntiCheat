minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack, pointed_thing)
        if placer:is_player() then
                local control = placer:get_player_control()

                if not control.place then
                        minetest.kick_player(placer:get_player_name(), "AMTAC: Scaffold!")
                end
        end
end)
