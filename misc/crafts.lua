core.register_craftitem("misc:handle", {
    description = "Handle",
    inventory_image = "handle.png",
})

core.register_craft({
    type = "shapeless",
    output = "misc:handle",
    recipe = {
        "default:stick",
        "default:stick",
    }
})

core.register_craftitem("misc:medium_handle", {
    description = "Handle",
    inventory_image = "medium_handle.png",
})

core.register_craft({
    type = "shapeless",
    output = "misc:medium_handle",
    recipe = {
        "misc:handle",
        "misc:handle",
    }
})

core.register_craftitem("misc:large_handle", {
    description = "Handle",
    inventory_image = "large_handle.png",
})

core.register_craft({
    type = "shapeless",
    output = "misc:large_handle",
    recipe = {
        "misc:medium_handle",
        "misc:medium_handle",
    }
})