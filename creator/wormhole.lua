local coord = require("util.coordonnee")
local util = require("util.util")


local wormhole = {}

function wormhole.make_worm_hole(star)
    local orbit_distance = 1
    local angle = 5
    orbit_distance = 0
    local distance_from_parent = 7

    local p_angle = coord.angle_convert(star.orientation)
    local parent_position = coord.polaire_to_cart(star.distance, p_angle)

    local c_angle = coord.angle_convert(angle)
    local position = coord.polaire_to_cart(distance_from_parent, c_angle)

    local cart_pos = { x = parent_position.x + position.x, y = parent_position.y + position.y }


    local distance = math.sqrt(cart_pos.x * cart_pos.x + cart_pos.y * cart_pos.y)
    local n_angle = coord.angle_convertf(coord.get_angle_from_cart(cart_pos))


    local worm = {
        local_distance = distance_from_parent,
        local_angle = angle,
        position = position, --cartesian position depuis le centre du graph, avant décalge dans le system
        orbit_distance = orbit_distance,
        is_not_in_route = true,
        moon = true,

        type = "space-location",
        name = "lihop-wormhole",
        localised_name = { "gui.wormhole" },
        localised_description={"gui.wormhole-description"},
        draw_orbit = false,
        distance = distance,
        orientation = n_angle,
        subgroup = star.subgroup,
        order = star.order .. "a",
        magnitude = 1,
        gravity_pull = 100,

        icon = "__SpaceContinuum__/graphics/icons/corps/wormhole/wormhole-icon.png",
        starmap_icon = "__SpaceContinuum__/graphics/icons/corps/wormhole/wormhole.png",
        starmap_icon_size = 512,

        solar_power_in_space = star.solar_power_in_space,

    }
    return worm
end

function wormhole.make_connection(star, wormh)
    local route = {
        type = "space-connection",
        name = star.name .. "-to-" .. wormh.name,
        subgroup = star.subgroup,
        from = star.name,
        to = wormh.name,
        order = "[d]",
        --length = 1000,--40000,
        length = 2000,
        --asteroid_spawn_definitions =asteroid_spawn_definitions
    }
    return route
end

return wormhole
