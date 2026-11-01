core.register_node("farm:well", {
  description = "Stone Well",
  drawtype = "mesh",
  mesh = "well.obj",
  paramtype = "light",
  groups = {cracky = 1},
  tiles = {
    core.registered_nodes["default:water_source"].tiles[1],
    "default_wood.png",
    "default_stone.png",
    "default_cobble.png"
  },
  collision_box = {type="fixed", fixed={-0.6,-0.5,-0.6,0.6,1.0,0.6}},
  selection_box = {type="fixed", fixed={-0.6,-0.5,-0.6,0.6,1.0,0.6}},
  on_timer = function(pos)

  end,
  on_construct = function(pos)

  end,
})

core.register_craft({
  output = "farm:well",
  recipe = {
    {"default:stone", "default:stone", "farming:straw"},
    {"",  "", ""},
    {"", "", ""},
  }
})
