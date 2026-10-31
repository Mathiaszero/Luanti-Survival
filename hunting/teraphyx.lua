core.register_craftitem("hunting:teraphyx", {
    description = "Teraphyx",
    inventory_image = "teraphyx_inv.png",
    
    on_use = function(itemstack, user, pointed_thing)
        if pointed_thing.type ~= "node" then 
            return itemstack 
        end
        local mob = core.add_entity(vector.add(pointed_thing.under, vector.new(0, 1, 0)), "hunting:teraphyx")
        if not core.is_creative_enabled(user:get_player_name()) then
            itemstack:take_item()
        end
        return itemstack
    end,
})

core.register_craftitem("hunting:teraphyx_raw", {
    description = "Raw Teraphyx Meat",
    inventory_image = "teraphyx_raw.png",
})

core.register_entity("hunting:teraphyx", {
    initial_properties = {
        hp_max = 20,
        physical = true,
        visual = "mesh",
        mesh = "teraphyx.b3d", -- Or a custom 3D model
        textures = {"teraphyx.png"},
        collisionbox = {-0.5, -0.01, -0.5, 0.5, 1.2, 0.5},
    },
    timer = 0,

    on_step = function(self, dtime, moveresult)
        self.timer = self.timer + dtime
        local yaw = self.object:get_yaw()
        local speed = 1      
        local dir_x = math.sin(yaw) * -speed
        local dir_z = math.cos(yaw) * speed
        self.object:set_velocity({
            x = dir_x,
            y= -1,
            z = dir_z
        })

        if self.timer >= 5.0 then
            self.timer = 0
            local random_yaw = math.random() * (math.pi * 2)
            self.object:set_yaw(random_yaw)
        end
    end,

    on_punch = function(self, puncher, last_punch_time, tool_abilities, dir, dmg)
        --lib.punched(self, puncher, last_punch_time, tool_abilities, dir, 3)
    end,

    on_death = function(self, killer)
        -- Get the current position
        local pos = self.object:get_pos()
        
        core.add_item(pos, "hunting:teraphyx_raw")
    end,
})


