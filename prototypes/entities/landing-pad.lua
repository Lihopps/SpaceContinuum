local ratio = 1/2

landing_pad = table.deepcopy(data.raw["cargo-landing-pad"]["cargo-landing-pad"])
landing_pad.minable = { mining_time = 0.1, result = "wc-cargo-landing-pad" }
landing_pad.name = "wc-cargo-landing-pad"
landing_pad.launch_to_space_platforms = false
landing_pad.collision_box = {{-3.9, -3.9}, {3.9, 3.9}}
landing_pad.selection_box = {{-4, -4}, {4, 4}}
landing_pad.icon = "__SpaceContinuum__/graphics/entity/landingpad/cargo-landing-pad.png"
landing_pad.icon_size = 64
landing_pad.build_grid_size = 1
landing_pad.surface_conditions = { { property = "gravity", min = 0, max = 0 } }
landing_pad.graphics_set.water_reflection=nil
landing_pad.robot_animation = nil
landing_pad.radar_range = 0
landing_pad.graphics_set.picture[4] = {
    render_layer = "object",
    layers =
    {
        util.sprite_load("__SpaceContinuum__/graphics/entity/landingpad/platform-hub-3",
            {
                scale = 0.5,
                shift = { 0, -1 }
            }),
        util.sprite_load("__base__/graphics/entity/cargo-hubs/hubs/planet-hub-shadow",
            {
                scale = 0.5,
                shift = { 8, 0 },
                draw_as_shadow = true
            }),
        util.sprite_load("__base__/graphics/entity/cargo-hubs/hubs/planet-hub-emission-A",
            {
                scale = 0.5,
                shift = { 0, -1 },
                draw_as_glow = true,
                blend_mode = "additive"
            }),
        util.sprite_load("__base__/graphics/entity/cargo-hubs/hubs/planet-hub-emission-C",
            {
                scale = 0.5,
                shift = { 0, -1 },
                draw_as_glow = true,
                blend_mode = "additive"
            }),
    }
}
landing_pad.cargo_station_parameters.giga_hatch_definitions[1].hatch_graphics_back={
    layers =
    {
    util.sprite_load("__SpaceContinuum__/graphics/entity/landingpad/planet-upper-hatch-back",
      {
        scale = 0.5,
        shift = {0, -0.5},
        run_mode = "forward",
        frame_count = 20
      }),
    util.sprite_load("__base__/graphics/entity/cargo-hubs/hatches/shared-upper-hatch-shadow",
      {
        scale = 0.5,
        shift = {4,-0.5}, --util.by_pixel(128, 0)
        run_mode = "forward",
        draw_as_shadow = true,
        frame_count = 20
      }),
    util.sprite_load("__base__/graphics/entity/cargo-hubs/hatches/shared-upper-back-hatch-emission",
      {
        scale = 0.5,
        shift = {0, -0.5},
        run_mode = "forward",
        draw_as_glow = true,
        blend_mode = "additive",
        frame_count = 20
      }),
    util.sprite_load("__base__/graphics/entity/cargo-hubs/hatches/planet-upper-front-hatch-emission",
      {
        scale = 0.5,
        shift = {0, -0.5},
        run_mode = "forward",
        draw_as_glow = true,
        blend_mode = "additive",
        frame_count = 3,
        frame_sequence = {1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3}
      })
    }
  }

landing_pad.cargo_station_parameters.giga_hatch_definitions[1].hatch_graphics_front={
    layers =
    {
    util.sprite_load("__SpaceContinuum__/graphics/entity/landingpad/planet-upper-hatch-front",
      {
        scale = 0.5,
        shift = {0, -0.5},
        run_mode = "forward",
        frame_count = 20
      })
    }
  }
-- for i=1,#landing_pad.graphics_set.picture do
--     for j=1,#landing_pad.graphics_set.picture[i].layers do
--         landing_pad.graphics_set.picture[i].layers[j].scale=landing_pad.graphics_set.picture[i].layers[j].scale*ratio
--     end
-- end

-- for i=1,#landing_pad.graphics_set.animation.layers do
--     landing_pad.graphics_set.animation.layers[i].scale=landing_pad.graphics_set.animation.layers[i].scale*ratio
-- end


-- for name,connection in pairs(landing_pad.graphics_set.connections) do
--     for i=1,#connection do
--         for j=1,#connection[i] do
--             --log(serpent.block(connection[i][j]))
--             if connection[i][j].layers then
--                 for k=1,#connection[i][j].layers do
--                     connection[i][j].layers[k].scale=connection[i][j].layers[k].scale*ratio
--                 end
--             else
--                 connection[i][j].scale=connection[i][j].scale*ratio
--             end
--         end
--     end
-- end


landing_pad_item = table.deepcopy(data.raw["item"]["cargo-landing-pad"])
landing_pad_item.name = "wc-cargo-landing-pad"
landing_pad_item.icon = "__SpaceContinuum__/graphics/entity/landingpad/cargo-landing-pad.png"
landing_pad_item.icon_size = 64
landing_pad_item.place_result = "wc-cargo-landing-pad"

landing_pad_recipe = table.deepcopy(data.raw["recipe"]["cargo-landing-pad"])
landing_pad_recipe.enabled = lihop_debug
landing_pad_recipe.name = "wc-cargo-landing-pad"
landing_pad_recipe.results = { { type = "item", name = "wc-cargo-landing-pad", amount = 1 } }

data:extend({ landing_pad_item, landing_pad_recipe, landing_pad })
