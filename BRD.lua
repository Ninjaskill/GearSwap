-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

function get_sets()
    mote_include_version = 2

	include('Mote-Include.lua')
end


function job_setup()

end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

function user_setup()
	state.OffenseMode:options('Normal')
	state.RangedMode:options('Normal')
	state.HybridMode:options('Normal')
	state.WeaponskillMode:options('Normal')
	state.CastingMode:options('Normal')
	state.IdleMode:options('Normal')
	state.RestingMode:options('Normal')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	
        select_default_macro_book()
end


function user_unload()

end

function init_gear_sets()
	--------------------------------------
        -- Start defining the sets
        --------------------------------------
        
        -- Misc
	sets.MND = {
		main="Chatoyant Staff",sub="Bugard Strap +1",
		head="Choral roundlet",neck="Holy phial",ear1="Mamool Ja earring",ear2="Star earring",
		body="Kirin's osode"  ,hands="Bricta's cuffs",ring1="Star ring",ring2="Tamas ring",
		back="Prism cape",waist="Steppe rope",legs="Mahatma slops",feet="Suzaku's sune-ate"}
		
	sets.CHR = {
		range="Gjallarhorn",
		head="Bard's roundlet +1" ,neck="Piper's torque",ear1="Melody Earring +1",ear2="Musical Earring",
		body="Kirin's osode",hands="Choral cuffs +1",ring1="Light ring",ring2="Light ring",
		back="Jester's cape +1",waist="Corsette",legs="Mahatma slops",feet="Sha'ir crackows"}
		
	sets.obi = {
		Fire      = {waist="Karin Obi"},
		Earth     = {waist="Dorin Obi"},
		Water     = {waist="Suirin Obi"},
		Wind      = {waist="Furin Obi"},
		Ice       = {waist="Hyorin Obi"},
		Lightning = {waist="Rairin Obi"},
		Light     = {waist="Korin Obi"},
		Dark	  = {waist="Anrin Obi"}}
															 	   
	sets.grip = {
		Fire 	  = {sub="Fire Grip"},
		Earth 	  = {sub="Earth Grip"},
		Water 	  = {sub="Water Grip"},
		Wind 	  = {sub="Wind Grip"},
		Ice 	  = {sub="Ice Grip"},
		Lightning = {sub="Lightning Grip"},
		Light 	  = {sub="Light Grip"},
		Dark 	  = {sub="Dark Grip"}}

        -- Precast Sets
	sets.precast.FC = {ear2="Loquacious Earring",feet="Rostrum pumps"}
        sets.precast.FC['BardSong'] = set_combine(sets.precast.FC,{body="Sheikh Manteel"})
        
        -- Midcast Sets
        sets.midcast['BardSong'] = set_combine(sets.CHR,{
		body="Minstrel's Coat",hands="Chl. Cuffs +1",ring1="Nereid Ring",ring2="Nereid Ring",
		legs="Chl. Cannions +1",feet="Oracle's Pigaches"})
		
	sets.midcast['Lullaby'] = set_combine(sets.midcast['Lullaby'],{
		sub="Light Grip",
		body="Minstrel's Coat",hands="Brd. Cuffs +1",ring1="Nereid Ring",ring2="Nereid Ring",
		legs="Choral Cannions",feet="Oracle's Pigaches"})
	
	sets.midcast['Magic Finale'] = set_combine(sets.midcast['Lullaby'],{
		body="Minstrel's Coat",hands="Brd. Cuffs +1",ring1="Nereid Ring",ring2="Nereid Ring",
		legs="Choral Cannions",feet="Oracle's Pigaches"})
	
	sets.midcast['Elegy'] = set_combine(sets.midcast['Lullaby'],{
		sub="Earth Grip",
		body="Minstrel's Coat",hands="Brd. Cuffs +1",ring1="Nereid Ring",ring2="Nereid Ring",
		legs="Choral Cannions",feet="Oracle's Pigaches"})
	
	sets.midcast['Requiem'] = set_combine(sets.midcast['Lullaby'],{
		body="Minstrel's Coat",hands="Brd. Cuffs +1",ring1="Nereid Ring",ring2="Nereid Ring",
		legs="Choral Cannions",feet="Oracle's Pigaches"})
	
	sets.midcast['Threnody'] = set_combine(sets.midcast['Lullaby'],{
		body="Minstrel's Coat",hands="Brd. Cuffs +1",ring1="Nereid Ring",ring2="Nereid Ring",
		legs="Choral Cannions",feet="Oracle's Pigaches"})
        
        sets.midcast.Cure = {main="Chatoyant Staff",
	        head="Walahra Turban",neck="Fylgja Torque +1",ear1="Novia Earring",ear2="Geist Earring",
	        body="Kirin's Osode",hands="Blessed Mitts",ring1="Aqua Ring",ring2="Aqua Ring",
	        back="",waist="Cleric Belt",legs="Blessed Trousers",feet="Blessed Pumps"}
	        
        sets.midcast['Stoneskin'] = set_combine(sets.MND,{head="Walahra turban",waist="Velocious belt"})
     
        -- Weaponskill sets
        -- Default set for any weaponskill that isn't any more specifically defined
        sets.precast.WS = {
		head=""}

        -- Specific weaponskill sets. Uses the base set if an appropriate WSMod version isn't found.
        sets.precast.WS['Hexa Strike'] = set_combine(sets.precast.WS, {neck="Soil Gorget",waist="Potent Belt",legs="Byakko's Haidate"})
        sets.precast.WS['True Strike'] = set_combine(sets.precast.WS, {feet="Chaos Sollerets",waist="Potent Belt"})
        sets.precast.WS['Retrobution'] = set_combine(sets.precast.WS, {neck="Soil Gorget",waist="Twilight Belt",legs="Byakko's Haidate"})
        sets.precast.WS['Full Swing'] = set_combine(sets.precast.WS, {neck="Soil Gorget",waist="Twilight Belt",legs="Byakko's Haidate"})
        sets.precast.WS['Spirit Taker'] = set_combine(sets.precast.WS, {neck="Soil Gorget",waist="Twilight Belt",legs="Byakko's Haidate"})
        
        -- Midcast Sets
        sets.midcast.Divine = {
		head=""}
       		                
        -- Specific spells
        sets.midcast.Haste = {
        	head="Walahra Turban",
        	hands="Dusk Gloves",ring1="Blitz Ring",
        	waist="Velocious Belt",feet="Dusk Ledelsens"}
       
        -- Idle sets
        sets.idle = {
        	main="Terra's Staff",
        	head="Walahra Turban",neck="Chocobo whistle",
        	body="Dalmatica",ring1="Vivian Ring",ring2="Tamas Ring"}
        	
	sets.idle.Town = set_combine(sets.idle,{ring1="Warp ring",back="Nexus cape"})
		
	-- Resting sets
	sets.resting = {
		main="Chatoyant Staff",
		head="Mirror Tiara",ear1="Relaxing Earring",
		body="Oracle's Robe",hands="Oracle's Gloves",ring1="Star Ring",ring2="Star Ring",
		waist="Qiqirn Sash",legs="Oracle's Braconi",feet="Numerist Pumps"
		}
        
        -- Defense sets
        sets.defense.PDT = {}

        sets.defense.MDT = {}
        
        sets.Kiting = {feet="Blood Cuisses"}
        
        -- Souleater set
        sets.SE = {head="Chaos Burgeonet"}

        -- Engaged sets

        -- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
        -- sets if more refined versions aren't defined.
        -- If you create a set with both offense and defense modes, the offense mode should be first.
        -- EG: sets.engaged.Dagger.Accuracy.Evasion
        
        -- Normal melee group
        sets.engaged = {
		head="Walahra Turban",neck="Peacock Amulet",ear1="Assault Earring",ear2="Fowling Earring",
		body="Demon's Harness",hands="Dusk Gloves",ring1="Sniper's Ring +1",ring2="Sniper's Ring",
		back="Cerberus Mantle",waist="Velocious Belt",legs="Onyx Cuisses",feet="Dusk Ledelsens"}

