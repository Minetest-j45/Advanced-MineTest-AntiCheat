local modpath = minetest.get_modpath("amtac")

if modpath ~= nil then modpath = modpath .. "/" end

dofile(modpath .. "api.lua")
