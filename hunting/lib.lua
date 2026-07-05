function hunting.retaliate(puncher, damage)
    local inv = puncher:get_inventory()
    if inv:contains_item("main", "hunting:leather_armor") then
        damage = damage - 1
    elseif inv:contains_item("main", "hunting:reinforced_leather_armor") then
        damage = damage - 2
    end
    if damage < 1 then
        damage = 1
    end
    damage = math.random(1, damage)
    return damage
end

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