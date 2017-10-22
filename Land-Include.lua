--Define game time

function initialize_job()
	
	daytime = world.time <= (18*60) and world.time >= (6*60)
	duskdawn = (world.time >= (17*60) and world.time <= (18*60)) and (world.time >= (6*60) and world.time <= (7*60))
	
	select_default_macro_book()
	
	windower.register_event('zone change', 
	function(new, old)
		send_command('gs c update')
		if player.main_job == 'WHM' and not areas.Cities:contains(world.area) then
		send_command('wait 3;input /ja "Afflatus Solace" <me>;wait 1.2;input /ja "Light Arts" <me>')
		end
	end)
	
	windower.register_event('time change', 
	function(new, old)
		if new == (17*60) or new == (18*60) or new == (6*60) or new == (7*60) then
			if new == (17*60) then
				duskdawn = true
			elseif new == (18*60) then
				daytime = false
			elseif new == (6*60) then
				daytime = true
			elseif new == (7*60) then
				duskdawn = false
			end
			if not midaction() then
				send_command('gs c update')
			else
				add_to_chat('Time change midaction.')
			end
		end
	end)
	
end

--Job books
function select_default_macro_book()
        -- Dark Knight
	if player.main_job == 'DRK' then
	    if player.sub_job == 'SAM' then
	    	set_macro_page(1, 1)
		add_to_chat('Main job DRK: Macro Book 1.')
		add_to_chat('Sub job SAM: Macro Page 1.')
	    elseif player.sub_job == 'NIN' then
	    	set_macro_page(3, 1)
		add_to_chat('Main job DRK: Macro Book 1.')
		add_to_chat('Sub job NIN: Macro Page 3.')
		end
	end

        -- Ranger
	if player.main_job == 'RNG' then
	    if player.sub_job == 'SAM' then
	    	set_macro_page(1, 2)
		add_to_chat('Main job RNG: Macro Book 1.')
		add_to_chat('Sub job SAM: Macro Page 1.')
	    elseif player.sub_job == 'NIN' then
	    	set_macro_page(3, 2)
		add_to_chat('Main job RNG: Macro Book 1.')
		add_to_chat('Sub job NIN: Macro Page 3.')
		end
	end
	
        -- Warrior
	if player.main_job == 'WAR' then
	    if player.sub_job == 'SAM' then
	    	set_macro_page(1, 3)
		add_to_chat('Main job WAR: Macro Book 1.')
		add_to_chat('Sub job SAM: Macro Page 1.')
	    elseif player.sub_job == 'NIN' then
	    	set_macro_page(3, 3)
		add_to_chat('Main job WAR: Macro Book 1.')
		add_to_chat('Sub job NIN: Macro Page 3.')
		end
	end
	
        -- Paladin
	if player.main_job == 'PLD' then
	    if player.sub_job == 'WAR' then
	    	set_macro_page(1, 4)
		add_to_chat('Main job PLD: Macro Book 1.')
		add_to_chat('Sub job WAR: Macro Page 1.')
	    elseif player.sub_job == 'NIN' then
	    	set_macro_page(1, 4)
		add_to_chat('Main job PLD: Macro Book 1.')
		add_to_chat('Sub job NIN: Macro Page 3.')
		end
	end

        -- Bard
	if player.main_job == 'BRD' then
	    if player.sub_job == 'WHM' then
	    	set_macro_page(1, 1)
		add_to_chat('Main job BRD: Macro Book 1.')
		add_to_chat('Sub job WHM: Macro Page 1.')
	    elseif player.sub_job == 'NIN' then
	    	set_macro_page(1, 1)
		add_to_chat('Main job BRD: Macro Book 1.')
		add_to_chat('Sub job NIN: Macro Page 3.')
		end
	end

        -- White Mage
	if player.main_job == 'WHM' then
	    if player.sub_job == 'SCH' then
	    	set_macro_page(1, 2)
		add_to_chat('Main job WHM: Macro Book 1.')
		add_to_chat('Sub job SCH: Macro Page 1.')
	    elseif player.sub_job == 'BLM' then
	    	set_macro_page(1, 2)
		add_to_chat('Main job WHM: Macro Book 1.')
		add_to_chat('Sub job BLM: Macro Page 3.')
		end
	end
	
        -- Black Mage
	if player.main_job == 'BLM' then
	    if player.sub_job == 'THF' then
	    	set_macro_page(1, 3)
		add_to_chat('Main job BLM: Macro Book 1.')
		add_to_chat('Sub job THF: Macro Page 1.')
	    elseif player.sub_job == 'RDM' then
	    	set_macro_page(1, 3)
		add_to_chat('Main job BLM: Macro Book 1.')
		add_to_chat('Sub job RDM: Macro Page 3.')
		end
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Sleep
-------------------------------------------------------------------------------------------------------------------
function sleep_swap(name,gain)

    local neckpiece

    if name == 'sleep' then
        if gain then
            if player.main_job == 'WAR' or player.main_job == 'PLD' or player.main_job == 'DRK' or player.main_job == 'SAM' or player.main_job == 'DRG' then
                neckpiece='Berserker\'s torque'
				add_to_chat("Equipping Berserker Torque")
            else
                neckpiece='Opo-opo necklace'
				add_to_chat("Equipping Opo-opo Necklace")
            end
            equip({neck=neckpiece})
        else
            send_command('gs c update')
			add_to_chat("Removing necklace")
        end
    end

end

-------------------------------------------------------------------------------------------------------------------
-- Ammmo recharge
-------------------------------------------------------------------------------------------------------------------

function ammo_recharge()

	if player.equipment.ammo == 'empty' then
		if player.inventory[gear.ammo] then
			add_to_chat("Replenishing "..gear.ammo.."s.")
			equip({ammo=gear.ammo})
		else
			add_to_chat("No more "..gear.ammo.."s.")
		end
	else
		gear.ammo = player.equipment.ammo
	end

end