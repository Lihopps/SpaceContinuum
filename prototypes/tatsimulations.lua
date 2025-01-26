local simulations={}

simulations.spidertron={
    init=
    [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "big k"}
    player.teleport({0, 2.5})
    game.simulation.camera_player = player
    game.simulation.camera_zoom = 1
    game.simulation.camera_player_cursor_position = player.position
    game.simulation.camera_alt_info = true
    
    local cargo=nil


    step_1 = function()
        cargo=game.surfaces[1].create_entity{name="cargo-pod-container", position={0,-2}}
        cargo.insert{name="spidertron",amount=1}
        local spider=cargo.get_inventory(defines.inventory.cargo_unit)[1]
        local grid=spider.create_grid()
        grid.clear()
        grid.put{name="fusion-reactor-equipment"}
        grid.put{name="personal-roboport-mk2-equipment"}
        script.on_nth_tick(1, function()
        if true then
          step_2()
        end
      end)
    end

    step_2 = function()
        local count = 60
        script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        cargo.order_deconstruction(player.force)
        step_3()
      end)
    end

    step_3 = function()
        local inv=cargo.get_inventory(defines.inventory.cargo_unit)
		local spider,index=inv.find_item_stack("spidertron")
		if spider then
			local spider_entity=cargo.surface.create_entity{name="spidertron", position=cargo.position,force=cargo.force,item=spider}
			if spider_entity then
				
				--copy grid from item
				spider_entity.grid.clear()
				if spider.grid then 
					for _,equipment in pairs(spider.grid.equipment) do
						spider_entity.grid.put{name=equipment.name, quality=equipment.quality, position=equipment.position}
					end
				end
				inv[index].clear()
				-- add un flying temp par default
				spider_entity.insert({name="temp-bot", count=1})
				-- Put the cargo pod content into the spider newly created
				for i=1,#inv do
					if inv[i].valid_for_read then
						local nbr=spider_entity.insert(inv[i])
						inv[i].count=inv[i].count-nbr
					end
				end
			end
		end
        step_4()
    end

    step_4 = function()
        local count = 60
        script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        reset()
      end)
    end

    reset = function()
      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        game.surfaces[1].clear(true) 
        start()
      end)
    end

    start = function()
      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        step_1()
      end)
    end

    start()
    ]]
}

return simulations