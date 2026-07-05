--[[
portion x hunger = total
sardine 1x8=8
mackerel 1x15=15
eel 2x10=20
salmon 3x15=45
halibut 3x15=45
king crab 4x12=48
tuna 4x15=60
swordfish 6x15=90
bugshark 10x20=200
]]

--wield_scale = {x = 1.0, y = 1.0, z = 0.1},

function eat(i, u, pt, h)--itemstack, user, pointed_thing, hunger
    if core.get_modpath("needs") then
        needs.set(u, "hunger", h)
    end
    --return core.do_item_eat(1, nil, i, u, pt)
end

core.register_craftitem("foods:sardine_raw", {
    description = "Raw Sardine",
    inventory_image = "sardine_raw.png",
})
core.register_craftitem("foods:sardine_cooked", {
    description = "Cooked Sardine",
    inventory_image = "sardine_cooked.png",
    on_use = function(i, u, pt)
        eat(i, u, pt, 8)
    end
})
core.register_craft({
    type = "cooking",
    output = "foods:sardine_cooked",
    recipe = "foods:sardine_raw",
    cooktime = 1, -- Time it takes to cook in seconds
})

core.register_craftitem("foods:mackerel_raw", {
    description = "Raw Mackerel",
    inventory_image = "mackerel_raw.png",
})
core.register_craftitem("foods:mackerel_cooked", {
    description = "Cooked Mackerel",
    inventory_image = "mackerel_cooked.png",
    on_use = function(i, u, pt)
        eat(i, u, pt, 15)
    end
})
core.register_craft({
    type = "cooking",
    output = "foods:mackerel_cooked",
    recipe = "foods:mackerel_raw",
    cooktime = 2, -- Time it takes to cook in seconds
})

core.register_craftitem("foods:eel_raw", {
    description = "Raw Eel",
    inventory_image = "eel_raw.png",
})
core.register_craftitem("foods:eel_cooked", {
    description = "Cooked Eel",
    inventory_image = "eel_cooked.png",
    on_use = function(i, u, pt)
        eat(i, u, pt, 10)
    end
})
core.register_craft({
    type = "cooking",
    output = "foods:eel_cooked",
    recipe = "foods:eel_raw",
    cooktime = 4, -- Time it takes to cook in seconds
})

core.register_craftitem("foods:salmon_raw", {
    description = "Raw Salmon",
    inventory_image = "salmon_raw.png",
})
core.register_craftitem("foods:salmon_cooked", {
    description = "Cooked Salmon",
    inventory_image = "salmon_cooked.png",
    on_use = function(i, u, pt)
        eat(i, u, pt, 15)
    end
})
core.register_craft({
    type = "cooking",
    output = "foods:salmon_cooked",
    recipe = "foods:salmon_raw",
    cooktime = 8, -- Time it takes to cook in seconds
})

core.register_craftitem("foods:halibut_raw", {
    description = "Raw Halibut",
    inventory_image = "halibut_raw.png",
})
core.register_craftitem("foods:halibut_cooked", {
    description = "Cooked Halibut",
    inventory_image = "halibut_cooked.png",
    on_use = function(i, u, pt)
        eat(i, u, pt, 15)
    end
})
core.register_craft({
    type = "cooking",
    output = "foods:halibut_cooked",
    recipe = "foods:halibut_raw",
    cooktime = 16, -- Time it takes to cook in seconds
})

core.register_craftitem("foods:king_crab_raw", {
    description = "Raw King Crab",
    inventory_image = "king_crab_raw.png",
})
core.register_craftitem("foods:king_crab_cooked", {
    description = "Cooked King Crab",
    inventory_image = "king_crab_cooked.png",
    on_use = function(i, u, pt)
        eat(i, u, pt, 12)
    end
})
core.register_craft({
    type = "cooking",
    output = "foods:king_crab_cooked",
    recipe = "foods:king_crab_raw",
    cooktime = 32, -- Time it takes to cook in seconds
})

core.register_craftitem("foods:tuna_raw", {
    description = "Raw Tuna",
    inventory_image = "tuna_raw.png",
})
core.register_craftitem("foods:tuna_cooked", {
    description = "Cooked Tuna",
    inventory_image = "tuna_cooked.png",
    on_use = function(i, u, pt)
        eat(i, u, pt, 15)
    end
})
core.register_craft({
    type = "cooking",
    output = "foods:tuna_cooked",
    recipe = "foods:tuna_raw",
    cooktime = 64, -- Time it takes to cook in seconds
})

core.register_craftitem("foods:swordfish_raw", {
    description = "Raw Swordfish",
    inventory_image = "swordfish_raw.png",
})
core.register_craftitem("foods:swordfish_cooked", {
    description = "Cooked Swordfish",
    inventory_image = "swordfish_cooked.png",
    on_use = function(i, u, pt)
        eat(i, u, pt, 15)
    end
})
core.register_craft({
    type = "cooking",
    output = "foods:swordfish_cooked",
    recipe = "foods:swordfish_raw",
    cooktime = 128, -- Time it takes to cook in seconds
})

core.register_craftitem("foods:bugshark_raw", {
    description = "Raw Bugshark",
    inventory_image = "bugshark_raw.png",
})
core.register_craftitem("foods:bugshark_cooked", {
    description = "Cooked Bugshark",
    inventory_image = "bugshark_cooked.png",
    on_use = function(i, u, pt)
        eat(i, u, pt, 20)
    end
})
core.register_craft({
    type = "cooking",
    output = "foods:bugshark_cooked",
    recipe = "foods:bugshark_raw",
    cooktime = 256, -- Time it takes to cook in seconds
})

