local ratio = 9 / 5
local rocket_shift = 48
local icons={
    {
        icon="__space-age__/graphics/icons/solar-system-edge.png",
        scale=1
    },
    {
        icon="__SpaceContinuum__/graphics/icons/rocket-silo.png",
        scale=0.8
    },
}


local silo = table.deepcopy(data.raw["rocket-silo"]["rocket-silo"])
silo.minable = { mining_time = 0.1, result = "wc-rocket-silo" }
silo.name = "wc-rocket-silo"
silo.icon =nil
silo.icons=icons
silo.launch_to_space_platforms = false
silo.to_be_inserted_to_rocket_inventory_size = 1
silo.logistic_trash_inventory_size = 1
silo.inventory_size = 1
silo.fixed_recipe = "lihop-rocket-to-part"
silo.rocket_entity = "wc-rocket-silo-rocket"
silo.rocket_parts_required = 1
silo.prefer_packed_cargo_units = true
silo.collision_box = { { -2.2, -2.2 }, { 2.2, 2.2 } }
silo.selection_box = { { -2.5, -2.5 }, { 2.5, 2.5 } }
silo.hole_clipping_box = { { -2.75 / ratio, -1.15 / ratio }, { 2.75 / ratio, 2.25 / ratio } }
silo.surface_conditions = { { property = "gravity", min = 0, max = 1000 } }
silo.shadow_sprite.scale = silo.shadow_sprite.scale / ratio
silo.hole_sprite.scale = silo.hole_sprite.scale / ratio
silo.hole_light_sprite.scale = silo.hole_light_sprite.scale / ratio
silo.rocket_shadow_overlay_sprite.scale = silo.rocket_shadow_overlay_sprite.scale / ratio
silo.rocket_glow_overlay_sprite.scale = silo.rocket_glow_overlay_sprite.scale / ratio
silo.door_back_sprite.scale = silo.door_back_sprite.scale / ratio
silo.door_front_sprite.scale = silo.door_front_sprite.scale / ratio
silo.door_back_open_offset = { 1.8 / ratio, -1.8  * (0.43299225 / ratio) }
silo.door_front_open_offset = { -1.8 / ratio, 1.8  * (0.43299225 / ratio) }
silo.door_back_sprite.shift = util.by_pixel(37 / ratio, 12 / ratio)
silo.door_front_sprite.shift = util.by_pixel(-28 / ratio, 33 / ratio)
silo.base_day_sprite.scale = silo.base_day_sprite.scale / ratio
silo.satellite_animation.scale = silo.satellite_animation.scale / ratio
silo.satellite_animation.shift = util.by_pixel(-100 / ratio, 111 / ratio)
silo.arm_01_back_animation.scale = silo.arm_01_back_animation.scale / ratio
silo.arm_02_right_animation.scale = silo.arm_02_right_animation.scale / ratio
silo.arm_03_front_animation.scale = silo.arm_03_front_animation.scale / ratio
silo.arm_01_back_animation.shift = util.by_pixel(-53 / ratio, -84 / ratio)
silo.arm_02_right_animation.shift = util.by_pixel(101 / ratio, -38 / ratio)
silo.arm_03_front_animation.shift = util.by_pixel(-51 / ratio, 16 / ratio)
silo.base_front_sprite.scale = silo.base_front_sprite.scale / ratio
silo.base_front_sprite.shift = util.by_pixel(-1 / ratio, 78 / ratio)
silo.silo_fade_out_start_distance = 8
silo.silo_fade_out_end_distance = 15

for i = 1, #silo.red_lights_back_sprites.layers do
    --silo.red_lights_back_sprites.layers[i].scale=silo.red_lights_back_sprites.layers[i].scale/ratio
    silo.red_lights_back_sprites.layers[i].shift[1] = (silo.red_lights_back_sprites.layers[i].shift[1] / ratio)
    silo.red_lights_back_sprites.layers[i].shift[2] = silo.red_lights_back_sprites.layers[i].shift[2] / ratio
