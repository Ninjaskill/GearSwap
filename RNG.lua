-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

function get_sets()
    mote_include_version = 2

	include('Mote-Include.lua')
end


function job_setup()

	state.Buff['Barrage'] = buffactive['Barrage'] or false
	state.Buff['Unlimited Shot'] = buffactive['Unlimited Shot'] or false
	
	--get main and sub weapons for regear function
	gear.ammo = player.equipment.ammo

end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

function user_setup()
	state.OffenseMode:options('Normal')
        state.RangedMode:options('Normal', 'HybridAcc', 'Acc', 'Trash')
	state.WeaponskillMode:options('Normal', 'HybridAcc','Acc')
	state.IdleMode:options('Normal', 'Refresh')
	state.RestingMode:options('Normal')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	
	send_command('bind f9 gs c cycle RangedMode')
	send_command('bind f10 gs c cycle WeaponskillMode')

end


function user_unload()

end	
        
function init_gear_sets()

	--------------------------------------
        -- Start defining the sets
        --------------------------------------
        
        -- Precast Sets
        
			
	sets.precast.JA['Souleater'] = {head="Chaos Burgeonet"}
		
        -- Fast cast sets for spells
        sets.precast.FC = {waist="Velocious Belt",ear2="Loquacious Earring",legs="Homam Cosciales"}

        -- sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})
	
       
        -- Weaponskill sets
        -- Default set for any weaponskill that isn't any more specifically defined
        sets.precast.WS = {
		head="Enkidu's Cap",neck="Fotia Gorget",Ear1="Novia Earring",Ear2="Cassie Earring",
		body="Kirin's Osode",hands="Crimson Fng. Gnt.",ring1="Flame Ring",ring2="Rajas Ring",
		back="Amemet Mantle +1",waist="Scout's Belt",legs="Sct. BrAccae +1",feet="Rutter Sabatons"}
		
        sets.precast.Minuet = {
		head="Enkidu's Cap",neck="Fotia Gorget",Ear1="Drone Earring",Ear2="Drone Earring",
		body="Kirin's Osode",hands="Seiryu's Kote",ring1="Flame Ring",ring2="Rajas Ring",
		back="Amemet Mantle +1",waist="Scout's Belt",legs="Sct. BrAccae +1",feet="Rutter Sabatons"}

        -- Specific weaponskill sets. Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Coronach'] = set_combine(sets.precast.WS, {legs="Byakko's Haidate",feet="Sct. Socks +1"})
	sets.precast.WS['Coronach'].MidAcc = set_combine(sets.precast.WS['Coronach'], {feet="Hachiryu Sune-Ate"})
	sets.precast.WS['Coronach'].Acc = set_combine(sets.precast.WS['Coronach'].MidAcc, {ring1="Behemoth Ring",hands="Seiryu's Kote"})
        sets.precast.WS['Slug Shot'] = set_combine(sets.precast.WS, {})
        		                
        -- Specific spells
        sets.midcast.Haste = {
        	head="Walahra Turban",
        	hands="Dusk Gloves",ring1="Blitz Ring",
        	waist="Velocious Belt",feet="Homam Gambieras"}
		
        -- Idle sets
        sets.idle = {
		head="Crimson Mask",neck="Orochi Nodowa",
		body="Kyudogi +1",ring1="Jelly Ring",ring2="Bloodbead Ring",
		back="Shadow Mantle",waist="Scout's Belt",legs="Blood Cuisses",feet="Trotter Boots"}
        
        -- Defense sets
        sets.defense.PDT = {}

        sets.defense.MDT = {}
        
        sets.Kiting = {legs="Crimson Cuisses",feet="Trotter Boots"}
        
        -- Souleater set
        sets.SE = {head="Chaos Burgeonet"}

        -- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
        -- sets if more refined versions aren't defined.
        -- If you create a set with both offense and defense modes, the offense mode should be first.
        -- EG: sets.engaged.Dagger.Accuracy.Evasion

        -- Precast Ranged Attack group
        sets.precast.RA = {
        	head="Hunter's Beret",body="Scout's Jerkin"}
        	
	sets.precast.RA.Anni = set_combine(sets.precast.RA,{})
	
	sets.precast.RA.Yoichi = set_combine(sets.precast.RA,{legs="Hachiryu haidate"})
	
        -- Midcast Ranged Attack group
        	
        sets.midcast.RA = {
        	head="Enkidu's Cap",neck="Qiqirn Collar",Ear1="Drone Earring",Ear2="Drone Earring",
        	body="Kyudogi +1",hands="Crimson Fng. Gnt.",ring1="Behemoth Ring",ring2="Rajas Ring",
        	back="Amemet Mantle +1",waist="Scout's belt",legs="Sct. BrAccae +1",feet="Sct. Socks +1"}
        	
        sets.midcast.RA.HybridAcc = set_combine(sets.midcast.RA,{ear2="Hollow earring",ring1="Behemoth ring +1",feet="Hachiryu sune-ate"})
        	        	
        sets.midcast.RA.Acc =  set_combine(sets.midcast.RA.HybridAcc,{
        	neck="Peacock Amulet",
        	hands="Seiryu's Kote",ring1="Behemoth Ring",ring2="Behemoth Ring",
        	feet="Hachiryu Sune-Ate"})
        	
        sets.midcast.RA.Trash = set_combine(sets.midcast.RA,{head="Scout's beret"})
        
	--Midcast Annihilator group
	sets.midcast.RA.Anni = set_combine(sets.midcast.RA,{})
	sets.midcast.RA.Anni.HybridAcc = set_combine(sets.midcast.RA.HybridAcc,{})
	sets.midcast.RA.Anni.Acc = set_combine(sets.midcast.RA.Acc,{})
	sets.midcast.RA.Anni.Trash = set_combine(sets.midcast.RA.Trash,{})
	
	--Midcast Yoichi group
	sets.midcast.RA.Yoichi = set_combine(sets.midcast.RA,{neck="Hope torque",feet="Hachiryu sune-ate"})
	sets.midcast.RA.Yoichi.HybridAcc = set_combine(sets.midcast.RA.HybridAcc,{})
	sets.midcast.RA.Yoichi.Acc = set_combine(sets.midcast.RA.Acc,{})
	sets.midcast.RA.Yoichi.Trash = set_combine(sets.midcast.RA.Trash,{feet="Hachiryu sune-ate"})

        -- Normal melee group
        sets.engaged = {
        	head="Walahra turban",neck="Peacock Amulet",ear1="Assault Earring",ear2="Brutal Earring",
        	body="Kirin's Osode",hands="Dusk Gloves +1",ring1="Sniper's Ring +1",ring2="Rajas Ring",
        	back="Amemet Mantle +1",waist="Velocious Belt",legs="Byakko's Haidate",feet=""}
        	
	-- Barrage
	sets.buff['Barrage'] = set_combine(sets.midcast.RA.Acc, {hands="Hunter's bracers +1"})
