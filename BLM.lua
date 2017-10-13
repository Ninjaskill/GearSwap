-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

	-- Load and initialize the include file.
	include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()

end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	state.OffenseMode:options('Normal')
	state.RangedMode:options('Normal')
	state.HybridMode:options('Normal')
	state.WeaponskillMode:options('Normal')
	state.CastingMode:options('Normal', 'SemiResistant', 'FullResistant')
	state.IdleMode:options('Normal', 'Refresh')
	state.RestingMode:options('Normal')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	
	send_command('bind f9 gs c cycle CastingMode')
	
        select_default_macro_book()
end


-- Called when this job file is unloaded (eg: job change)
function user_unload()

end

function init_gear_sets()

	--------------------------------------
        -- Start defining the sets
        --------------------------------------
        
        -- Precast Sets
        
				
        -- Fast cast sets for spells
        sets.precast.FC = {body="Marduk's Jubbah",ear2="Loquacious Earring",back="Veela Cape",feet="Rostrum Pumps"}
        sets.precast.FC.Cure = {body="Marduk's Jubbah",ear2="Loquacious Earring",back="Veela Cape",feet="Cure Clogs"}
        sets.midcast.Cure = {
	        main="Chatoyant Staff",head="Walahra Turban",neck="Ajari Necklace",ear1="Geist Earring",ear2="Geist Earring",
	        body="Noble's Tunic",hands="Blessed Mitts",ring1="Star Ring",ring2="Star Ring",
	        back="Rainbow Cape",waist="Headlong Belt",legs="Blessed Trousers",feet="Blessed Pumps"}
     
        -- Weaponskill sets
        -- Default set for any weaponskill that isn't any more specifically defined
        sets.precast.WS = {
		head=""}

        -- Specific weaponskill sets. Uses the base set if an appropriate WSMod version isn't found.
        sets.precast.WS['Hexa Strike'] = set_combine(sets.precast.WS, {neck="Soil Gorget",waist="Potent Belt",legs="Byakko's Haidate"})
        
        -- Midcast Sets
   	 sets.midcast['Enfeebling Magic'] = {
   	 	head="Igqira Tiara",neck="Spider Torque",body="Wizard's Coat",legs="Igqira Lappas"}
        
    	sets.midcast.ElementalEnfeeble = sets.midcast['Enfeebling Magic']

	sets.midcast['Elemental Magic'] = {ammo="Phantom Tathlum",
        	head="Demon Helm",neck="Lmg. Medallion +1",ear1="Abyssal Earring",ear2="Moldavite Earring",
	        body="Igqira Weskit",hands="Zenith Mitts",ring1="Snow Ring",ring2="Tamas Ring",
	        back="Hecate's Cape",legs="Mahatma Slops",feet="Sorcerer's Sabots +1"}
	            	
	sets.midcast['Elemental Magic'].SemiResistant = {ammo="Phantom Tathlum",
        	head="Src. Petasos +1",neck="Lmg. Medallion +1",ear1="Abyssal Earring",ear2="Moldavite Earring",
	        body="Igqira Weskit",hands="Zenith Mitts",ring1="Snow Ring",ring2="Tamas Ring",
	        back="Hecate's Cape",legs="Mahatma Slops",feet="Sorcerer's Sabots +1"}
	        
	sets.midcast['Elemental Magic'].FullResistant = {ammo="Phantom Tathlum",
        	head="Src. Petasos +1",neck="Lmg. Medallion +1",ear1="Abyssal Earring",ear2="Moldavite Earring",
	        body="Igqira Weskit",hands="Wizard's Gloves",ring1="Snow Ring",ring2="Tamas Ring",
	        back="Hecate's Cape",legs="Mahatma Slops",feet="Sorcerer's Sabots +1"}
	
	sets.waist = {waist="Sorcerer's Belt"}
	
	sets.Staff = {}
		sets.Staff.Fire = {main=" Staff"} 
		sets.Staff.Earth = {main=" Staff"}
		sets.Staff.Water = {main=" Staff"}
		sets.Staff.Wind = {main=" Staff"}
		sets.Staff.Ice = {main="Chatoyant Staff"}
		sets.Staff.Lightning = {main="Chatoyant Staff"}
		sets.Staff.Light = {main=" Staff"}
		sets.Staff.Dark = {main=" Staff"}

	sets.obi = {
		Fire = {waist="Karin Obi"},
		Earth = {waist="Dorin Obi"},
		Water = {waist="Suirin Obi"},
		Wind = {waist="Furin Obi"},
		Ice = {waist="Hyorin Obi"},
		Lightning = {waist="Rairin Obi"},
		Light = {waist="Korin Obi"},
		Dark = {waist="Anrin Obi"},
		    }

	sets.midcast.Sneak = {
		back="Skulker's Cape"}
		
	sets.midcast.Invisible = sets.midcast.Sneak
		
        sets.midcast.Enhancing = {
		neck="Enhancing Torque",ear2="Augment. Earring",back="Merciful Cape",feet="Healer's Duckbills"}
		
        sets.midcast.Stoneskin = {
		main="Kirin's Pole",neck="Enhancing Torque",ear2="Augment. Earring",back="Merciful Cape",feet="Healer's Duckbills"}

        -- Idle sets
        sets.idle = {
        	main="Terra's Staff",head="Src. Petasos +1",neck="Chocobo Whistle",body="Dalmatica"}
        	
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
        
        sets.Kiting = {feet="Herald Gaiters"}
        
        -- Engaged sets
        

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for casting events.
-------------------------------------------------------------------------------------------------------------------
  
        -- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
    function job_midcast(spell, action, spellMap, eventArgs)               
	    if spell.skill == 'Elemental Magic' then
            equip(sets.waist)
    end
	    if spell.element == 'Lightning' or 'Water' or 'Fire' or 'Ice' or 'Wind' or 'Earth' or 'Dark' or 'Light' then
            equip(sets.Staff[spell.element])
    end
	    if spell.element == world.weather_element or spell.element == world.day_element then
            equip(sets.obi[spell.element])
    end
    end
    
   
-------------------------------------------------------------------------------------------------------------------
-- Sorc ring and Uggly Pendant
-------------------------------------------------------------------------------------------------------------------

function midcast(spell)
    if spell.skill == 'Elemental Magic' and not hnmList:contains(player.target.name) then
        equip(sets.midcast.nuke)
        if player.hpp < 76 and player.tp < 100 then 
            equip({ring1="Sorcerer's Ring"})
            add_to_chat(8, "Equipping Sorcerer's Ring for "..spell.english)
        end
        if player.mpp < 50 then
            equip({neck="Uggalepih Pendant"})
        end
    end      -- end elemental magic
end

-------------------------------------------------------------------------------------------------------------------
-- Job stuff
-------------------------------------------------------------------------------------------------------------------

function select_default_macro_book()
        -- Default macro set/book
	    if player.sub_job == 'RDM' then
	    	set_macro_page(1, 3)
		add_to_chat('Main job BLM: Macro Book 1.')
		add_to_chat('Sub job RDM: Macro Page 1.')
	    elseif player.sub_job == 'THF' then
	    	set_macro_page(1, 3)
		add_to_chat('Main job BLM: Macro Book 1.')
		add_to_chat('Sub job THF: Macro Page 1.')
	    end
end