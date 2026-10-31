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
    --timer = 0,
    state = "wander",

    on_step = function(self, dtime, moveresult)
        lib.move(self, dtime, moveresult)
    end,

    on_punch = function(self, puncher, last_punch_time, tool_abilities, dir, dmg)
        lib.punched(self, puncher, last_punch_time, tool_abilities, dir, 1)
    end,

    on_death = function(self, killer)
        -- Get the current position
        local pos = self.object:get_pos()
        
        core.add_item(pos, "hunting:teraphyx_raw")
    end,
})