end
for i = 1, #silo.red_lights_front_sprites.layers do
    --silo.red_lights_front_sprites.layers[i].scale=silo.red_lights_front_sprites.layers[i].scale/ratio
    silo.red_lights_front_sprites.layers[i].shift[1] = (silo.red_lights_front_sprites.layers[i].shift[1] / ratio)
    silo.red_lights_front_sprites.layers[i].shift[2] = silo.red_lights_front_sprites.layers[i].shift[2] / ratio
end


local silo_rocket = table.deepcopy(data.raw["rocket-silo-rocket"]["rocket-silo-rocket"])
silo_rocket.name = "wc-rocket-silo-rocket"
silo_rocket.shadow_slave_entity = "rocket-silo-rocket-shadow"

silo_rocket.rocket_launch_offset = { 0, -256 / ratio }
silo_rocket.rocket_initial_offset = { 0, 3 / ratio }
silo_rocket.rocket_rise_offset = { 0, -2.8 / ratio }
silo_rocket.rocket_launch_offset = { 0, -256 / ratio }
silo_rocket.cargo_attachment_offset = util.by_pixel(0, -63.4 / ratio)
silo_rocket.rocket_render_layer_switch_distance = 9.5 / ratio
silo_rocket.full_render_layer_switch_distance = 11 / ratio
silo_rocket.effects_fade_in_start_distance = 4.5
silo_rocket.effects_fade_in_end_distance = 7.5
silo_rocket.shadow_fade_out_start_ratio = 0.25
silo_rocket.shadow_fade_out_end_ratio = 0.75
silo_rocket.rocket_visible_distance_from_center = 2.75 / ratio
silo_rocket.rocket_above_wires_slice_offset_from_center = -3 / ratio
silo_rocket.rocket_air_object_slice_offset_from_center = -6 / ratio
silo_rocket.rocket_sprite =
{
    layers =
    {
        util.sprite_load("__base__/graphics/entity/rocket-silo/rocket-static-pod",
            {
                dice_y = 4,
                shift = util.by_pixel(0 / ratio, (17.0 + rocket_shift) / ratio),
                scale = 0.5 / ratio
            }),
        util.sprite_load("__base__/graphics/entity/rocket-silo/rocket-static-emission",
            {
                dice_y = 4,
                shift = util.by_pixel(0 / ratio, (17 + rocket_shift) / ratio),
                draw_as_glow = true,
                blend_mode = "additive",
                scale = 0.5 / ratio
            })
    }
}
silo_rocket.rocket_shadow_sprite = util.sprite_load("__base__/graphics/entity/rocket-silo/rocket-static-pod-shadow",
    {
        priority = "medium",
        shift = util.by_pixel(-80 , (-210 + rocket_shift) ),
        draw_as_shadow = true,
        scale = 0.5 / ratio
    })
silo_rocket.rocket_shadow_sprite.shift[1]=silo_rocket.rocket_shadow_sprite.shift[1]/ratio
silo_rocket.rocket_shadow_sprite.shift[2]=silo_rocket.rocket_shadow_sprite.shift[2]/ratio

silo_rocket.rocket_glare_overlay_sprite = util.add_shift_offset(util.by_pixel(0 / ratio, (112 + 112 + rocket_shift) / ratio),
    {
        filename = "__base__/graphics/entity/rocket-silo/03-rocket-over-glare.png",
        blend_mode = "additive",
        width = 481,
        height = 481,
        shift = util.by_pixel(-2 / ratio, -2 / ratio),
        flags = { "linear-magnification", "linear-minification" }
    })

silo_rocket.rocket_smoke_top1_animation = util.add_shift_offset(
    util.by_pixel((0 - 66) / ratio, (-112 + 28 + 232 + 32 + rocket_shift) / ratio),
    {
        filename = "__base__/graphics/entity/rocket-silo/12-rocket-smoke.png",
        priority = "medium",
        tint = { 0.8, 0.8, 1, 0.8 },
        width = 80,
        height = 286,
        frame_count = 24,
        line_length = 8,
        animation_speed = 0.5,
        scale = (1.5 / 2 * 1.3) / ratio,
        shift = util.by_pixel(-1 / ratio, -3 / ratio)
    })