end

-------------------------------------------------------------------------------------------------------------------
-- Obi and grip handling
-------------------------------------------------------------------------------------------------------------------

function job_post_midcast(spell, action, spellMap, eventArgs)
	-- Apply Obi
	if spell.skill == 'Elemental Magic' then 
		if spell.element == world.weather_element or spell.element == world.day_element then
			equip(sets.obi[spell.element])
		end
	end
	
	if spellMap == 'Cure' then
		if not (world.weather_element == 'Dark' or world.day_element == 'Dark') then
			equip(sets.obi[spell.element])
		end
	end
	
end

function job_status_change(new,old)

	if new == 'Engaged' then
		disable("main","sub","range","ammo")
	else
		enable("main","sub","range","ammo")
	end

end

-------------------------------------------------------------------------------------------------------------------
-- Job stuff
-------------------------------------------------------------------------------------------------------------------

function select_default_macro_book()
        -- Default macro set/book
	    if player.sub_job == 'WHM' then
	    	set_macro_page(1, 1)
		add_to_chat('Main job BRD: Macro Book 1.')
		add_to_chat('Sub job WHM: Macro Page 1.')
	    elseif player.sub_job == 'NIN' then
	    	set_macro_page(3, 1)
		add_to_chat('Main job BRD: Macro Book 1.')
		add_to_chat('Sub job NIN: Macro Page 3.')
	    end
end