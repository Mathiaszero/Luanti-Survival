function animals.retaliate(puncher, damage)
    local inv = puncher:get_inventory()
    if inv:contains_item("main", "animals:leather_armor") then
        damage = damage - 1
    elseif inv:contains_item("main", "animals:reinforced_leather_armor") then
        damage = damage - 2
    end
    if damage < 1 then
        damage = 1
    end
    damage = math.random(1, damage)
    return damage
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