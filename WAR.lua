function get_sets()
    mote_include_version = 2

	include('Mote-Include.lua')
end


function job_setup()
		
		include('Land-Include.lua')

		state.Buff['Mighty Strikes']    = buffactive['Mighty Strikes'] or false
		state.Buff['Warrior\'s Charge'] = buffactive['Warrior\'s Charge'] or false
	
		initialize_job()

end

function user_setup()
	state.OffenseMode:options('Normal', 'Acc')
	state.RangedMode:options('Normal')
	state.HybridMode:options('Normal')
	state.WeaponskillMode:options('Normal','Acc','Cap')
	state.CastingMode:options('Normal')
	state.IdleMode:options('Normal')
	state.RestingMode:options('Normal')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	
	send_command('bind f9 gs c cycle OffenseMode')
	send_command('bind f10 gs c cycle WeaponskillMode')

end


function user_unload()

end

function init_gear_sets()
        
        -- Fast cast sets for spells
        sets.precast.FC = {waist="Velocious Belt",ear2="Loquacious Earring"}
	
       
        -- Weaponskill sets
        -- Default set for any weaponskill that isn't any more specifically defined
        sets.precast.WS = {
			head="Hecatomb Cap +1",neck="Fotia Gorget",ear1="Assault Earring",ear2="Brutal Earring",
			body="Armada Hauberk",hands="Alkyoneus's Brc.",ring1="Flame Ring",ring2="Rajas Ring",
			back="Cerberus Mantle +1",waist="Warwolf Belt",legs="Byakko's Haidate",feet="Hecatomb Leggings +1"}
		
        sets.precast.WS.Acc = {
			head="Hecatomb Cap +1",neck="Fotia Gorget",ear1="Assault Earring",ear2="Brutal Earring",
			body="Armada Hauberk",hands="Hct. Mitts +1",ring1="Sniper Ring +1",ring2="Rajas Ring",
			back="Cuchulain's Mantle",waist="Potent Belt",legs="Byakko's Haidate",feet="Hecatomb Leggings +1"}
		
		sets.precast.WS.Cap = {}

        -- Specific weaponskill sets. Uses the base set if an appropriate WSMod version isn't found.
        sets.precast.WS['Raging Rush'] = set_combine(sets.precast.WS, {waist="Potent Belt"})
        sets.precast.WS['Raging Rush'].Acc = set_combine(sets.precast.WS.Acc, {waist="Potent Belt"})
        sets.precast.WS['Metatron Torment'] = set_combine(sets.precast.WS, {waist="Potent Belt"})
        sets.precast.WS['Penta Thrust'] = set_combine(sets.precast.WS, {waist="Potent Belt"})
        sets.precast.WS['Penta Thrust'].Acc = set_combine(sets.precast.WS.Acc, {waist="Potent Belt"})
        sets.precast.WS['Penta Thrust'].Cap = set_combine(sets.precast.WS.Cap, {waist="Potent Belt"})
        sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {waist="Potent Belt"})
        sets.precast.WS['Scourge'] = set_combine(sets.precast.WS, {waist="Potent Belt"})
        sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {waist="Potent Belt"})
        sets.precast.WS['Spiral Hell'] = set_combine(sets.precast.WS, {legs="Byakko's Haidate"})
        sets.precast.WS['Ground Strike'] = set_combine(sets.precast.WS, {legs="Byakko's Haidate"})
		                
        -- Specific spells
        sets.midcast.Haste = {
        	head="Walahra Turban",
        	hands="Dusk Gloves",ring1="Blitz Ring",
        	waist="Velocious Belt",feet="Dusk Ledelsens"}	
               
        -- Idle sets
        sets.idle = {
        	ammo="Bibiki seashell",
        	neck="Chocobo whistle",ear1="Assault Earring",ear2="Brutal Earring",
			head="Genbu's Kabuto",body="Valhalla Breastplate",hands="Heavy Gauntlets",ring1="Jelly Ring",ring2="Bloodbead Ring",
			back="Shadow Mantle",waist="Velocious Belt",legs="Crimson Cuisses",feet="Hermes' Sandals"}
		
		sets.idle.Town = set_combine(sets.idle,{ring1="Warp ring",back="Nexus cape"})
        
        -- Defense sets
        sets.defense.PDT = {}

        sets.defense.MDT = {}
        
        sets.Kiting = {feet="Hermes' Sandals"}

        -- Default melee group
        sets.engaged = {
        	ammo="Fire Bomblet",
			head="Walahra Turban",neck="Peacock Amulet",ear1="Assault Earring",ear2="Brutal Earring",
			body="Armada Hauberk",hands="Dusk Gloves +1",ring1="Sniper's Ring +1",ring2="Rajas Ring",
			back="Cerberus Mantle +1",waist="Velocious Belt",legs="Byakko's Haidate",feet="Unicorn Leggings"}
		
        sets.engaged.Acc = set_combine(sets.engaged,{})
        
		sets.engaged.Tank = set_combine(sets.engaged,{ammo="Bibiki seashell",back="Shadow mantle",ring2="Defending ring"})

		-- Bravura engaged (normal)
        sets.engaged.Bravura = set_combine(sets.engaged,{body="Aurum cuirass"})
		
        sets.engaged.Bravura.Acc  = set_combine(sets.engaged.Bravura,{ear1="Assault earring",back="Cuchulain's mantle",feet="Aurum sabatons"})
        
		sets.engaged.Bravura.Tank = set_combine(sets.engaged.Bravura,{ammo="Bibiki seashell",back="Shadow mantle",ring2="Defending ring"})
		
		-- Bravura engaged (SAM)
		sets.engaged.Bravura.SAM = set_combine(sets.engaged,{})

		sets.engaged.Bravura.Acc.SAM = set_combine(sets.engaged.Bravura.SAM,{ear1="Assault earring",back="Cuchulain's mantle",feet="Aurum sabatons"})

		-- ragnarok engaged (normal)
		sets.engaged.Ragnarok = set_combine(sets.engaged,{})

		sets.engaged.Ragnarok.Acc = set_combine(sets.engaged.Ragnarok,{})
	
		-- ragnarok engaged (SAM)                
		sets.engaged.Ragnarok.SAM = set_combine(sets.engaged.Ragnarok,{})
		
		sets.engaged.Ragnarok.Acc.SAM = set_combine(sets.engaged.Ragnarok.SAM,{})
	
		-- DW engaged (normal)
        sets.engaged.Ridill = set_combine(sets.engaged,{})
		
        sets.engaged.Ridill.Acc  = set_combine(sets.engaged.Ridill,{})
		
		sets.engaged.Ridill.Tank = set_combine(sets.engaged.Ridill,{ammo="Bibiki seashell",back="Shadow mantle",ring2="Defending ring"})
	
		-- Capped shit
		sets.engaged.Thundercloud = {
			head="Patroclus's Helm",neck="Peacock Amulet",ear1="Assault Earring",ear2="Cassie Earring",
			body="Ryl.Kgt. Chainmail",hands="Ryl.Kgt. Mufflers",ring1="Sniper's ring +1",ring2="Rajas Ring",
			back="Amemet Mantle +1",waist="Velocious Belt",legs="Ryl.Kgt. Breeches",feet="Bounding Boots"}

