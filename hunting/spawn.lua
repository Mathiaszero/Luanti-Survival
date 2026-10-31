lib = {}

-- function lib.punched(self, puncher, last_punch_time, tool_abilities, dir, dmg)
--     puncher:set_hp(puncher:get_hp() - dmg)
-- end

-- local function try_spawn()
--     local players = core.get_connected_players()
--     local player = players[math.random(1, #players)]
--     if not player then return end
--     local ppos = player:get_pos()
--     local r = 10
--     local pos1 = {x = ppos.x - r, y = ppos.y - r, z = ppos.z - r}
--     local pos2 = {x = ppos.x + r, y = ppos.y + r, z = ppos.z + r}
--     local nodes = core.find_nodes_in_area(pos1, pos2, {"default:dirt_with_grass"})
--     if #nodes < 1 then return end
--     local node = nodes[math.random(1, #nodes)]
--     node.y = node.y + 1
--     core.add_entity(node, "hunting:teraphyx")
-- end

local function try_spawn()
    local players = core.get_connected_players()
    if #players == 0 then return end
    local ppos = players[math.random(#players)]:get_pos()
    local nodes = core.find_nodes_in_area(vector.add(ppos, -10), vector.add(ppos, 10), {"default:dirt_with_grass"})
    if #nodes == 0 then return end
    local spawn_pos = nodes[math.random(#nodes)]
    spawn_pos.y = spawn_pos.y + 1
    core.add_entity(spawn_pos, "hunting:teraphyx")
end

local time = 0
core.register_globalstep(function(dtime)
	time = time + dtime
	if time >= 1 then
		time = 0
		try_spawn()
        --core.chat_send_all("A teraphyx has spawned in the world!")
	end
end)