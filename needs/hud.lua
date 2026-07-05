needs = {}
local huds = {}

needs.scalex = 210
needs.scaley = 70
needs.hunger_offy = -210
needs.thirst_offy = -140

function needs.set(player, type, value)
    local name = player:get_player_name()
    huds[name][type] = huds[name][type] + value
    --print(huds[name][type])
    if huds[name][type] > 100 then
        huds[name][type] = 100
    end
    player:hud_change(huds[name][type.."_txt"], "text", type..": "..huds[name][type])
    player:hud_change(huds[name][type.."_fg"], "offset", {x = needs.scalex * huds[name][type] / 100, y = needs[type.."_offy"]})

    -- if huds[name][type] <= 0 then
    --     player:set_hp(0)
    -- end
end

core.register_on_joinplayer(function(player)
    local C = 100
    huds[player:get_player_name()] = {
        hunger = C,
        hunger_txt = player:hud_add({
            type = "text",
            position = {x = 1, y = 1},
            offset = {x = -70, y = needs.hunger_offy},
            text = "hunger: "..C,
            alignment = {x = -1, y = 0},
        }),
        hunger_bg = player:hud_add({
            type = "image",
            position = {x = 1, y = 1},
            offset = {x = 0, y = needs.hunger_offy},
            text = "hunger.png",
            alignment = {x = -1, y = 0},
            scale = {x = needs.scalex, y = needs.scaley},
            z_index = -100,
        }),
        hunger_fg = player:hud_add({
            type = "image",
            position = {x = 1, y = 1},
            offset = {x = needs.scalex * C / 100, y = needs.hunger_offy},
            text = "fg_stat2.png",
            alignment = {x = -1, y = 0},
            scale = {x = needs.scalex, y = needs.scaley},
            z_index = -90,
        }),
        thirst = C,
        thirst_txt = player:hud_add({
            type = "text",
            position = {x = 1, y = 1},
            offset = {x = -70, y = needs.thirst_offy},
            text = "thirst: "..C,
            alignment = {x = -1, y = 0},
        }),
        thirst_bg = player:hud_add({
            type = "image",
            position = {x = 1, y = 1},
            offset = {x = 0, y = needs.thirst_offy},
            text = "thirst.png",
            alignment = {x = -1, y = 0},
            scale = {x = needs.scalex, y = needs.scaley},
            z_index = -100,
        }),
        thirst_fg = player:hud_add({
            type = "image",
            position = {x = 1, y = 1},
            offset = {x = needs.scalex * C / 100, y = needs.thirst_offy},
            text = "fg_stat2.png",
            alignment = {x = -1, y = 0},
            scale = {x = needs.scalex, y = needs.scaley},
            z_index = -90,
        }),
    }    
end)

local function reduce_hunger()
    for name, data in pairs(huds) do
        if data.hunger > 0 then
            needs.set(core.get_player_by_name(name), "hunger", -1)
        elseif data.hunger <= 0 then
            core.get_player_by_name(name):set_hp(0)
        end
    end
    core.after(120, reduce_hunger)--120
end

local function reduce_thirst()
    for name, data in pairs(huds) do
        if data.thirst > 0 then
            needs.set(core.get_player_by_name(name), "thirst", -1)
        elseif data.thirst <= 0 then
            --core.get_player_by_name(name):set_hp(0)
        end
    end
    core.after(60, reduce_thirst)--60
end

core.register_on_mods_loaded(function()
    reduce_hunger()
    reduce_thirst()
end)

core.register_on_respawnplayer(function(player)
   needs.set(player, "hunger", 100)
   needs.set(player, "thirst", 100)
end)

core.register_on_leaveplayer(function(player)
    huds[player:get_player_name()] = nil
end)