end

-------------------------------------------------------------------------------------------------------------------
-- Idle
-------------------------------------------------------------------------------------------------------------------

function customize_idle_set(idleSet)
	if player.hpp < 70 then
        idleSet = set_combine(idleSet,{neck="Orochi nodowa"})
    end
    if player.hpp < 51 then
        idleSet = set_combine(idleSet,{ring2="Hercules' ring"})
    end
    return idleSet
end



-------------------------------------------------------------------------------------------------------------------
-- Day/Night
-------------------------------------------------------------------------------------------------------------------

function job_post_precast(spell,action,spellMap,eventsArgs)

	if daytime and spell.skill == 'WeaponSkill' then
		if state.Buff['Warrior\'s Charge'] then
			equip({ear2="Fenrir's earring"})
		else
			if state.WeaponskillMode.value == 'Normal' then
				equip({ear1="Fenrir's earring"})
			end
		end
	elseif spell.skill == 'WeaponSkill' then
		if state.Buff['Warrior\'s Charge'] then
			if player.inventory['Bushinomimi'] then
				equip({ear2="Bushinomimi"})
			else
				equip({ear2="Merman's earring"})
			end
		end
	end

end

function job_buff_change(name,gain)

	sleep_swap(name,gain)

end

-------------------------------------------------------------------------------------------------------------------
-- Weapon type function
-------------------------------------------------------------------------------------------------------------------
function job_status_change(new,old)

	if new == "Engaged" then
	
		if player.equipment.main == 'Bravura' or player.equipment.main == 'Ragnarok' or player.equipment.main == 'Thundercloud' or player.equipment.main == 'Ridill' then
            state.CombatWeapon:set(player.equipment.main)
          else
            state.CombatWeapon:reset()
          end
		adjust_melee_groups()
	end  	
end

function customize_melee_set(meleeSet)

	if daytime and state.OffenseMode.value == 'Normal' then
        meleeSet = set_combine(meleeSet,{ear1="Fenrir's earring"})
    end

    return meleeSet
	
end

function adjust_melee_groups()

	classes.CustomMeleeGroups:clear()
	if player.sub_job == 'SAM' then
		classes.CustomMeleeGroups:append('SAM')
	end	
end