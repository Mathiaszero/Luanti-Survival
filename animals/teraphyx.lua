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

core.register_craftitem("animals:teraphyx_raw", {
    description = "Raw Teraphyx Meat",
    inventory_image = "teraphyx_raw.png",
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
        self.timer = self.timer + dtime
        local yaw = self.object:get_yaw() -- Get the current yaw in radians
        local speed = 1           -- Set your desired movement speed
        -- Calculate directional vectors based on yaw
        local dir_x = math.sin(yaw) * -speed
        local dir_z = math.cos(yaw) * speed
        -- Apply the velocity
        self.object:set_velocity({
            x = dir_x,
            y= -1,
            z = dir_z
        })

        if self.timer >= 5.0 then
            self.timer = 0
            -- Generate a random yaw angle (0 to 2 * pi)
            local random_yaw = math.random() * (math.pi * 2)
            -- Set the mob's new facing direction
            self.object:set_yaw(random_yaw)
        end
    end,

    on_death = function(self, killer)
        -- Get the current position
        local pos = self.object:get_pos()
        
        -- Spawn an item stack (e.g., 2 apple items) at the entity's location
        core.add_item(pos, "animals:teraphyx_raw")
    end,
})

core.register_abm({
    label = "Spawn mob on dirt",
    nodenames = {"group:soil"},
    interval = 60, -- Check every 60 seconds
    chance = 8000,  -- 1 in 200 chance to trigger when in range and active
    action = function(pos, node, active_object_count, active_object_count_wider)
        -- Find the block directly above the dirt
        local spawn_pos = {x = pos.x, y = pos.y + 1, z = pos.z}
        
        -- Check if it is air so the mob doesn't spawn inside a block
        local above_node = core.get_node(spawn_pos)
        if above_node and above_node.name == "air" then
            -- Raycast or check for nearby players to limit spawning
            -- This example uses simple line-of-sight/presence check
            
            -- Spawn the mob
            minetest.add_entity(spawn_pos, "animals:teraphyx")
        end
    end
})

--water
-- -- Get the node position at the entity's base
-- local pos = self.object:get_pos()
-- local node = core.get_node(pos)

-- -- Check if the node belongs to the "liquid" group
-- if minetest.get_item_group(node.name, "liquid") ~= 0 then
--     self.object:set_hp(0)
-- end