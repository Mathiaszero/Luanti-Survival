core.register_craftitem("animals:teraphyx", {
    description = "Teraphyx",
    inventory_image = "teraphyx_inv.png",
    
    on_use = function(itemstack, user, pointed_thing)
        if pointed_thing.type ~= "node" then 
            return itemstack 
        end
        local mob = core.add_entity(vector.add(pointed_thing.under, vector.new(0, 1, 0)), "animals:teraphyx")
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

    on_deactivate = function(self, removal)
        if removal then
            -- Object was explicitly deleted
        else
            -- Mapblock containing the entity was unloaded
            self.object:remove()
        end
    end,

    on_punch = function(self, puncher, time_from_last_punch, tool_capabilities, dir, damage)
        dmg = animals.retaliate(puncher, 3) 
        puncher:set_hp(puncher:get_hp() - dmg)
    end,

    on_death = function(self, killer)
        -- Get the current position
        local pos = self.object:get_pos()
        
        core.add_item(pos, "animals:teraphyx_raw")
    end,
})

core.register_abm({
    label = "Spawn mob on dirt",
    nodenames = {"group:soil"},
    interval = 60, 
    chance = 8000,  
    action = function(pos, node, active_object_count, active_object_count_wider)
        local spawn_pos = {x = pos.x, y = pos.y + 1, z = pos.z}
        
        local above_node = core.get_node(spawn_pos)
        if above_node and above_node.name == "air" then
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