minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack, pointed_thing)
    if not placer then return end
    print("pos: " .. " " .. pos.x .. " " .. pos.y .. " " .. pos.z)
    print("pt: " .. pointed_thing.above.x .. " " .. pointed_thing.above.y .. " " .. pointed_thing.above.z)
    if not pos == pointed_thing.above then
        minetest.kick_player(placer:get_player_name(), "AMTAC: Scaffold")
    end
end)
