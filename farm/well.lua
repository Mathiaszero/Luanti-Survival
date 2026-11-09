core.register_node("farm:well", {
  description = "Well",
  drawtype = "mesh",
  mesh = "well.obj",
  paramtype = "light",
  groups = {cracky = 1},
  tiles = {
    core.registered_nodes["default:river_water_source"].tiles[1],
    --"default_wood.png",
    "farming_straw.png",
    "default_tree.png",
    "default_stone.png"
  },
  collision_box = {type="fixed", fixed={-0.6,-0.5,-0.6,0.6,1.0,0.6}},
  selection_box = {type="fixed", fixed={-0.6,-0.5,-0.6,0.6,1.0,0.6}},
  on_timer = function(pos)

  end,
  on_construct = function(pos)
      local meta = core.get_meta(pos)
        meta:set_int("portions", 30)
        meta:set_string("infotext", meta:get_int("portions"))
  end,

  on_punch = function(pos, node, puncher, pointed_thing)
    local meta = core.get_meta(pos)
    if puncher:get_wielded_item():get_name() == "" then
      meta:set_int("portions", meta:get_int("portions") - 1)
      meta:set_string("infotext", meta:get_int("portions"))
    end
    if meta:get_int("portions") <= 0 then
      core.set_node(pos, {name = "air"})
    end
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

core.register_node("farm:test", {
  description = "Test",
  drawtype = "mesh",
  mesh = "test.glb",
  paramtype = "light",
  groups = {cracky = 1},
  tiles = {
    "health.png",
    "compost.png",
    --"top_black.png",
    --"bottom_black.png",
    --"farming_straw.png",
    --"default_tree.png",
    --"default_stone.png"
  },
  collision_box = {type="fixed", fixed={-0.6,-0.5,-0.6,0.6,1.0,0.6}},
  selection_box = {type="fixed", fixed={-0.6,-0.5,-0.6,0.6,1.0,0.6}},
  on_timer = function(pos)
  end,
  on_construct = function(pos)
  end,
  on_punch = function(pos, node, puncher, pointed_thing)
  end,
})

-- core.register_node("farm:test", {
--     description = "Test",
--     drawtype = "plantlike",
--     tiles = {
--       {
--         name = "test.png",
--         align_style = "node",
--         scale = 1.0,
--       }
--     },
--     paramtype = "light",
--     is_ground_content = false,
--     sunlight_propagates = true,
--     sounds = default.node_sound_glass_defaults(),
--     groups = {cracky=1},
-- })

-- core.register_node("farm:test", {
--     description = "Test",
--     drawtype = "plantlike",
--     --drawtype = "plantlike",
--     tiles = {
--         name = "test.png",
--     },
--     paramtype = "light",
--     is_ground_content = false,
--     sunlight_propagates = true,
--     sounds = default.node_sound_glass_defaults(),
--     groups = {cracky=1},
-- })