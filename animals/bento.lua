core.register_craftitem("animals:bento", {
    description = "bento",
    inventory_image = "bento_inv.png",
    on_use = function(itemstack, user, pointed_thing)
        if pointed_thing.type ~= "node" then 
            return itemstack 
        end
        local mob = core.add_entity(vector.add(pointed_thing.under, vector.new(0, 1, 0)), "animals:bento")
        if not core.is_creative_enabled(user:get_player_name()) then
            itemstack:take_item()
        end
        return itemstack
    end,
})

core.register_craftitem("animals:bento_raw", {
    description = "Raw bento Meat",
    inventory_image = "bento_raw.png",
})

core.register_entity("animals:bento", {
    initial_properties = {
        hp_max = 20,
        physical = true,
        visual = "mesh",
        mesh = "bento.b3d", 
        textures = {"bento.png"},
        collisionbox = {-0.4, -0.01, -0.4, 0.4, 0.95, 0.4},
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

    on_death = function(self, killer)
        local pos = self.object:get_pos()
        core.add_item(pos, "animals:bento_raw")
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
            minetest.add_entity(spawn_pos, "animals:bento")
        end
    end
})