function get_sets()
    mote_include_version = 2

	include('Mote-Include.lua')
end


function job_setup()

		include('Land-Include.lua')

		state.Buff['Aftermath'] = buffactive['Aftermath: Lv.1'] or
		buffactive['Aftermath: Lv.2'] or
		buffactive['Aftermath: Lv.3'] or
		false

		initialize_job()
end

function user_setup()
		state.OffenseMode:options('Normal','Acc','Tank','Trash')
		state.WeaponskillMode:options('Normal','Acc')
		state.PhysicalDefenseMode:options('PDT')
		state.MagicalDefenseMode:options('MDT')

		send_command('bind f9 gs c cycle OffenseMode')
		send_command('bind f10 gs c cycle WeaponskillMode')
		send_command('bind f11 gs c cycle Kiting')

end


function user_unload()

end

function init_gear_sets()

		-- Precast Sets			
		sets.precast.JA['Souleater'] = {head="Chaos Burgeonet"}
		sets.precast.JA['Weapon Bash'] = {hands="Chaos gauntlets",ring2="Slayer's ring"}
		sets.precast.JA['Last Resort'] = {feet="Abyss sollerets +1"}
		
		-- Fast cast sets for spells
		sets.precast.FC = {waist="Velocious Belt",ear2="Loquacious Earring",legs="Homam Cosciales"}	

		-- Weaponskill sets
		sets.precast.WS = {
			head="Hecatomb Cap +1",neck="Fotia Gorget",ear1="Assault Earring",ear2="Brutal Earring",
			body="Armada Hauberk",hands="Alkyoneus's Brc.",ring1="Flame Ring",ring2="Rajas Ring",
			back="Cerberus Mantle +1",waist="Warwolf Belt",legs="Onyx Cuisses",feet="Hecatomb Leggings +1"}

		sets.precast.WS.Acc = set_combine(sets.precast.WS,{ammo="Fire bomblet",waist="Potent Belt",back="Abyss Cape"})

		-- Specific weaponskill sets. Uses the base set if an appropriate WSMod version isn't found.
		sets.precast.WS['Catastrophe'] = set_combine(sets.precast.WS, {ear1="Abyssal Earring"})
		sets.precast.WS['Scourge'] = set_combine(sets.precast.WS, {ear1="Assault Earring"})
		sets.precast.WS['Entropy'] = set_combine(sets.precast.WS, {ear1="Abyssal Earring"})
		sets.precast.WS['Guillotine'] = set_combine(sets.precast.WS, {waist="Potent Belt",ear1="Abyssal Earring"})
		sets.precast.WS['Spiral Hell'] = set_combine(sets.precast.WS, {ear1="Abyssal Earring"})
		sets.precast.WS['Spinning Slash'] = set_combine(sets.precast.WS, {})
		sets.precast.WS['Ground Strike'] = set_combine(sets.precast.WS, {})
		sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {waist="Potent Belt"})

		-- Midcast Sets
		sets.midcast['Dark Magic'] = {
			ammo="Phantom Tathlum",
			head="Chaos Burgeonet",neck="Dark Torque",ear1="Abyssal Earring",ear2="Dark Earring",body="Corselet",
			hands="Blood Fng. Gnt.",ring1="Snow Ring",ring2="Omega Ring",
			back="Abyss Cape",legs="Abs. Flanchard +1"}

		sets.midcast.DarkObi = {waist="Anrin Obi"}

		sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {ear2="Moldavite Earring",hands="Vicious Mufflers",body="Corselet"})

		sets.midcast.Aspir = sets.midcast.Drain

		sets.midcast['Absorb-ACC'] = set_combine(sets.midcast['Dark Magic'], {legs="Onyx Cuisses",feet="Black Sollerets"})

		sets.midcast['Absorb-TP'] = set_combine(sets.midcast['Dark Magic'], {feet="Black Sollerets"})

		sets.midcast['Dread Spikes'] = {
			head="Walahra Turban",neck="Bloodbead Gorget",ear1="Intruder Earring",ear2="Cassie Earring",
			body="Valhalla Breastplate",hands="Alkyoneus's Brc.",ring1="Bomb Queen Ring",ring2="Bloodbead Ring",
			back="Gigant Mantle",waist="",legs="Dusk Trousers",feet="Homam Gambieras"}

		sets.midcast['Enfeebling Magic'] = {ammo="Phantom Tathlum",
			head="Crimson Mask",neck="Spider Torque",ear1="Abyssal Earring",
			body="Chaos Cuirass",hands="Mst.Cst. Bracelets",ring1="Snow Ring",ring2="Omega Ring",
			back="Abyss Cape",feet="Abs. Sollerets +1"}

		sets.midcast.Haste = {
			head="Walahra Turban",
			hands="Dusk Gloves +1",ring1="Blitz Ring",
			waist="Velocious Belt",feet="Homam Gambieras"}

		sets.midcast.Utsusemi = sets.midcast.Haste

		-- Idle sets
		sets.idle = {
			ammo="Bibiki seashell",
			neck="Chocobo whistle",ear1="Ethereal earring",ear2="Merman's earring",
			body="Vampire Cloak",hands="Heavy gauntlets",ring1="Jelly ring" ,ring2="Rajas ring",
			back="Shadow mantle",waist="Velocious sash",legs="Blood cuisses",feet="Homam Gambieras"}

		sets.idle.Town = set_combine(sets.idle,{ring1="Warp ring",back="Nexus cape"})

		-- Defense sets
		sets.defense.PDT = {}

		sets.defense.MDT = {}

		sets.Kiting = {legs="Blood Cuisses"}

		-- Default melee group
		sets.engaged = {
			ammo="Fire Bomblet",
			head="Walahra Turban",neck="Peacock Amulet",ear1="Abyssal Earring",ear2="Brutal Earring",
			body="Armada Hauberk",hands="Dusk Gloves +1",ring1="Sniper's Ring +1",ring2="Rajas Ring",
			back="Cerberus Mantle +1",waist="Velocious Belt",legs="Homam Cosciales",feet="Homam Gambieras"}

		sets.engaged.Acc = {
			ammo="Fire Bomblet",
			head="Ace's Helm",neck="Peacock Amulet",ear1="Abyssal Earring",ear2="Brutal Earring",
			body="Armada Hauberk",hands="Homam manopolas",ring1="Sniper's Ring +1",ring2="Rajas Ring",
			back="Cuchulain's Mantle",waist="Velocious Belt",legs="Homam Cosciales",feet="Homam Gambieras"}		

		-- apoc engaged (normal)
		sets.engaged.Apocalypse = {
			ammo="Fire Bomblet",
			head="Walahra Turban",neck="Peacock Amulet",ear1="Abyssal Earring",ear2="Brutal Earring",
			body="Aurum Cuirass",hands="Dusk Gloves +1",ring1="Sniper's Ring +1",ring2="Rajas Ring",
			back="Cerberus Mantle +1",waist="Velocious Belt",legs="Homam Cosciales",feet="Homam Gambieras"}

		sets.engaged.Apocalypse.Acc  = {
			ammo="Fire Bomblet",
			head="Ace's Helm",neck="Peacock Amulet",ear1="Abyssal Earring",ear2="Brutal Earring",
			body="Armada Hauberk",hands="Homam manopolas",ring1="Sniper's Ring +1",ring2="Rajas Ring",
			back="Cuchulain's Mantle",waist="Velocious Belt",legs="Homam Cosciales",feet="Homam Gambieras"}

		sets.engaged.Apocalypse.Tank = set_combine(sets.engaged.Apocalypse,{ammo="Bibiki seashell",back="Shadow mantle",ring2="Defending ring"})

		sets.engaged.Apocalypse.Trash = set_combine(sets.engaged.Apocalypse,{body="Homam Corazza"})

		sets.engaged.Apocalypse.AM = set_combine(sets.engaged.Apocalypse,{waist="Warwolf Belt"})

		sets.engaged.Apocalypse.Acc.AM = set_combine(sets.engaged.Apocalypse.Acc,{waist="Warwolf Belt"})

		sets.engaged.Apocalypse.Tank.AM = set_combine(sets.engaged.Apocalypse.Tank,{waist="Warwolf Belt",body="Valhalla breastplate"})

		-- apoc engaged (SAM)
		sets.engaged.Apocalypse.SAM = {	
			ammo="Fire Bomblet",
			head="Walahra Turban",neck="Peacock Amulet",ear1="Abyssal Earring",ear2="Brutal Earring",
			body="Armada Hauberk",hands="Dusk Gloves +1",ring1="Sniper's Ring +1",ring2="Rajas Ring",
			back="Cerberus Mantle +1",waist="Velocious Belt",legs="Homam Cosciales",feet="Homam Gambieras"}

		sets.engaged.Apocalypse.Acc.SAM = set_combine(sets.engaged.Apocalypse.SAM,{head="Ace's Helm",back="Cuchulain's mantle",hands="Homam manopolas",feet="Homam gambieras"})

		sets.engaged.Apocalypse.Trash.SAM = set_combine(sets.engaged.Apocalypse.SAM,{body="Homam Corazza"})

		sets.engaged.Apocalypse.SAM.AM = set_combine(sets.engaged.Apocalypse.SAM,{waist="Warwolf Belt"})

		sets.engaged.Apocalypse.Acc.SAM.AM = set_combine(sets.engaged.Apocalypse.Acc.SAM.AM,{waist="Potent Belt"})

		-- ragnarok engaged (normal)
		sets.engaged.Ragnarok = {
			ammo="Fire Bomblet",
			head="Walahra Turban",neck="Peacock Amulet",ear1="Assault earring",ear2="Brutal earring",
			body="Armada Hauberk",hands="Dusk Gloves +1",ring1="Sniper's Ring +1",ring2="Rajas Ring",
			back="Cerberus Mantle +1",waist="Velocious Belt",legs="Homam Cosciales",feet="Homam Gambieras"}

		sets.engaged.Ragnarok.Acc = set_combine(sets.engaged.Ragnarok,{neck="Ancient torque",hands="Homam manopolas",back="Cuchulain's mantle",feet="Homam gambieras"})

		-- ragnarok engaged (SAM)                
		sets.engaged.Ragnarok.SAM = {
			ammo="Fire Bomblet",
			head="Walahra Turban",neck="Peacock Amulet",ear1="Assault earring",ear2="Brutal earring",
			body="Armada Hauberk",hands="Dusk Gloves +1",ring1="Sniper's Ring +1",ring2="Rajas Ring",
			back="Cerberus Mantle +1",waist="Velocious Belt",legs="Homam Cosciales",feet="Homam Gambieras"}

		sets.engaged.Ragnarok.Acc.SAM = set_combine(sets.engaged.Ragnarok,{head="Ace's Helm",back="Cuchulain's mantle",hands="Homam manopolas",feet="Homam gambieras"})

		-- DW engaged (normal)
		sets.engaged.Ridill = {
			ammo="Fire Bomblet",
			head="Walahra Turban",neck="Peacock Amulet",ear1="Assault Earring",ear2="Brutal Earring",
			body="Armada Hauberk",hands="Dusk Gloves +1",ring1="Sniper's Ring +1",ring2="Rajas Ring",
			back="Cerberus Mantle +1",waist="Velocious Belt",legs="Homam Cosciales",feet="Homam Gambieras"}

		sets.engaged.Ridill.Acc  = {
			ammo="Fire Bomblet",
			head="Ace's Helm",neck="Peacock Amulet",ear1="Abyssal Earring",ear2="Brutal Earring",
			body="Armada Hauberk",hands="Homam Manopolas",ring1="Sniper's Ring +1",ring2="Rajas Ring",
			back="Cuchulain's Mantle",waist="Velocious Belt",legs="Homam Cosciales",feet="Homam Gambieras"}

		sets.engaged.Ridill.Tank = set_combine(sets.engaged.Apocalypse,{ammo="Bibiki seashell",back="Shadow mantle",ring2="Defending ring"})

		-- zerg engaged
		sets.engaged.Zerg = {
			ammo="White tathlum",
			head="Walahra turban",neck="Ritter gorget"  ,ear1="Bloodbead earring",ear2="Cassie earring",
			body="Gloom breastplate",hands="Dusk gloves +1",ring1="Bloodbead ring"  ,ring2="Bomb queen ring",
			back="Gigant mantle",waist="Velocious belt",legs="Homam cosciales",feet="Homam gambieras"}



