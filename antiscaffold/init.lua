minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack, pointed_thing)
    if not placer then return end
    if not pos == pointed_thing.under
        minetest.kick_player(placer:get_player_name(), "Kicked " .. placer:get_player_name() .. " for using scaffold hacks.")
    end
end)
