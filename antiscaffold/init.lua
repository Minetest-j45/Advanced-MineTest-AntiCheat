register on placenode if not player pointed thing pos = node pos then kick
minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack, pointed_thing))
minetest.kick_player(name, [reason])
