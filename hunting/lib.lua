lib = {}

local function check_nearby_mobs(self)
    local mobs = core.get_objects_inside_radius(self.object:get_pos(), 1)
    for _, mob in ipairs(mobs) do
        if mob ~= self.object then
            mob:remove()
        end
    end
end

local function spawn()
    local players = core.get_connected_players()
    if #players == 0 then return end
    local ppos = players[math.random(#players)]:get_pos()
    local nodes = core.find_nodes_in_area(vector.add(ppos, -10), vector.add(ppos, 10), {"default:dirt_with_grass"})
    if #nodes == 0 then return end
    local spawn_pos = nodes[math.random(#nodes)]
    spawn_pos.y = spawn_pos.y + 1
    core.add_entity(spawn_pos, "hunting:teraphyx")
end

function lib.punched(self, puncher, last_punch_time, tool_abilities, dir, dmg)
    self.state = "chase"
end

function lib.move(self, dtime, moveresult)
    check_nearby_mobs(self)

    if self.state == "wander" then
        self.time = self.time + dtime
        local yaw = self.object:get_yaw()
        local speed = 1      
        local dir_x = math.sin(yaw) * -speed
        local dir_z = math.cos(yaw) * speed
        self.object:set_velocity({
            x = dir_x,
            y= -1,
            z = dir_z
        })

        if self.time >= 5.0 then
            self.time = 0
            local random_yaw = math.random() * (math.pi * 2)
            self.object:set_yaw(random_yaw)
        end
    elseif self.state == "chase" then
        self.object:set_velocity({
            x = 0,
            y= 0,
            z = 0
        })
    end
end

local time = 0
core.register_globalstep(function(dtime)
	time = time + dtime
	if time >= 100 then
		time = 0
		if math.random() < 1.00 then spawn() end
	end
end)