-- core.register_craftitem("farm:compost", {
--     description = "Compost",
--     inventory_image = "compost.png",
-- })

core.register_craft({
    type = "shapeless",
    output = "farming:compost",
    recipe = {
        "default:leaves",
    }
})

core.register_craft({
    type = "shapeless",
    output = "farming:compost",
    recipe = {
        "default:bush_leaves",
    }
})