end

-------------------------------------------------------------------------------------------------------------------
-- Idle
-------------------------------------------------------------------------------------------------------------------

function customize_idle_set(idleSet)
	if player.mpp < 70 and player.hpp >= 85 then
		idleSet = set_combine(idleSet,{neck="Parade gorget"})
	end
	if player.hpp < 70 then
		idleSet = set_combine(idleSet,{neck="Orochi nodowa"})
	end
	return idleSet
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for casting events.
-------------------------------------------------------------------------------------------------------------------

function job_midcast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' and spell.element == 'Dark' and (world.day_element == 'Dark' or world.weather_element == 'Dark') then
		equip(sets.midcast.DarkObi)
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Buff change & AM function
-------------------------------------------------------------------------------------------------------------------

function job_buff_change(name,gain)

	sleep_swap(name,gain)

	if name:startswith('Aftermath') and player.equipment.main == 'Apocalypse' then
		if gain then
			add_to_chat("Equipping AM Up set.")
		else
			add_to_chat("Equipping AM Down set.")
		end
			adjust_melee_groups()
			handle_equipping_gear(player.status)
	end    
end

function adjust_melee_groups()

	classes.CustomMeleeGroups:clear()
	if player.sub_job == 'SAM' then
		classes.CustomMeleeGroups:append('SAM')
	end
	if state.Buff.Aftermath then
		classes.CustomMeleeGroups:append('AM')
	end

end

-------------------------------------------------------------------------------------------------------------------
-- Weapon type function
-------------------------------------------------------------------------------------------------------------------

function job_status_change(new,old)

	if new == "Engaged" then

		if player.equipment.main == 'Apocalypse' or player.equipment.main == 'Ragnarok' or player.equipment.main == 'Ridill' then
			state.CombatWeapon:set(player.equipment.main)
		elseif player.equipment.main == 'Kraken Club' or 'Mercurial Kris' then
			state.CombatWeapon:set('Zerg')
		else
			state.CombatWeapon:reset()
		end
			adjust_melee_groups()
	end
end