animals = {}

animals.modpath = core.get_modpath("animals")
dofile(animals.modpath.."/teraphyx.lua")
dofile(animals.modpath.."/rockma.lua")
dofile(animals.modpath.."/bento.lua")
text = "animals mod loaded."
print(text)

core.register_on_joinplayer(function(player)
    local name = player:get_player_name()
    core.chat_send_player(name, text)
end)

--Rockma/rhino
--Teraphyx/oryx
--Den'rai/blue lobster
--Bento/reindeer

--Bugshark/shark
--Mathiasi snail/snail

--Muskox or cow/cow
--Goose or chicken/chicken
--Snow Leopard/cave lynx
