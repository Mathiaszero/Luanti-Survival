core.register_craftitem("animals:teraphyx", {
    description = "Teraphyx",
    inventory_image = "teraphyx_inv.png",
    
    -- Called when the player uses/right-clicks with the item
    on_use = function(itemstack, user, pointed_thing)
        -- Ensure the player is pointing at a node
        if pointed_thing.type ~= "node" then 
            return itemstack 
        end
        -- Spawn the mob entity (e.g., from the mobs_redo mod)
        local mob = core.add_entity(vector.add(pointed_thing.under, vector.new(0, 1, 0)), "animals:teraphyx")
        -- Optional: reduce the itemstack count by 1 if not in creative mode
        if not core.is_creative_enabled(user:get_player_name()) then
            itemstack:take_item()
        end
        return itemstack
    end,
})

core.register_entity("animals:teraphyx", {
    initial_properties = {
        hp_max = 20,
        physical = true,
        visual = "mesh",
        mesh = "teraphyx.b3d", -- Or a custom 3D model
        textures = {"teraphyx.png"},
        collisionbox = {-0.4, -0.01, -0.4, 0.4, 0.95, 0.4},
    },
    timer = 0,
    on_step = function(self, dtime, moveresult)
        -- Increment the timer by the time since the last step
        self.timer = self.timer + dtime
        -- Apply a constant downward velocity to pull the mob to the ground
        local velocity = self.object:get_velocity()
        velocity.y = -5
        self.object:set_velocity(velocity)
        -- Check if 5 seconds have passed
        if self.timer >= 5.0 then
            self.timer = 0
            -- Generate a random yaw angle (0 to 2 * pi)
            local random_yaw = math.random() * (math.pi * 2)
            -- Set the mob's new facing direction
            self.object:set_yaw(random_yaw)
        end
    end,
})
    