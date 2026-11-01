minetest.register_node("misc:well", {
    description = "Well",
    mesh = "well.glb",
    tiles = {"well.png"},
    paramtype = "light",
    drawtype = "mesh",
    collision_box = {
        type = "fixed",
        fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
    },
    selection_box = {
        type = "fixed",
        fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
    },
})