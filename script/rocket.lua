local util = require("util.util")

local function clear_cargo(inv,force,message)
    if not inv then return end
    force.print({"gui.cargoprobleme"})
    if message then
        force.print({"gui."..message})
    end
    inv.clear()
end

local function check_cargo_inv(silo,inv,name)
    local item = inv[1]
    if not item.valid_for_read then clear_cargo(inv) end
    
     --satellite pour decouverte
    if item.name=="lihop-satellite" then
        if string.find(name, "edge") then
            local system_name=util.split(name,"-")[5]
            if system_name then
                local force=silo.force
                local techno=prototypes.get_technology_filtered({})["lihop-discovery-lihop-system-"..system_name]
                if techno then
                    if force.technologies["lihop-rocket-silo"].researched then
                        force.technologies[techno.name].researched = true
                        force.print("[technology="..techno.name.."] researched.")
                    end
                end
            end
        end
        return
    end  

    --construction dyson
    if item.name=="lihop-dyson-scaffold-result" then
        if prototypes.space_location[name] then
            if prototypes.space_location[name].surface_properties then
                if prototypes.space_location[name].surface_properties["dyson_sphere_site"]==1 then
                    --c'est ok
                    return
                end
            end
        end
        clear_cargo(inv,silo.force,"not-dyson")
        return
    end

    --item a ioniser
    if item.prototype.rocket_launch_products and #item.prototype.rocket_launch_products>0 then 
        local data = util.split(item.prototype.rocket_launch_products[1].name, "-")
        if #data > 2 then
            if string.find(name, "lihopstar") and data[#data - 1] == "ioning" and data[#data] == "star" then
                return
            elseif string.find(name, "asteroids_belt") and data[#data - 1] == "ioning" and data[#data] == "belt" then
                return      
            else
                clear_cargo(inv,silo.force,"wrong-ionising")
            end
        end
    end

    --dans le doute on delete
    clear_cargo(inv,silo.force)
end

local function on_rocket_launch_ordered2(e)
    if e.rocket and e.rocket.valid and e.rocket_silo then
        if e.rocket.cargo_pod and e.rocket_silo.name == "wc-rocket-silo" then
            local inv = e.rocket.cargo_pod.get_inventory(defines.inventory.cargo_unit)
            if not inv then return end
            local surface = e.rocket_silo.surface
            if surface then
                local platform = surface.platform
                if platform then
                    --plateform donc on check la space_location
                    local sl = platform.space_location
                    if sl then
                        check_cargo_inv(e.rocket_silo,inv,sl.name)
                    end
                else
                    -- sur un surface

                end
            end
        end
    end
end

local rocket = {}

rocket.events = {
    [defines.events.on_rocket_launch_ordered] = on_rocket_launch_ordered2,

}

return rocket
