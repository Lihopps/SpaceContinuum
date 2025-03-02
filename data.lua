lihop_debug=false
lihop_speed=true

require("util.randomlua")


require("categories.group")
require("prototypes.technologies")
require("prototypes.entities.entities")
require("prototypes.items.items")
require("prototypes.fluids.fluids")
require("prototypes.resources.resource")


require("prototypes.tipsandtrick")


worldCreation_planet_graphics={}
worldCreation_gazeous_field={light={},heavy={}}
worldCreation_modded_planets={}
worldCreation_planets={}

---Add graphics set for planet type like
---@param name string : name of the planet type like (ex : vulcanus)
---@param icon string : path to the file
---@param starmap_icon string : path to the file
---@param starmap_icon_size number : size of the starmap_icon
function sc_add_graphics_asset(name,icon,starmap_icon,starmap_icon_size)
    
    if not worldCreation_planet_graphics[name] then
        worldCreation_planet_graphics[name]={}
    end
    table.insert(worldCreation_planet_graphics[name],{
        icon=icon,
        starmap_icon=starmap_icon or icon,
        starmap_icon_size=starmap_icon_size
    })
end

---Add graphics set for planet type like 
---@param name string : FluidID
---@param type string : light or heavy (juste one type by planet)
function sc_add_gazeous_field(type,name)
    table.insert(worldCreation_gazeous_field[type],name)
end


--add basemod like planet graphics
local base_planet = {"gazeous","asteroids_belt"}--"vulcanus","gleba","nauvis","fulgora","aquilo"}
for _,name in pairs(base_planet) do
    for i=1,1 do
        local base="__SpaceContinuum__/graphics/icons/corps/"..name.."/icon-"
        sc_add_graphics_asset(name,base..i..".png",base..i.."-starmap.png",512)
    end
end

local gazeous_fiel={
    water="heavy",
    ["sulfuric-acid"]="heavy",
    ["lithium-brine"]="heavy",
    
    steam="light",
    ammonia="light",
    fluorine="light",
   
}
for name,type in pairs(gazeous_fiel) do
    sc_add_gazeous_field(type,name)
end

data.raw["space-location"]["solar-system-edge"].localised_description=nil

