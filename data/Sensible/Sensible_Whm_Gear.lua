-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant','SIRD','DT')
    state.IdleMode:options('Normal','PDT','MDT')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','MeleeWeapons')
	state.WeaponskillMode:options('Normal','Fodder')

	gear.fs_jse_back = {name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}}
	gear.nuke_jse_back = {name="Alaunus's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}}
	gear.wsd_jse_back = {name="Alaunus's Cape",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}

	-- gear.obi_cure_waist = "Austerity Belt +1"
	-- gear.obi_cure_back = "Alaunus's Cape"

	-- gear.obi_nuke_waist = "Sekhmet Corset"
	-- gear.obi_high_nuke_waist = "Yamabuki-no-Obi"
	-- gear.obi_nuke_back = "Toro Cape"

		-- Additional local binds
	send_command('bind ^` input /ma "Arise" <t>')
	send_command('bind !` input /ja "Penury" <me>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^@!` gs c toggle AutoCaress')
	send_command('bind ^backspace input /ja "Sacrosanctity" <me>')
	send_command('bind @backspace input /ma "Aurora Storm" <me>')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation.
	send_command('bind !backspace input /ja "Accession" <me>')
	send_command('bind != input /ja "Sublimation" <me>')
	send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')
	send_command('bind ^\\\\ input /ma "Protectra V" <me>')
	send_command('bind @\\\\ input /ma "Shellra V" <me>')
	send_command('bind !\\\\ input /ma "Reraise IV" <me>')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

	-- Weapons sets
	sets.weapons.MeleeWeapons = {main="Tishtrya",sub="Genmei Shield"}
	
    sets.buff.Sublimation = {} -- waist="Embla Sash"
    sets.buff.DTSublimation = {} -- waist="Embla Sash"
	
    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {main="Gada",sub="Genmei Shield",ammo="Impatiens", -- Chanter's Shield
		head="Nahtirah Hat",neck="Clr. Torque +2",ear1="Loquac. Earring",ear2="Malignance Earring", 
		body="Inyanga Jubbah +2",hands="Fanatic Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
		back=gear.fs_jse_back,waist="Witful Belt",legs="Aya. Cosciales +2",feet="Regal Pumps +1"} -- Embla Sash
		
    --sets.precast.FC.DT = {main="Gada",sub="Genmei Shield",ammo="Impatiens",
	--	head="Nahtirah Hat",neck="Clr. Torque +2",ear1="Loquac. Earring",ear2="Malignance Earring",
	--	body="Inyanga Jubbah +2",hands="Fanatic Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
	--	back=gear.fs_jse_back,waist="Witful Belt",legs="Aya. Cosciales +2",feet="Regal Pumps +1"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs="Ebers Pant. +2"})

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']
	
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {ear2="Mendi. Earring",legs="Ebers Pant. +2",feet="Vanya Clogs"})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.CureSolace = sets.precast.FC.Cure
	
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Bliaut +2"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}

    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Hasty Pinion +1",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Ethereal Earring",
		body="Witching Robe",hands="Ebers Mitts +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Alaunus's Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Ebers Duckbills +1"}
		
    sets.precast.WS.Fodder = {ammo="Hasty Pinion +1",
        head="Befouled Crown",neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Ethereal Earring",
		body="Witching Robe",hands="Ebers Mitts +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Alaunus's Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Ebers Duckbills +1"}

    sets.precast.WS.Dagan = {ammo="Ghastly Tathlum +1",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Ethereal Earring",
		body="Witching Robe",hands="Ebers Mitts +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Alaunus's Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Ebers Duckbills +1"}
		
	sets.MaxTP = {}
	sets.MaxTP.Dagan = {}

    --sets.precast.WS['Flash Nova'] = {}

    --sets.precast.WS['Mystic Boon'] = {}

    -- Midcast Sets

    sets.Kiting = {}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {}
	sets.TPEat = {neck="Chrys. Torque"}
	sets.DayIdle = {}
	sets.NightIdle = {back="Umbra Cape"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}

	-- Conserve Mp set for spells that don't need anything else, for set_combine.
	
	sets.ConserveMP = {}
		
	sets.midcast.Teleport = sets.ConserveMP
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {main="Marin Staff +1",sub="Enki Strap",neck="Mizu. Kubikazari",ring1="Mujin Band",ring2="Locus Ring"}
	
    sets.midcast.FastRecast = {main="Gada",sub="Genmei Shield",ammo="Impatiens", -- Chanter's Shield
		head="Nahtirah Hat",neck="Clr. Torque +2",ear1="Loquac. Earring",ear2="Malignance Earring", 
		body="Inyanga Jubbah +2",hands="Fanatic Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
		back=gear.fs_jse_back,waist="Witful Belt",legs="Aya. Cosciales +2",feet="Regal Pumps +1"} -- Embla Sash
		
    -- Cure sets

	sets.midcast['Full Cure'] = sets.midcast.FastRecast
	
	sets.midcast.Cure = {main="Queller Rod",sub="Thuellaic Ecu +1",ammo="Clarus Stone",  -- Pemphredo Tathlum
		head="Theophany cap +2",neck="Clr. Torque +2",ear1="Mendi. Earring",ear2="Glorious Earring",
		body="Theo. Bliaut +2",hands="Theophany Mitts +2",ring1="Lebeche Ring",ring2="Janniston Ring",
		back="Alaunus's Cape",waist="Austerity Belt +1",legs="Ebers Pant. +2",feet="Theophany duckbills +2"}
		
	sets.midcast.CureSolace = {main="Queller Rod",sub="Thuellaic Ecu +1",ammo="Clarus Stone", -- Pemphredo Tathlum
		head="Theophany cap +2",neck="Clr. Torque +2",ear1="Mendi. Earring",ear2="Glorious Earring",
		body="Ebers Bliaut +2",hands="Theophany Mitts +2",ring1="Lebeche Ring",ring2="Janniston Ring",
		back="Alaunus's Cape",waist="Austerity Belt +1",legs="Ebers Pant. +2",feet="Theophany duckbills +2"}

	sets.midcast.LightWeatherCure = {main="Chatoyant Staff",sub="Curatio Grip",ammo="Clarus Stone", -- Pemphredo Tathlum
		head="Theophany cap +2",neck="Clr. Torque +2",ear1="Mendi. Earring",ear2="Glorious Earring",
		body="Theo. Bliaut +2",hands="Theophany Mitts +2",ring1="Lebeche Ring",ring2="Janniston Ring",
		back="Alaunus's Cape",waist="Hachirin-no-Obi",legs="Ebers Pant. +2",feet="Theophany duckbills +2"}

	sets.midcast.LightWeatherCureSolace = {main="Chatoyant Staff",sub="Curatio Grip",ammo="Clarus Stone", -- Pemphredo Tathlum
		head="Theophany cap +2",neck="Clr. Torque +2",ear1="Mendi. Earring",ear2="Glorious Earring",
		body="Ebers Bliaut +2",hands="Theophany Mitts +2",ring1="Lebeche Ring",ring2="Janniston Ring",
		back="Alaunus's Cape",waist="Hachirin-no-Obi",legs="Ebers Pant. +2",feet="Theophany duckbills +2"}
		
	sets.midcast.LightDayCureSolace = {main="Chatoyant Staff",sub="Curatio Grip",ammo="Clarus Stone", -- Pemphredo Tathlum
		head="Theophany cap +2",neck="Clr. Torque +2",ear1="Mendi. Earring",ear2="Glorious Earring",
		body="Ebers Bliaut +2",hands="Theophany Mitts +2",ring1="Lebeche Ring",ring2="Janniston Ring",
		back="Alaunus's Cape",waist="Hachirin-no-Obi",legs="Ebers Pant. +2",feet="Theophany duckbills +2"}

	sets.midcast.LightDayCure = {main="Chatoyant Staff",sub="Curatio Grip",ammo="Clarus Stone", -- Pemphredo Tathlum
		head="Theophany cap +2",neck="Clr. Torque +2",ear1="Mendi. Earring",ear2="Glorious Earring",
		body="Theo. Bliaut +2",hands="Theophany Mitts +2",ring1="Lebeche Ring",ring2="Janniston Ring",
		back="Alaunus's Cape",waist="Hachirin-no-Obi",legs="Ebers Pant. +2",feet="Theophany duckbills +2"}

	sets.midcast.Curaga = {main="Queller Rod",sub="Thuellaic Ecu +1",ammo="Clarus Stone", -- Pemphredo Tathlum
		head="Theophany cap +2",neck="Clr. Torque +2",ear1="Mendi. Earring",ear2="Glorious Earring",
		body="Theo. Bliaut +2",hands="Theophany Mitts +2",ring1="Lebeche Ring",ring2="Janniston Ring",
		back="Alaunus's Cape",waist="Austerity Belt +1",legs="Ebers Pant. +2",feet="Theophany duckbills +2"}
		
	sets.midcast.LightWeatherCuraga = {main="Chatoyant Staff",sub="Curatio Grip",ammo="Clarus Stone", -- Pemphredo Tathlum
		head="Theophany cap +2",neck="Clr. Torque +2",ear1="Mendi. Earring",ear2="Glorious Earring",
		body="Theo. Bliaut +2",hands="Theophany Mitts +2",ring1="Lebeche Ring",ring2="Janniston Ring",
		back="Alaunus's Cape",waist="Hachirin-no-Obi",legs="Ebers Pant. +2",feet="Theophany duckbills +2"}
		
	sets.midcast.LightDayCuraga = {main="Chatoyant Staff",sub="Curatio Grip",ammo="Clarus Stone", -- Pemphredo Tathlum
		head="Theophany cap +2",neck="Clr. Torque +2",ear1="Mendi. Earring",ear2="Glorious Earring",
		body="Theo. Bliaut +2",hands="Theophany Mitts +2",ring1="Lebeche Ring",ring2="Janniston Ring",
		back="Alaunus's Cape",waist="Hachirin-no-Obi",legs="Ebers Pant. +2",feet="Theophany duckbills +2"}

	sets.midcast.Cure.DT = {main="Queller Rod",sub="Genmei Shield",ammo="Clarus Stone", -- Pemphredo Tathlum
		head="Theophany cap +2",neck="Clr. Torque +2",ear1="Mendi. Earring",ear2="Glorious Earring",
		body="Theo. Bliaut +2",hands="Theophany Mitts +2",ring1="Lebeche Ring",ring2="Janniston Ring",
		back="Alaunus's Cape",waist="Austerity Belt +1",legs="Ebers Pant. +2",feet="Theophany duckbills +2"}
		
	--Melee Curesets are used whenever your Weapons state is set to anything but None.
	sets.midcast.MeleeCure = {ammo="Clarus Stone", -- Pemphredo Tathlum
		head="Theophany cap +2",neck="Clr. Torque +2",ear1="Mendi. Earring",ear2="Glorious Earring",
		body="Theo. Bliaut +2",hands="Kaykaus Cuffs",ring1="Lebeche Ring",ring2="Janniston Ring",
		back="Alaunus's Cape",waist="Austerity Belt +1",legs="Ebers Pant. +2",feet="Theophany duckbills +2"}
		
	sets.midcast.MeleeCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +2"})
	sets.midcast.MeleeLightWeatherCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +2",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +2",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightWeatherCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})

	sets.midcast.CureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +2"})
	sets.midcast.LightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +2",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +2",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.Curaga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCure.DT = set_combine(sets.midcast.Cure.DT, {})
	
	sets.midcast.MeleeCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +2"})
	sets.midcast.MeleeLightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +2",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +2",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})

	sets.midcast.Cursna = {main="Yagrush",sub="Thuellaic Ecu +1",ammo="Hasty Pinion +1",
		head="Vanya Hood",neck="Debilis Medallion",ear1="Beatific Earring",ear2="Ebers Earring",
		body="Ebers Bliaut +2",hands="Fanatic Gloves",ring1="Haoma's Ring",ring2="Haoma's Ring",
		back="Alaunus's Cape",waist="Bishop's Sash",legs="Th. Pantaloons +2",feet="Vanya Clogs"}

	sets.midcast.StatusRemoval = {main="Yagrush",sub="Thuellaic Ecu +1",ammo="Hasty Pinion +1",head="Ebers Cap +1",neck="Clr. Torque +2",back="Mending Cape"}
		
	sets.midcast.Erase = set_combine(sets.midcast.StatusRemoval, {neck="Clr. Torque +2"})

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
	sets.midcast['Enhancing Magic'] = {main="Gada",sub="Ammurapi Shield",ammo="Hasty Pinion +1",
		head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Augment. Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.fs_jse_back,waist="Olympus Sash",legs="Telchine Braconi",feet="Theo. Duckbills +2"}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})

	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {feet="Ebers Duckbills +1"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Ammurapi Shield",head="Chironic Hat",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})

	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {main="Bolelabunga",sub="Ammurapi Shield",
	head="Inyanga Tiara +2",body="Piety Bliaut +2",hands="Ebers Mitts +1",
	waist="Embla Sash",legs="Th. Pantaloons +2"})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Piety Duckbills +2"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Piety Duckbills +2"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Piety Pantaln. +2"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Piety Pantaln. +2"})
	
	sets.midcast.BarElement = {main="Beneficus",sub="Ammurapi Shield",ammo="Clarus Stone",
		head="Ebers Cap +1",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Augment. Earring",
		body="Ebers Bliaut +2",hands="Ebers Mitts +1",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Alaunus's Cape",waist="Olympus Sash",legs="Piety Pantaln. +2",feet="Ebers Duckbills +1"} -- Embla Sash

	sets.midcast.Impact = {}
		
	sets.midcast['Elemental Magic'] = {main="Marin Staff +1",sub="Enki Strap",ammo="Clarus Stone",
		head="Befouled Crown",neck="Incanter's Torque",ear1="Gwati Earring",ear2="Loquac. Earring",
		body="Witching Robe",hands="Fanatic Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Alaunus's Cape",waist="Hachirin-no-Obi",legs="Vanya Slops",feet="Gende. Galosh. +1"}

	sets.midcast['Elemental Magic'].Resistant = {main="Marin Staff +1",sub="Enki Strap",ammo="Clarus Stone",
		head="Befouled Crown",neck="Incanter's Torque",ear1="Gwati Earring",ear2="Loquac. Earring",
		body="Witching Robe",hands="Fanatic Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Alaunus's Cape",waist="Hachirin-no-Obi",legs="Vanya Slops",feet="Gende. Galosh. +1"}

	sets.midcast['Divine Magic'] = {main="Marin Staff +1",sub="Enki Strap",ammo="Clarus Stone",
		head="Befouled Crown",neck="Incanter's Torque",ear1="Gwati Earring",ear2="Loquac. Earring",
		body="Witching Robe",hands="Fanatic Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Alaunus's Cape",waist="Hachirin-no-Obi",legs="Vanya Slops",feet="Gende. Galosh. +1"}
		
	sets.midcast.Holy = {main="Marin Staff +1",sub="Enki Strap",ammo="Clarus Stone",
		head="Befouled Crown",neck="Incanter's Torque",ear1="Gwati Earring",ear2="Loquac. Earring",
		body="Witching Robe",hands="Fanatic Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Alaunus's Cape",waist="Hachirin-no-Obi",legs="Vanya Slops",feet="Gende. Galosh. +1"}

	sets.midcast['Dark Magic'] = {main="Marin Staff +1",sub="Enki Strap",ammo="Clarus Stone",
		head="Befouled Crown",neck="Incanter's Torque",ear1="Gwati Earring",ear2="Loquac. Earring",
		body="Witching Robe",hands="Fanatic Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Alaunus's Cape",waist="Hachirin-no-Obi",legs="Vanya Slops",feet="Gende. Galosh. +1"}

    sets.midcast.Drain = {main="Marin Staff +1",sub="Enki Strap",ammo="Clarus Stone",
		head="Befouled Crown",neck="Incanter's Torque",ear1="Gwati Earring",ear2="Loquac. Earring",
		body="Witching Robe",hands="Fanatic Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Alaunus's Cape",waist="Hachirin-no-Obi",legs="Vanya Slops",feet="Gende. Galosh. +1"}

    sets.midcast.Drain.Resistant = {main="Marin Staff +1",sub="Enki Strap",ammo="Clarus Stone",
		head="Befouled Crown",neck="Incanter's Torque",ear1="Gwati Earring",ear2="Loquac. Earring",
		body="Witching Robe",hands="Fanatic Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Alaunus's Cape",waist="Hachirin-no-Obi",legs="Vanya Slops",feet="Gende. Galosh. +1"}

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

	sets.midcast.Stun = {main="Gada",sub="Genmei Shield",ammo="Hasty Pinion +1",
		head="Nahtirah Hat",neck="Clr. Torque +2",ear1="Loquac. Earring",
		body="Inyanga Jubbah +2",hands="Gende. Gages",ring1="Kishar Ring",ring2="Lebeche Ring",
		back="Alaunus's Cape",waist="Witful Belt",legs="Aya. Cosciales +2",feet="Regal Pumps +1"}

	sets.midcast.Stun.Resistant = {main="Gada",sub="Genmei Shield",ammo="Hasty Pinion +1",
		head="Nahtirah Hat",neck="Clr. Torque +2",ear1="Loquac. Earring",
		body="Inyanga Jubbah +2",hands="Gende. Gages",ring1="Kishar Ring",ring2="Lebeche Ring",
		back="Alaunus's Cape",waist="Witful Belt",legs="Aya. Cosciales +2",feet="Regal Pumps +1"}
		
	sets.midcast.Dispel = {main="Marin Staff +1",sub="Enki Strap",ammo="Clarus Stone",
		head="Befouled Crown",neck="Incanter's Torque",ear1="Gwati Earring",ear2="Loquac. Earring",
		body="Witching Robe",hands="Fanatic Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Alaunus's Cape",waist="Hachirin-no-Obi",legs="Vanya Slops",feet="Gende. Galosh. +1"}
		
	sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {})

	sets.midcast['Enfeebling Magic'] = {main="Marin Staff +1",sub="Enki Strap",ammo="Clarus Stone",
		head="Befouled Crown",neck="Incanter's Torque",ear1="Gwati Earring",ear2="Loquac. Earring",
		body="Witching Robe",hands="Fanatic Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Alaunus's Cape",waist="Hachirin-no-Obi",legs="Vanya Slops",feet="Gende. Galosh. +1"}

	sets.midcast['Enfeebling Magic'].Resistant = {main="Marin Staff +1",sub="Enki Strap",ammo="Clarus Stone",
		head="Befouled Crown",neck="Incanter's Torque",ear1="Gwati Earring",ear2="Loquac. Earring",
		body="Witching Robe",hands="Fanatic Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Alaunus's Cape",waist="Hachirin-no-Obi",legs="Vanya Slops",feet="Gende. Galosh. +1"}
		
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = sets.midcast['Enfeebling Magic']
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = sets.midcast['Enfeebling Magic']

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

    -- Sets to return to when not performing an action.

    -- Resting sets
	sets.resting = {main="Chatoyant Staff",sub="Clemency Grip",ammo="Homiliary",
		head="Befouled Crown",neck="Chrys. Torque",ear1="Moonshade Earring",ear2="Ethereal Earring",
		body="Ebers Bliaut +2",hands="Ebers Mitts +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Alaunus's Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Ebers Duckbills +1"}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {main="Queller Rod",sub="Genmei Shield",ammo="Homiliary",
		head="Inyanga Tiara +2",neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Ethereal Earring",
		body="Theo. Bliaut +2",hands="Inyan. Dastanas +2",ring1="Defending Ring",ring2="Inyanga Ring",
		back="Alaunus's Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Inyan. Crackows +2"}

	sets.idle.PDT = {main="Mafic Cudgel ",sub="Genmei Shield",ammo="Homiliary",
		head="Bunzi's Hat",neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Ethereal Earring",
		body="Bunzi's Robe",hands="Bunzi's Gloves",ring1="Defending Ring",ring2="Dark Ring",
		back="Alaunus's Cape",waist="Fucho-no-obi",legs="Bunzi's Pants",feet="Bunzi's Sabots"}
		
	sets.idle.MDT = {main="Queller Rod",sub="Genmei Shield",ammo="Homiliary",
		head="Bunzi's Hat",neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Ethereal Earring",
		body="Bunzi's Robe",hands="Bunzi's Gloves",ring1="Defending Ring",ring2="Inyanga Ring",
		back="Alaunus's Cape",waist="Flax Sash",legs="Bunzi's Pants",feet="Bunzi's Sabots"}

    -- Defense sets

	sets.defense.PDT = {main="Queller Rod",sub="Genmei Shield",ammo="Homiliary",
		head="Bunzi's Hat",neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Ethereal Earring",
		body="Bunzi's Hat",hands="Ebers Mitts +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Alaunus's Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Ebers Duckbills +1"}

	sets.defense.MDT = {main="Mafic Cudgel ",sub="Genmei Shield",ammo="Homiliary",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Ethereal Earring",
		body="Witching Robe",hands="Ebers Mitts +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Alaunus's Cape",waist="Flax Sash",legs="Assid. Pants +1",feet="Ebers Duckbills +1"}

    sets.defense.MEVA = {main="Queller Rod",sub="Genmei Shield",ammo="Homiliary",
		head="Befouled Crown",neck="Warder's Charm +1",ear1="Moonshade Earring",ear2="Ethereal Earring",
		body="Witching Robe",hands="Ebers Mitts +1",ring1="Defending Ring",ring2="Inyanga Ring",
		back="Alaunus's Cape",waist="Flax Sash",legs="Assid. Pants +1",feet="Ebers Duckbills +1"}
		
		-- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Basic set for if no TP weapon is defined.
    sets.engaged = {ammo="Homiliary",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Ethereal Earring",
		body="Witching Robe",hands="Ebers Mitts +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Alaunus's Cape",waist="Flax Sash",legs="Assid. Pants +1",feet="Ebers Duckbills +1"}

    sets.engaged.Acc = {}

	sets.engaged.DW = {}

    sets.engaged.DW.Acc = {}

		-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers Mitts +1",back="Mending Cape"}

	sets.HPDown = {}

	sets.HPCure = {}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 4)
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 001')
end

autows_list = {['DualWeapons']='Realmrazer',['MeleeWeapons']='Realmrazer'}