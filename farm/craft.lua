--core.register_alias("farm:herb", "flowers:chrysanthemum_green")


core.register_on_mods_loaded(function()
    core.override_item("flowers:chrysanthemum_green", {
        description = "Herb"
    })
end)

