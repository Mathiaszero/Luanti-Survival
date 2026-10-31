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