silo_rocket.rocket_smoke_top2_animation = util.add_shift_offset(
    util.by_pixel((0 + 17) / ratio, (-112 + 28 + 265 + 32 + rocket_shift) / ratio),
    {
        filename = "__base__/graphics/entity/rocket-silo/12-rocket-smoke.png",
        priority = "medium",
        tint = { 0.8, 0.8, 1, 0.8 },
        width = 80,
        height = 286,
        frame_count = 24,
        line_length = 8,
        animation_speed = 0.5,
        scale = (1.5 / 2 * 1.3) / ratio,
        shift = util.by_pixel(-1 / ratio, -3 / ratio)
    })
silo_rocket.rocket_smoke_top3_animation = util.add_shift_offset(
    util.by_pixel((0 + 48) / ratio, (-112 + 28 + 252 + 32 + rocket_shift) / ratio),
    {
        filename = "__base__/graphics/entity/rocket-silo/12-rocket-smoke.png",
        priority = "medium",
        tint = { 0.8, 0.8, 1, 0.8 },
        width = 80,
        height = 286,
        frame_count = 24,
        line_length = 8,
        animation_speed = 0.5,
        scale = (1.5 / 2 * 1.3) / ratio,
        shift = util.by_pixel(-1 / ratio, -3 / ratio)
    })

silo_rocket.rocket_smoke_bottom1_animation = util.add_shift_offset(
    util.by_pixel((0 - 69) / ratio, (-112 + 28 + 205 + 32 +
        rocket_shift) / ratio),
    {
        filename = "__base__/graphics/entity/rocket-silo/12-rocket-smoke.png",
        priority = "medium",
        tint = { 0.8, 0.8, 1, 0.7 },
        width = 80,
        height = 286,
        frame_count = 24,
        line_length = 8,
        animation_speed = 0.5,
        scale = (1.5 / 2 * 1.3) / ratio,
        shift = util.by_pixel(-1 / ratio, -3 / ratio)
    })
silo_rocket.rocket_smoke_bottom2_animation = util.add_shift_offset(
    util.by_pixel((0 + 62) / ratio, (-112 + 28 + 207 + 32 +
        rocket_shift) / ratio),
    {
        filename = "__base__/graphics/entity/rocket-silo/12-rocket-smoke.png",
        priority = "medium",
        tint = { 0.8, 0.8, 1, 0.7 },
        width = 80,
        height = 286,
        frame_count = 24,
        line_length = 8,
        animation_speed = 0.5,
        scale = (1.5 / 2 * 1.3) / ratio,
        shift = util.by_pixel(-1 / ratio, -3 / ratio)
    })
silo_rocket.rocket_flame_animation = util.sprite_load("__base__/graphics/entity/rocket-silo/rocket-jet",
    {
        shift = util.by_pixel( 0, 17+rocket_shift),
        draw_as_glow = true,
        blend_mode = "additive",
        scale = 0.5 / ratio,
        frame_count = 8,
        animation_speed = 0.5
    })
silo_rocket.rocket_flame_animation.shift[1]=silo_rocket.rocket_flame_animation.shift[1]/ratio
silo_rocket.rocket_flame_animation.shift[2]=silo_rocket.rocket_flame_animation.shift[2]/ratio


local silo_item = table.deepcopy(data.raw["item"]["rocket-silo"])
silo_item.name = "wc-rocket-silo"
silo_item.icon = nil
silo_item.icons=icons
silo_item.icon_size = 64
silo_item.place_result = "wc-rocket-silo"

local silo_recipe = table.deepcopy(data.raw["recipe"]["rocket-silo"])
silo_recipe.enabled = lihop_debug
silo_recipe.name = "wc-rocket-silo"
silo_recipe.results = { { type = "item", name = "wc-rocket-silo", amount = 1 } }
for _,ingredient in pairs(silo_recipe.ingredients) do
    ingredient.amount=ingredient.amount/2
end

data:extend({ silo_item, silo_recipe, silo, silo_rocket })
