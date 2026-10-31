lib = {}

-- function lib.punched(self, puncher, last_punch_time, tool_abilities, dir, dmg)
--     puncher:set_hp(puncher:get_hp() - dmg)
-- end


local function try_spawn()
    local players = core.get_connected_players()
    local player = players[math.random(1, #core.get_connected_players())]  --local player = core.localplayer
    local pos = player:get_pos()
    core.add_entity(pos, "hunting:teraphyx") -- spawn teraphyx on node
end

local time = 0
core.register_globalstep(function(dtime)
	time = time + dtime
	if time >= 10 then
		time = 0
		try_spawn()
        --core.chat_send_all("A teraphyx has spawned in the world!")
	end
end)