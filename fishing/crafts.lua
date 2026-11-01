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