function get_sets()
    mote_include_version = 2

	include('Mote-Include.lua')
end


function job_setup()

		include('Land-Include.lua')
	
		state.Buff['Camouflage'] = buffactive['Camouflage'] or false
		state.Buff['Barrage'] = buffactive['Barrage'] or false
		state.Buff['Unlimited Shot'] = buffactive['Unlimited Shot'] or false
	
		initialize_job()
	
		--get main and sub weapons for regear function
		gear.ammo = player.equipment.ammo

end

function user_setup()
		state.OffenseMode:options('Normal','DW','HNM')
		state.RangedMode:options('Normal','AccMid','Acc','Trash')
		state.WeaponskillMode:options('Normal','AccMid','Acc')
	
		send_command('bind f9 gs c cycle RangedMode')
		send_command('bind f10 gs c cycle WeaponskillMode')

end

       
function init_gear_sets()       
		
        -- Fast cast sets for spells
        sets.precast.FC = {waist="Velocious Belt",ear2="Loquacious Earring"}
	
       
        -- Weaponskill sets
        sets.precast.WS = {
			head="Zha'Go's Barbut",neck="Fotia Gorget",Ear1="Pixie Earring",Ear2="Drone Earring",
			body="Kirin's Osode",hands="Blood Fng. Gnt.",ring1="Flame Ring",ring2="Rajas Ring",
			back="Amemet Mantle +1",waist="Scout's Belt",legs="Sct. BrAccae +1",feet="Rutter Sabatons"}
		
        sets.precast.WS.AccMid = {
			head="Zha'Go's Barbut",neck="Fotia Gorget",Ear1="Drone Earring",Ear2="Drone Earring",
			body="Kirin's Osode",hands="Seiryu's Kote",ring1="Flame Ring",ring2="Rajas Ring",
			back="Amemet Mantle +1",waist="Scout's Belt",legs="Sct. BrAccae +1",feet="Rutter Sabatons"}

        -- Specific weaponskill sets. Uses the base set if an appropriate WSMod version isn't found.
		sets.precast.WS['Coronach'] = set_combine(sets.precast.WS, {legs="Byakko's Haidate",feet="Sct. Socks +1"})
		sets.precast.WS['Coronach'].AccMid = set_combine(sets.precast.WS['Coronach'], {feet="Hachiryu Sune-Ate",hands="Seiryu's Kote"})
		sets.precast.WS['Coronach'].Acc = set_combine(sets.precast.WS['Coronach'].MidAcc, {ring1="Behemoth Ring",hands="Seiryu's Kote"})
        sets.precast.WS['Slug Shot'] = set_combine(sets.precast.WS, {})
        		                
        -- Specific spells
        sets.midcast.Haste = {
        	head="Walahra Turban",
        	hands="Dusk Gloves",ring1="Blitz Ring",
        	waist="Velocious Belt",feet="Homam Gambieras"}
		
        -- Idle sets
        sets.idle = {
		head="Crimson Mask",neck="Chocobo Whistle",
		hands="Blood Fng. Gnt.",body="Kyudogi +1",ring1="Jelly Ring",ring2="Bloodbead Ring",
		back="Shadow Mantle",waist="Scout's Belt",legs="Blood Cuisses",feet="Trotter Boots"}
		
		sets.idle.Town = set_combine(sets.idle,{ring1="Warp ring",back="Nexus cape"})
        
        -- Defense sets
        sets.defense.PDT = {}

        sets.defense.MDT = {}
        
        sets.Kiting = {legs="Blood Cuisses",feet="Trotter Boots"}

        -- Precast Ranged Attack group
        sets.precast.RA = {head="Hunter's Beret",body="Scout's Jerkin"}
        	
		sets.precast.RA.Anni = set_combine(sets.precast.RA,{})
	
		sets.precast.RA.Yoichi = set_combine(sets.precast.RA,{legs="Hachiryu haidate"})
	
        -- Midcast Ranged Attack group
        sets.midcast.RA = {
        	head="Zha'Go's Barbut",neck="Peacock Amulet",Ear1="Drone Earring",Ear2="Drone Earring",
        	body="Kyudogi +1",hands="Blood Fng. Gnt.",ring1="Behemoth Ring",ring2="Rajas Ring",
        	back="Amemet Mantle +1",waist="Scout's belt",legs="Sct. BrAccae +1",feet="Sct. Socks +1"}
        	
        sets.midcast.RA.AccMid = set_combine(sets.midcast.RA,{ear1="Hollow earring",ring2="Behemoth Ring"})
        	        	
        sets.midcast.RA.Acc =  set_combine(sets.midcast.RA.AccMid,{
        	neck="Peacock Amulet",
        	hands="Seiryu's Kote",ring1="Behemoth Ring",ring2="Behemoth Ring",
        	feet="Hachiryu Sune-Ate"})
        	
        sets.midcast.RA.Trash = set_combine(sets.midcast.RA,{head="Scout's beret"})
        
		--Midcast Annihilator group
		sets.midcast.RA.Anni = set_combine(sets.midcast.RA,{})
		sets.midcast.RA.Anni.AccMid = set_combine(sets.midcast.RA.AccMid,{})
		sets.midcast.RA.Anni.Acc = set_combine(sets.midcast.RA.Acc,{})
		sets.midcast.RA.Anni.Trash = set_combine(sets.midcast.RA.Trash,{})
	
		--Midcast Yoichi group
		sets.midcast.RA.Yoichi = set_combine(sets.midcast.RA,{neck="Hope torque",feet="Hachiryu sune-ate"})
		sets.midcast.RA.Yoichi.AccMid = set_combine(sets.midcast.RA.AccMid,{})
		sets.midcast.RA.Yoichi.Acc = set_combine(sets.midcast.RA.Acc,{})
		sets.midcast.RA.Yoichi.Trash = set_combine(sets.midcast.RA.Trash,{feet="Hachiryu sune-ate"})

        -- Normal melee group
        sets.engaged = {
        	head="Walahra turban",neck="Peacock Amulet",ear1="Pixie Earring",ear2="Brutal Earring",
        	body="Kirin's Osode",hands="Dusk Gloves +1",ring1="Sniper's Ring +1",ring2="Rajas Ring",
        	back="Amemet Mantle +1",waist="Velocious Belt",legs="Byakko's Haidate",feet=""}
        	
		-- Barrage
		sets.buff['Barrage'] = set_combine(sets.midcast.RA.Acc, {hands="Hunter's bracers +1"})
end

-------------------------------------------------------------------------------------------------------------------
-- Idle
-------------------------------------------------------------------------------------------------------------------

function customize_idle_set(idleSet)
    if player.hpp < 70 then
        idleSet = set_combine(idleSet,{neck="Orochi nodowa"})
    end
    return idleSet
end

-------------------------------------------------------------------------------------------------------------------
-- Ammmo recharge
-------------------------------------------------------------------------------------------------------------------

function job_precast(spell,action,spellMap,eventArgs)
	
	if spell.action_type == 'Ranged Attack' or spell.type == 'WeaponSkill' and (spell.skill == 'Marksmanship' or spell.skill == 'Archery') then
		ammo_recharge()
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Weapon type function
-------------------------------------------------------------------------------------------------------------------

function job_post_precast(spell,action,spellMap,eventsArgs) 

	if player.equipment.range == 'Annihilator' then
		state.CombatWeapon:set('Anni')
	elseif player.equipment.range == 'Yoichinoyumi' then
		state.CombatWeapon:set('Yoichi')
	end

	if spell.type == 'WeaponSkill' and (spell.skill == 'Marksmanship' or spell.skill == 'Archery') then
			if not daytime then
				equip({ear1="Fenrir's earring"})
			end
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