function animals.retaliate(puncher, damage)
    local max_dmg = damage
    local inv = puncher:get_inventory()
    if inv:contains_item("main", "animals:leather_armor") then
        max_dmg = max_dmg - 1
    elseif inv:contains_item("main", "animals: reinforced_leather_armor") then
        max_dmg = max_dmg - 2
    end
    if max_dmg < 1 then
        max_dmg = 1
    end
    dmg = math.random(1, max_dmg)
    return dmg
end

core.register_craftitem("animals:leather", {
    description = "Leather",
    inventory_image = "leather.png",
})

core.register_craft({
    type = "shapeless",
    output = "animals:leather",
    recipe = {
        "animals:bento_hide", "animals:bento_hide", "animals:bento_hide",
        "animals:bento_hide", "animals:bento_hide", "animals:bento_hide",
        "animals:bento_hide", "animals:bento_hide", "animals:bento_hide"
    }
})