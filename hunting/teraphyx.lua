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

core.register_entity("hunting:teraphyx", {
    initial_properties = {
        hp_max = 20,
        physical = true,
        visual = "mesh",
        mesh = "teraphyx.b3d", -- Or a custom 3D model
        textures = {"teraphyx.png"},
        collisionbox = {-0.5, -0.01, -0.5, 0.5, 1.2, 0.5},
    },
    time = 0,
    state = "wander",
    target = nil,

    on_step = function(self, dtime, moveresult)
        check_nearby_mobs(self)
        if self.state == "wander" then
            self.time = self.time + dtime
            local vel = core.yaw_to_dir(self.object:get_yaw())
            vel.y = -1
            self.object:set_velocity(vel)
            if self.time >= 5.0 then
                self.time = 0
                self.object:set_yaw(math.random() * math.pi * 2)
            end
        elseif self.state == "chase" then
            local diff = self.target:get_pos() - self.object:get_pos()
            local dir = vector.normalize(vector.new(diff.x, 0, diff.z))
            self.object:set_rotation(dir:dir_to_rotation())
            self.object:set_velocity(vector.new(dir.x * 2, -1, dir.z * 2))
        end
    end,

    on_punch = function(self, puncher, last_punch_time, tool_abilities, dir, dmg)
        self.state = "chase"
        self.target = puncher
    end,

    on_death = function(self, killer)
        local pos = self.object:get_pos()
        core.add_item(pos, "hunting:teraphyx_raw")
    end,
})

local time = 0
core.register_globalstep(function(dtime)
	time = time + dtime
	if time >= 10 then --orig: 100
		time = 0
		if math.random() < 1.00 then spawn() end
	end
end)


