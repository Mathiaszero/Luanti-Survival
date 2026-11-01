core.register_craftitem("fishing:net", {
    description = "Net",
    inventory_image = "net.png",
})

core.register_craft({
    type = "shapeless",
    output = "fishing:net",
    recipe = {
        "farming:string", 
        "farming:string", 
        "farming:string",
    }
})

core.register_craftitem("fishing:long_rod", {
    description = "Long Rod",
    inventory_image = "long_rod.png",
})

core.register_craft({
    --type = "shapeless",
    output = "fishing:long_rod",
    recipe = {
        {"misc:medium_handle", "farming:string", ""},
        {"", "", ""},
        {"", "", ""},
    }
})

core.register_craftitem("fishing:scarfion_fishing_rod", {
    description = "Scarfion Fishing Rod",
    inventory_image = "scarfion_fishing_rod.png",
})