end

-------------------------------------------------------------------------------------------------------------------
-- Barrage rule
-------------------------------------------------------------------------------------------------------------------

function job_post_midcast(spell,action,spellMap,eventsArgs)

	if spell.action_type == 'Ranged Attack' then
		if state.Buff['Barrage'] then
			equip(sets.buff['Barrage'])
		end
		if daytime then
			equip({ear1="Ladybug earring +1"})
			if state.RangedMode.value == 'Normal' or state.RangedMode.value == 'Trash' then
				equip({ear2="Ladybug earring +1"})
			end
		else
			equip({ear1="Fenrir's earring"})
		end
	end

end

-------------------------------------------------------------------------------------------------------------------
-- Weapon type function
-------------------------------------------------------------------------------------------------------------------

function job_precast(spell,action,spellMap,eventArgs)
	
	if spell.action_type == 'Ranged Attack' or spell.type == 'WeaponSkill' and (spell.skill == 'Marksmanship' or spell.skill == 'Archery') then
		ammo_recharge()
	end
end

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

function job_post_precast(spell,action,spellMap,eventsArgs) 

	if player.equipment.range == 'Annihilator' then
		state.CombatWeapon:set('Anni')
	elseif player.equipment.range == 'Yoichinoyumi' then
		state.CombatWeapon:set('Yoichi')
	end
	if spell.name == 'Eagle Eye Shot' then
		if daytime then
			equip({ear1="Ladybug earring +1",ear2="Ladybug earring +1"})
		else
			equip({ear1="Fenrir's earring"})
		end
	end
	
	if state.Buff['Unlimited Shot'] and spell.type == 'WeaponSkill' and spell.skill == 'Archery' then
		equip({ammo="Combat Caster's arrow"})
	end
	
end

-------------------------------------------------------------------------------------------------------------------
-- Combat Caster Arrow
-------------------------------------------------------------------------------------------------------------------

function job_post_aftercast(spell,action,spellMap,eventArgs)
	
	if player.equipment.ammo == 'Cmb.Cst. Arrow' then
		add_to_chat("Re-equipping "..gear.ammo.."s.")
		equip({ammo=gear.ammo})
	end
	
end

-------------------------------------------------------------------------------------------------------------------
-- Job stuff
-------------------------------------------------------------------------------------------------------------------

function select_default_macro_book()
        -- Default macro set/book
	    if player.sub_job == 'SAM' then
	    	set_macro_page(1, 1)
		add_to_chat('Main job RNG: Macro Book 1.')
		add_to_chat('Sub job SAM: Macro Page 1.')
	    elseif player.sub_job == 'NIN' then
	    	set_macro_page(3, 1)
		add_to_chat('Main job RNG: Macro Book 1.')
		add_to_chat('Sub job NIN: Macro Page 3.')
	    end
end