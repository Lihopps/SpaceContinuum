--Just a copy pas of VISIBLE PLANET for use in data-final-fixes stage (with one tweak for icons)
--https://mods.factorio.com/mod/visible-planets

local visible = {}

local sprite_goal_size = 512
local planet_overrides = {} --vp_get_planet_overrides() -- Defined in separate file
function visible.create_planet_sprite_prototype(planet)
    local icon = planet.starmap_icon
    local icons = planet.starmap_icons
    local icon_size = planet.starmap_icon_size
    local scale_override = 1; -- Default change nothing.
    local overrides = planet_overrides[planet.name]
    if overrides then         -- Handle overrides, if any.
        if overrides.filepath then
            log("Overriding filepath for " .. planet.name .. " to " .. overrides.filepath)
            icon = overrides.filepath
            icon_size = overrides.size
        end
        if overrides.scale then
            log("Overriding scale for " .. planet.name .. " to " .. overrides.scale)
            scale_override = overrides.scale
        end
    end
    if not icon and not icons then
        log("Skipping visible-planets for " .. planet.name .. "; Starmap icon missing.")
        return
    end
    -- Create SpritePrototype
    log("Adding visible-planets for " .. planet.name)
    local name = "visible-planets-" .. planet.name

    if not icons then
        local sprite_prototype = {
            type = "sprite",
            name = name,
            filename = icon,
            size = icon_size,
            scale = scale_override * (sprite_goal_size / icon_size), -- Scale down large sprites. Shouldn't reduce resolution.
            -- mipmap_count = 1,
            flags = { "linear-minification", "linear-magnification" }, -- Prevent pixels showing.
        }
        data:extend { sprite_prototype }
    else
        local sprite_prototype = {
            type = "sprite",
            name = name,
            layers={
                {
                    filename = icons[1].icon,
                    size = icons[1].icon_size,
                    tint=icons[1].tint,
                    scale = scale_override * (sprite_goal_size / icons[1].icon_size), -- Scale down large sprites. Shouldn't reduce resolution.
                    -- mipmap_count = 1,
                    flags = { "linear-minification", "linear-magnification" }, -- Prevent pixels showing.
                }
            }
            
        }
        data:extend { sprite_prototype }
    end
end

return visible
