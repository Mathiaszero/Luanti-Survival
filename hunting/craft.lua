core.register_craftitem("hunting:leather", {
    description = "Leather",
    inventory_image = "leather.png",
})

core.register_craft({
    type = "shapeless",
    output = "hunting:leather",
    recipe = {
        "hunting:bento_hide", "hunting:bento_hide", "hunting:bento_hide",
        "hunting:bento_hide", "hunting:bento_hide", "hunting:bento_hide",
        "hunting:bento_hide", "hunting:bento_hide", "hunting:bento_hide"
    }
})

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

core.register_craftitem("hunting:bento", {
    description = "bento",
    inventory_image = "bento_inv.png",
    on_use = function(itemstack, user, pointed_thing)
        if pointed_thing.type ~= "node" then 
            return itemstack 
        end
        local mob = core.add_entity(vector.add(pointed_thing.under, vector.new(0, 1, 0)), "hunting:bento")
        if not core.is_creative_enabled(user:get_player_name()) then
            itemstack:take_item()
        end
        return itemstack
    end,
})

core.register_craftitem("hunting:bento_hide", {
    description = "Bento Hide",
    inventory_image = "bento_hide.png",
})

core.register_craftitem("hunting:rockma", {
    description = "rockma",
    inventory_image = "rockma_inv.png",
    
    on_use = function(itemstack, user, pointed_thing)
        if pointed_thing.type ~= "node" then 
            return itemstack 
        end
        local mob = core.add_entity(vector.add(pointed_thing.under, vector.new(0, 1, 0)), "hunting:rockma")
        if not core.is_creative_enabled(user:get_player_name()) then
            itemstack:take_item()
        end
        return itemstack
    end,
})

core.register_craftitem("hunting:rockma_hide", {
    description = "Rockma Hide",
    inventory_image = "rockma_hide.png",
})

