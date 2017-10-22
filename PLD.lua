function get_sets()
    mote_include_version = 2

	include('Mote-Include.lua')
end


function job_setup()

		include('Land-Include.lua')
		
		initialize_job()
end

function user_setup()
	state.OffenseMode:options('Normal','FullTank','DPS')
	state.WeaponskillMode:options('Normal','Acc')
	state.CastingMode:options('Normal','Acc')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')

end


function user_unload()

end

function init_gear_sets()

        -- Precast Sets
        
			
	sets.precast.JA['Shield Bash'] = {head="Chaos Gauntlets"}
		
        -- Fast cast sets for spells
        sets.precast.FC = {waist="Velocious Belt",ear2="Loquacious Earring",legs="Homam Cosciales"}

        -- sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})
	
       
        -- Weaponskill sets
        -- Default set for any weaponskill that isn't any more specifically defined
        sets.precast.WS = {
		head="Hecatomb Cap +1",neck="Fotia Gorget",ear1="Assault Earring",ear2="Brutal Earring",
		body="Hecatomb Harness",hands="Alkyoneus's Brc.",ring1="Flame Ring",ring2="Rajas Ring",
		back="Cerberus Mantle +1",waist="Potent Belt",legs="Ryl.Kgt. Breeches",feet="Hecatomb Leggings +1"}

        -- Specific weaponskill sets. Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Vorpal Blade'] = set_combine(sets.precast.WS, {ear1="Abyssal Earring"})
	sets.precast.WS['Atonement'] = {
		head="Hecatomb Cap +1",neck="Fotia Gorget",ear1="Assault Earring",ear2="Hades Earring +1",
		body="Homam Corazza",hands="Homam Manopolas",ring1="Sniper's Ring +1",ring2="Rajas Ring",
		back="Cerberus Mantle +1",waist="Potent Belt",legs="Homam Cosciales",feet="Homam Gambieras"}
        
        
        -- Midcast Sets
        sets.midcast.Enmity = {
		head="Hydra Salade",neck="Ritter Gorget",ear1="Hades Earring +1",ear2="Hades Earring +1",
		body="Hydra Haubert",hands="Hydra Moufles",ring1="Hercule's Ring",ring2="Mermaids Ring",
		back="Cerberus Mantle +1",legs="Hydra Brayettes",feet="Hydra Sollerets"}
		
        sets.midcast.Cure = set_combine(sets.midcast.Enmity, {waist="Trance Belt"})
        
        sets.midcast.Flash = set_combine(sets.midcast.Enmity, {})
        
        -- Specific spells
        sets.midcast.Haste = {
        	head="Walahra Turban",
        	hands="Dusk Gloves +1",ring1="Blitz Ring",
        	waist="Velocious Belt",feet="Homam Gambieras",feet="Homam Gambieras"}
        	
        sets.midcast['Utsusemi'] = set_combine(sets.midcast.Haste, {})
		
        -- Idle sets
        sets.idle = {
        	head="Koenig Schaller",neck="Chocobo whistle",ear1="Ethereal Earring",ear2="Cassie Earring",
			body="Valhalla Breastplate",hands="Homam Manopolas",ring1="Jelly Ring",ring2="Bloodbead Ring",
			back="Shadow Mantle",waist="Velocious Belt",legs="Blood Cuisses"}
		
		sets.idle.Town = set_combine(sets.idle,{ring1="Warp ring",back="Nexus cape"})
			
        sets.PDT = {}
		
        sets.MDT = {}
        
        sets.FireRes = {}
   	
        sets.Refresh = {
        	neck="Parade Gorget"}
        
        -- Defense sets
        sets.defense.PDT = {}

        sets.defense.MDT = {}
        
        sets.Kiting = {legs="Blood Cuisses"}
        
        -- Engaged sets

        -- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
        -- sets if more refined versions aren't defined.
        -- If you create a set with both offense and defense modes, the offense mode should be first.
        -- EG: sets.engaged.Dagger.Accuracy.Evasion
        
        -- Normal melee group
        sets.engaged = {
        	ammo="Bibiki Seashell",
		head="Koenig Schaller",neck="Parade Gorget",ear1="Ethereal Earring",ear2="Cassie Earring",
		body="Valhalla Breastplate",hands="Homam Manopolas",ring1="Jelly Ring",ring2="",
		back="Cerberus Mantle +1",waist="Warwolf Belt",legs="Homam Cosciales",feet="Glt. Leggings +1"}

        sets.engaged.FullTank = {
        	ammo="Bibiki Seashell",
		head="Koenig Schaller",neck="Parade Gorget",ear1="Ethereal Earring",ear2="Cassie Earring",
		body="Valhalla Breastplate",hands="Koenig Handschuhs",ring1="Jelly Ring",ring2="",
		back="Shadow Mantle",waist="Warwolf Belt",legs="Blood Cuisses",feet="Glt. Leggings +1"}

        sets.engaged.DPS = {
		ammo="Bibiki Seashell",
		head="Walahra Turban",neck="Peacock Amulet",ear1="Assault Earring",ear2="Brutal Earring",
		body="Homam Corazza",hands="Dusk Gloves +1",ring1="Sniper's Ring +1",ring2="Rajas Ring",
		back="Cerberus Mantle +1",waist="Velocious Belt",legs="Homam Cosciales",feet="Homam Gambieras"}

	-- Excalibur engaged
        sets.engaged.Excalibur = set_combine(sets.engaged,{})

        sets.engaged.Excalibur.FullTank = set_combine(sets.engaged.FullTank,{})

        sets.engaged.Excalibur.DPS = set_combine(sets.engaged.DPS,{})

        sets.engaged.Excalibur.Shadows = set_combine(sets.engaged.Shadows,{})

	-- Excalibur engaged (NIN)
        sets.engaged.Excalibur.NIN = {
		ammo="Bibiki Seashell",
		head="Walahra Turban",neck="Ritter Gorget",ear1="Ethereal Earring",ear2="Cassie Earring +1",
		body="Valhalla Breastplate",hands="Homam Monapolas",ring1="Bloodbead Ring",ring2="Hercules' Ring",
		back="Cerberus Mantle +1",waist="Velocious Belt",legs="Homam Cosciales",feet="Homam Gambieras"}
		
        sets.engaged.Excalibur.NIN.FullTank = {
		ammo="Bibiki Seashell",
		head="Walahra Turban",neck="Ritter Gorget",ear1="Ethereal Earring",ear2="Cassie Earring",
		body="Valhalla Breastplate",hands="Dusk Gloves +1",ring1="Bloodbead Ring",ring2="Hercules' Ring",
		back="Cerberus Mantle +1",waist="Velocious Belt",legs="Homam Cosciales",feet="Homam Gambieras"}
		
        sets.engaged.Excalibur.NIN.DPS = {
		ammo="Bibiki Seashell",
		head="Walahra Turban",neck="Ritter Gorget",ear1="Assault Earring",ear2="Brutal Earring",
		body="Valhalla Breastplate",hands="Dusk Gloves +1",ring1="Bloodbead Ring",ring2="Hercules' Ring",
		back="Cerberus Mantle +1",waist="Velocious Belt",legs="Homam Cosciales",feet="Homam Gambieras"}
		
		
		-- Hrotti engaged (normal)
		sets.engaged.Hrotti = set_combine(sets.engaged,{body="Crm. Scale Mail",back="Cerberus Mantle +1",legs="Blood Cuisses"})
		
		sets.engaged.Hrotti.FullTank = set_combine(sets.engaged.FullTank,{body="Crimson Mail",back="Cerberus Mantle +1",legs="Blood Cuisses"})
	
		-- Hrotti engaged (NIN)
		sets.engaged.Hrotti.NIN = set_combine(sets.engaged.NIN,{body="Crimson Mail",back="Cerberus Mantle +1",legs="Blood Cuisses"})
		
		sets.engaged.Hrotti.FullTank.NIN = set_combine(sets.engaged.Hrotti.NIN,{})



