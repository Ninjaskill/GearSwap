function get_sets()
    mote_include_version = 2

include('Mote-Mappings.lua')
include('Mote-Include.lua')
include('organizer-lib')
end


function job_setup()

		include('Land-Include.lua')
		
		state.Buff['Afflatus Solace'] = buffactive['Afflatus Solace'] or false
		state.Buff['Afflatus Misery'] = buffactive['Afflatus Misery'] or false
		
		initialize_job()
end

function user_setup()
	state.OffenseMode:options('Normal')
	state.RangedMode:options('Normal')
	state.HybridMode:options('Normal')
	state.WeaponskillMode:options('Normal')
	state.CastingMode:options('Normal')
	state.IdleMode:options('Normal', 'Refresh')
	state.RestingMode:options('Normal')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')

end


function user_unload()

end

function init_gear_sets()
       
        -- Misc sets
        sets.MND = {
        	main="Templar Mace",sub="Muse Tariqah",ammo="Holy Ampulla",
        	head="Healer's Cap",neck="Ajari Necklace",ear1="Star Earring",ear2="Star Earring",
        	body="Errant Hpl.",hands="Blessed Mitts +1",ring1="Star Ring",ring2="Tamas Ring",
        	back="Prism Cape",waist="Cleric's Belt",legs="Mahatma Slops",feet="Blessed Pumps"}
        	        
        -- Precast Sets
        
				
        -- Fast cast sets for spells
        sets.precast.FC = {ear2="Loquacious Earring",feet="Rostrum Pumps"}
        sets.precast.FC.Cure = set_combine(sets.precast.FC, {feet="Cure Clogs"})

		-- Midcast sets
        sets.midcast['Healing Magic'] = set_combine(sets.MND,{neck="Fylgja Torque +1",ear1="Novia Earring",ear2="Roundel Earring",body="Aristocrat's Coat",hands="Healer's Mitts",legs="Bls. Trousers +1"})
        sets.midcast['Enhancing Magic'] = {feet="Clr. Duckbills +1"}
        sets.midcast['Enfeebling Magic'] = {neck="Spider torque", body="Healer's briault", hands="Bricta's cuffs",feet="Avocat pigaches"}
		sets.midcast['Divine Magic'] = {neck="Spider torque", body="Healer's briault", hands="Bricta's cuffs",feet="Avocat pigaches"}
        sets.midcast['Stoneskin'] = set_combine(sets.MND, {})
        	        
        sets.midcast.Regen = {
		body="Cleric's Briault"}
     
        -- Weaponskill sets
        sets.precast.WS = {}

        sets.precast.WS['Hexa Strike'] = set_combine(sets.precast.WS, {neck="Soil Gorget",waist="Potent Belt",legs="Byakko's Haidate"})
        sets.precast.WS['True Strike'] = set_combine(sets.precast.WS, {feet="Chaos Sollerets",waist="Potent Belt"})
        sets.precast.WS['Retrobution'] = set_combine(sets.precast.WS, {neck="Soil Gorget",waist="Twilight Belt",legs="Byakko's Haidate"})
        sets.precast.WS['Full Swing'] = set_combine(sets.precast.WS, {neck="Soil Gorget",waist="Twilight Belt",legs="Byakko's Haidate"})
        sets.precast.WS['Spirit Taker'] = set_combine(sets.precast.WS, {neck="Soil Gorget",waist="Twilight Belt",legs="Byakko's Haidate"})
		
		sets.midcast.Sneak = {
		back="Skulker's Cape"}
		
		sets.midcast.Invisible = sets.midcast.Sneak
       
        sets.midcast.Enfeebling = {
		head=="Elite Beret",neck="Spider Torque",body="Healer's Briault"}
		
        sets.midcast.Enhancing = {
		neck="Enhancing Torque",ear2="Augment. Earring",back="Merciful Cape",feet="Clr. Duckbills +1"}
		
        -- Idle sets
        sets.idle = {
        	main="Mjollnir",sub="Genbu's Shield",
			head="Walahra Turban",neck="Chocobo whistle",
			body="Aristocrat's Coat",hands="Blessed Mitts +1",
			back="Umbra Cape"}
        	
		sets.idle.Town = set_combine(sets.idle,{ring1="Warp ring",back="Nexus cape"})
		
		-- Resting sets
		sets.resting = {
			main="Rsv.Cpt. Mace",sub="Legion Scutum",
			head="Mirror Tiara",ear1="Magnetic Earring",ear2="Relaxing Earring",
			body="Oracle's Robe",hands="Oracle's Gloves",ring1="Star Ring",ring2="Star Ring",
			waist="Cleric's Belt",legs="Oracle's Braconi",feet="Numerist Pumps"}
        
        -- Defense sets
        sets.defense.PDT = {}

        sets.defense.MDT = {}
        
        sets.Kiting = {feet="Herald Gaiters"}
        
        -- Engaged sets
        sets.engaged = {
			head="Walahra Turban",neck="Peacock Amulet",ear1="Assault Earring",ear2="Fowling Earring",
			body="Demon's Harness",hands="Dusk Gloves",ring1="Sniper's Ring +1",ring2="Sniper's Ring",
			back="Cerberus Mantle",waist="Velocious Belt",legs="Onyx Cuisses",feet="Dusk Ledelsens"}

end

function job_post_aftercast(spell, action, spellMap, eventArgs)
		send_command('gs c update')
end