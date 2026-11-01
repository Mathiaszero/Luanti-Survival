core.register_node("farm:compost", {
    description = "Compost",
    
    -- Textures applied to the 6 faces of the cube
    -- Place your 16x16 PNG image in your mod's /textures/ folder
    tiles = {"compost.png"}, 
    
    -- Determines how the block behaves when broken by tools
    groups = {
        crumbly = 3, -- 3 means it's easily dug up by hands and shovels
        soil = 1,    -- Allows plants/saplings to be placed on it
    },
    
    -- Uses the built-in game sound logic for dirt blocks
    sounds = default.node_sound_dirt_defaults(),
})