end

-------------------------------------------------------------------------------------------------------------------
-- Idle
-------------------------------------------------------------------------------------------------------------------

function customize_idle_set(idleSet)
    if player.mpp < 70 and player.hpp >= 85 then
        idleSet = set_combine(idleSet,{neck="Parade gorget",body="Royal Cloak"})
	end
    if player.hpp < 70 then
        idleSet = set_combine(idleSet,{neck="Orochi nodowa"})
    end
	if player.hpp < 50 then
			idleSet = set_combine(idleSet,{ring2="Hercules' ring"})
	end
    return idleSet
end

-------------------------------------------------------------------------------------------------------------------
-- Weapon type function
-------------------------------------------------------------------------------------------------------------------

function adjust_melee_groups()

	classes.CustomMeleeGroups:clear()
	if player.sub_job == 'NIN' then
		classes.CustomMeleeGroups:append('NIN')
	end
end	

function job_status_change(new,old)

	if new == "Engaged" then
	
		if player.equipment.main == 'Excalibur' or player.equipment.main == 'Hrotti' then
            state.CombatWeapon:set(player.equipment.main)
            		else
            state.CombatWeapon:reset()
        end
		adjust_melee_groups()
		end  	
end
-------------------------------------------------------------------------------------------------------------------
-- Spells handling
-------------------------------------------------------------------------------------------------------------------

function job_buff_change(name,gain)
	
	sleep_swap(name,gain)
	
	if name:contains('Copy Image') then
		state.Buff[name] = gain
		handle_equipping_gear(player.status)
	end
	
end