-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant')
    state.IdleMode:options('Normal','PDT','MDT','MEVA')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','DualWeapons','Maxentius')
	state.WeaponskillMode:options('Normal','Fodder')
	
	default_weapons = 'Maxentius'
	default_dual_weapons = 'DualWeapons'
	
	autows_list = {['DualWeapons']='Realmrazer',['Maxentius']='Realmrazer'}

	-- Reforged Gear
	gear.artifact_head = "Theophany cap +2"
	gear.artifact_body = "Theo. Bliaut +2"
	gear.artifact_hands = "Theophany Mitts +2"
	gear.artifact_legs = "Th. Pantaloons +2"
	gear.artifact_feet = "Theophany duckbills +2"

	gear.relic_head = "Ebers Cap +1"
	gear.relic_body = "Ebers Bliaut +2"
	gear.relic_hands = "Ebers Mitts +1"
	gear.relic_legs = "Ebers Pant. +2"
	gear.relic_feet = "Ebers Duckbills +1"

    -- JSE CAPES
	gear.fs_jse_back = {name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}}
	gear.nuke_jse_back = {name="Alaunus's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}}
	gear.wsd_jse_back = {name="Alaunus's Cape",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}

		-- Additional local binds
	send_command('bind @` gs c cycle ElementalMode')
	send_command('bind ^` gs c scholar dark')
	send_command('bind !` gs c scholar light')
	send_command('bind ^@!` gs c toggle AutoCaress')
	send_command('bind ^backspace input /ja "Sacrosanctity" <me>')
	send_command('bind !backspace input /ja "Afflatus Solace" <me>')
	send_command('bind @backspace input /ja "Afflatus Misery" <me>')
	send_command('bind ^\\\\ input /ma "Protectra V" <me>')
	send_command('bind @\\\\ input /ma "Shellra V" <me>')
	send_command('bind !\\\\ input /ma "Reraise IV" <me>')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation.

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

	-- Weapons sets
	sets.weapons.Maxentius = {main="Tishtrya",sub="Genmei Shield"}
	-- MISSING: sub Daybreak
	sets.weapons.DualWeapons = {main="Tishtrya"}

    -- Precast Sets
	
    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Bliaut +2"}

	-- Waltz set (chr and vit)
    sets.precast.Waltz = {}

    -- Fast cast sets for spells
    sets.precast.FC = {main="Gada",sub="Genmei Shield",ammo="Impatiens",
		head="Nahtirah Hat",neck="Clr. Torque +2",ear1="Malignance Earring",ear2="Loquac. Earring",
		body="Inyanga Jubbah +2",hands="Fanatic Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
		back=gear.fs_jse_back,waist="Witful Belt",legs="Aya. Cosciales +2",feet="Regal Pumps +1"}
		
    sets.precast.FC.DT = {main="Gada",sub="Genmei Shield",ammo="Impatiens",
		head="Nahtirah Hat",neck="Clr. Torque +2",ear1="Malignance Earring",ear2="Loquac. Earring",
		body="Inyanga Jubbah +2",hands="Fanatic Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
		back=gear.fs_jse_back,waist="Witful Belt",legs="Aya. Cosciales +2",feet="Regal Pumps +1"}

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs=gear.relic_legs})
    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {ear1="Mendi. Earring",ear2="Loquac. Earring",legs=gear.relic_legs,feet="Vanya Clogs"})
    sets.precast.FC.Curaga = sets.precast.FC.Cure
	sets.precast.FC.CureSolace = sets.precast.FC.Cure
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Crepuscular Cloak"})
	-- MISSING: main Daybreak
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {sub="Genmei Shield"})

    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Hasty Pinion +1",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Ethereal Earring",
		body="Witching Robe",hands=gear.relic_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Alaunus's Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet=gear.relic_feet}

	-- MISSING: ammo Ghastly Tathlum +1
    sets.precast.WS['Flash Nova'] = {
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Ethereal Earring",
		body="Witching Robe",hands=gear.relic_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Alaunus's Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet=gear.relic_feet}
    sets.precast.WS['Mystic Boon'] = {}
		
	sets.MaxTP = {}
	sets.MaxTP.Myrkr = {}
	sets.MaxTP.Dagan = {}

	-- Midcast Sets
    sets.midcast.FastRecast = {main="Gada",sub="Genmei Shield",ammo="Impatiens",
		head="Nahtirah Hat",neck="Clr. Torque +2",ear1="Malignance Earring",ear2="Loquac. Earring",
		body="Inyanga Jubbah +2",hands="Fanatic Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
		back=gear.fs_jse_back,waist="Witful Belt",legs="Aya. Cosciales +2",feet="Regal Pumps +1"}
		
	sets.midcast.Raise = sets.midcast.FastRecast

    -- Cure sets

	sets.midcast['Full Cure'] = sets.midcast.FastRecast
	
	sets.midcast.Cure = {main="Queller Rod",sub="Thuellaic Ecu +1",ammo="Clarus Stone",
		head=gear.artifact_head,neck="Clr. Torque +2",ear1="Mendi. Earring",ear2="Glorious Earring",
		body=gear.artifact_body,hands=gear.artifact_hands,ring1="Lebeche Ring",ring2="Janniston Ring",
		back="Alaunus's Cape",waist="Austerity Belt +1",legs=gear.relic_legs,feet=gear.artifact_feet}
		
	sets.midcast.CureSolace = {main="Queller Rod",sub="Thuellaic Ecu +1",ammo="Clarus Stone",
		head=gear.artifact_head,neck="Clr. Torque +2",ear1="Mendi. Earring",ear2="Glorious Earring",
		body=gear.relic_body,hands=gear.artifact_hands,ring1="Lebeche Ring",ring2="Janniston Ring",
		back="Alaunus's Cape",waist="Austerity Belt +1",legs=gear.relic_legs,feet=gear.artifact_feet}

	sets.midcast.LightWeatherCure = {main="Chatoyant Staff",sub="Curatio Grip",ammo="Clarus Stone",
		head=gear.artifact_head,neck="Clr. Torque +2",ear1="Mendi. Earring",ear2="Glorious Earring",
		body=gear.artifact_body,hands=gear.artifact_hands,ring1="Lebeche Ring",ring2="Janniston Ring",
		back="Alaunus's Cape",waist="Hachirin-no-Obi",legs=gear.relic_legs,feet=gear.artifact_feet}

	sets.midcast.LightWeatherCureSolace = {main="Chatoyant Staff",sub="Curatio Grip",ammo="Clarus Stone",
		head=gear.artifact_head,neck="Clr. Torque +2",ear1="Mendi. Earring",ear2="Glorious Earring",
		body=gear.relic_body,hands=gear.artifact_hands,ring1="Lebeche Ring",ring2="Janniston Ring",
		back="Alaunus's Cape",waist="Hachirin-no-Obi",legs=gear.relic_legs,feet=gear.artifact_feet}
		
	sets.midcast.LightDayCureSolace = {main="Chatoyant Staff",sub="Curatio Grip",ammo="Clarus Stone",
		head=gear.artifact_head,neck="Clr. Torque +2",ear1="Mendi. Earring",ear2="Glorious Earring",
		body=gear.relic_body,hands=gear.artifact_hands,ring1="Lebeche Ring",ring2="Janniston Ring",
		back="Alaunus's Cape",waist="Hachirin-no-Obi",legs=gear.relic_legs,feet=gear.artifact_feet}

	sets.midcast.LightDayCure = {main="Chatoyant Staff",sub="Curatio Grip",ammo="Clarus Stone",
		head=gear.artifact_head,neck="Clr. Torque +2",ear1="Mendi. Earring",ear2="Glorious Earring",
		body=gear.artifact_body,hands=gear.artifact_hands,ring1="Lebeche Ring",ring2="Janniston Ring",
		back="Alaunus's Cape",waist="Hachirin-no-Obi",legs=gear.relic_legs,feet=gear.artifact_feet}

	sets.midcast.Curaga = {main="Queller Rod",sub="Thuellaic Ecu +1",ammo="Clarus Stone",
		head=gear.artifact_head,neck="Clr. Torque +2",ear1="Mendi. Earring",ear2="Glorious Earring",
		body=gear.artifact_body,hands=gear.artifact_hands,ring1="Lebeche Ring",ring2="Janniston Ring",
		back="Alaunus's Cape",waist="Austerity Belt +1",legs=gear.relic_legs,feet=gear.artifact_feet}
		
	sets.midcast.LightWeatherCuraga = {main="Chatoyant Staff",sub="Curatio Grip",ammo="Clarus Stone",
		head=gear.artifact_head,neck="Clr. Torque +2",ear1="Mendi. Earring",ear2="Glorious Earring",
		body=gear.artifact_body,hands=gear.artifact_hands,ring1="Lebeche Ring",ring2="Janniston Ring",
		back="Alaunus's Cape",waist="Hachirin-no-Obi",legs=gear.relic_legs,feet=gear.artifact_feet}
		
	sets.midcast.LightDayCuraga = {main="Chatoyant Staff",sub="Curatio Grip",ammo="Clarus Stone",
		head=gear.artifact_head,neck="Clr. Torque +2",ear1="Mendi. Earring",ear2="Glorious Earring",
		body=gear.artifact_body,hands=gear.artifact_hands,ring1="Lebeche Ring",ring2="Janniston Ring",
		back="Alaunus's Cape",waist="Hachirin-no-Obi",legs=gear.relic_legs,feet=gear.artifact_feet}

	sets.midcast.Cure.DT = {main="Queller Rod",sub="Genmei Shield",ammo="Clarus Stone",
		head=gear.artifact_head,neck="Clr. Torque +2",ear1="Mendi. Earring",ear2="Glorious Earring",
		body=gear.artifact_body,hands=gear.artifact_hands,ring1="Lebeche Ring",ring2="Janniston Ring",
		back="Alaunus's Cape",waist="Austerity Belt +1",legs=gear.relic_legs,feet=gear.artifact_feet}
		
	--Melee Curesets are used whenever your Weapons state is set to anything but None.
	-- MISSING: hands Kaykaus Cuffs
	sets.midcast.MeleeCure = {ammo="Clarus Stone",
		head=gear.artifact_head,neck="Clr. Torque +2",ear1="Mendi. Earring",ear2="Glorious Earring",
		body=gear.artifact_body,ring1="Lebeche Ring",ring2="Janniston Ring",
		back="Alaunus's Cape",waist="Austerity Belt +1",legs=gear.relic_legs,feet=gear.artifact_feet}
		
	sets.midcast.MeleeCureSolace = set_combine(sets.midcast.MeleeCure, {body=gear.relic_body})
	sets.midcast.MeleeLightWeatherCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace = set_combine(sets.midcast.MeleeCure, {body=gear.relic_body,waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace = set_combine(sets.midcast.MeleeCure, {body=gear.relic_body,waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightWeatherCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})

	sets.midcast.CureSolace.DT = set_combine(sets.midcast.Cure.DT, {body=gear.relic_body})
	sets.midcast.LightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body=gear.relic_body,waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body=gear.relic_body,waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.Curaga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCure.DT = set_combine(sets.midcast.Cure.DT, {})
	
	sets.midcast.MeleeCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body=gear.relic_body})
	sets.midcast.MeleeLightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body=gear.relic_body,waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body=gear.relic_body,waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	
	--Situational Healing Sets
	-- MISSING: waist Gishdubar Sash
	sets.Self_Healing = {ring1="Kunaji Ring",ring2="Asklepian Ring"}
	-- MISSING: waist Gishdubar Sash
	sets.Cure_Received = {ring1="Kunaji Ring",ring2="Asklepian Ring"}

	sets.midcast.Cursna = {main="Yagrush",sub="Thuellaic Ecu +1",ammo="Hasty Pinion +1",
		head="Vanya Hood",neck="Debilis Medallion",ear1="Beatific Earring",ear2="Ebers Earring",
		body=gear.relic_body,hands="Fanatic Gloves",ring1="Haoma's Ring",ring2="Haoma's Ring",
		back="Alaunus's Cape",waist="Bishop's Sash",legs=gear.artifact_legs,feet="Vanya Clogs"}

	-- MISSING: back Mending Cape
	sets.midcast.StatusRemoval = {main="Yagrush",sub="Thuellaic Ecu +1",ammo="Hasty Pinion +1",head=gear.relic_head,neck="Clr. Torque +2"}
		
	-- MISSING: main Daybreak
	sets.midcast.StatusRemoval.DT = set_combine(sets.midcast.Cure.DT, {sub="Genmei Shield"})

	sets.midcast.Erase = set_combine(sets.midcast.StatusRemoval, {neck="Clr. Torque +2"})
	sets.midcast.Erase.DT = set_combine(sets.midcast.StatusRemoval.DT, {neck="Clr. Torque +2"})

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
	-- MISSING: head Telchine Cap
	-- MISSING: ear2 Augment. Earring
	sets.midcast['Enhancing Magic'] = {main="Gada",sub="Ammurapi Shield",ammo="Hasty Pinion +1",
		neck="Incanter's Torque",ear1="Andoaa Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.fs_jse_back,waist="Olympus Sash",legs="Telchine Braconi",feet="Theo. Duckbills +2"}

	-- MISSING: waist Siegel Sash
	-- MISSING: legs Shedir Seraweels
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring"})
	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {feet=gear.relic_feet})
	-- MISSING: head Chironic Hat
	-- MISSING: hands Regal Cuffs
	-- MISSING: legs Shedir Seraweels
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Ammurapi Shield",waist="Emphatikos Rope"})
	-- MISSING: waist Embla Sash
	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {main="Bolelabunga",sub="Ammurapi Shield",
		head="Inyanga Tiara +2",body="Piety Bliaut +2",hands=gear.relic_hands,
		legs=gear.artifact_legs})
	sets.midcast.Regen.Duration = set_combine(sets.midcast['Enhancing Magic'], {hands=gear.relic_hands,legs=gear.artifact_legs})
	sets.midcast.Regen.Potency = {head="Inyanga Tiara +2"}
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Piety Duckbills +2"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Piety Duckbills +2"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Piety Pantaln. +2"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Piety Pantaln. +2"})
	-- MISSING: ear2 Augment. Earring
	sets.midcast.BarElement = {main="Beneficus",sub="Ammurapi Shield",ammo="Clarus Stone",
		head=gear.relic_head,neck="Incanter's Torque",ear1="Andoaa Earring",
		body=gear.relic_body,hands=gear.relic_hands,ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Alaunus's Cape",waist="Olympus Sash",legs="Piety Pantaln. +2",feet=gear.relic_feet}
	
	-- MISSING: neck Sroda Necklace
	sets.midcast.BarStatus = set_combine(sets.midcast['Enhancing Magic'], {})

	-- MISSING: back Grapevine Cape
	-- MISSING: waist Gishdubar Sash
	-- MISSING: feet Inspirited Boots
	sets.Self_Refresh = {}
	-- MISSING: back Grapevine Cape
	-- MISSING: waist Gishdubar Sash
	-- MISSING: feet Inspirited Boots
	sets.Refresh_Received = {}

	-- MISSING: body Crepuscular Cloak
	sets.midcast.Impact = {main="Marin Staff +1",sub="Enki Strap",ammo="Clarus Stone",
		head=empty,neck="Mizu. Kubikazari",ear1="Gwati Earring",ear2="Loquac. Earring",
		hands="Fanatic Gloves",ring1="Mujin Band",ring2="Locus Ring",
		back="Alaunus's Cape",waist="Hachirin-no-Obi",legs="Vanya Slops",feet="Gende. Galosh. +1"}
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
	sets.midcast.Repose = {main="Marin Staff +1",sub="Enki Strap",ammo="Clarus Stone",
		head="Befouled Crown",neck="Incanter's Torque",ear1="Gwati Earring",ear2="Loquac. Earring",
		body="Witching Robe",hands="Fanatic Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Alaunus's Cape",waist="Hachirin-no-Obi",legs="Vanya Slops",feet="Gende. Galosh. +1"}
	sets.midcast.Holy = {main="Marin Staff +1",sub="Enki Strap",ammo="Clarus Stone",
		head="Befouled Crown",neck="Incanter's Torque",ear1="Gwati Earring",ear2="Loquac. Earring",
		body="Witching Robe",hands="Fanatic Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Alaunus's Cape",waist="Hachirin-no-Obi",legs="Vanya Slops",feet="Gende. Galosh. +1"}
		
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {main="Marin Staff +1",sub="Enki Strap",neck="Mizu. Kubikazari",ring1="Mujin Band",ring2="Locus Ring"}
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

	-- MISSING: hands Gende. Gages
	sets.midcast.Stun = {main="Gada",sub="Genmei Shield",ammo="Hasty Pinion +1",
		head="Nahtirah Hat",neck="Clr. Torque +2",ear2="Loquac. Earring",
		body="Inyanga Jubbah +2",ring1="Lebeche Ring",ring2="Kishar Ring",
		back="Alaunus's Cape",waist="Witful Belt",legs="Aya. Cosciales +2",feet="Regal Pumps +1"}

	-- MISSING: hands Gende. Gages
	sets.midcast.Stun.Resistant = {main="Gada",sub="Genmei Shield",ammo="Hasty Pinion +1",
		head="Nahtirah Hat",neck="Clr. Torque +2",ear2="Loquac. Earring",
		body="Inyanga Jubbah +2",ring1="Lebeche Ring",ring2="Kishar Ring",
		back="Alaunus's Cape",waist="Witful Belt",legs="Aya. Cosciales +2",feet="Regal Pumps +1"}
	sets.midcast.Dispel = {main="Marin Staff +1",sub="Enki Strap",ammo="Clarus Stone",
		head="Befouled Crown",neck="Incanter's Torque",ear1="Gwati Earring",ear2="Loquac. Earring",
		body="Witching Robe",hands="Fanatic Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Alaunus's Cape",waist="Hachirin-no-Obi",legs="Vanya Slops",feet="Gende. Galosh. +1"}
		
	-- MISSING: main Daybreak
	sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {sub="Genmei Shield"})
	sets.midcast['Enfeebling Magic'] = {main="Marin Staff +1",sub="Enki Strap",ammo="Clarus Stone",
		head="Befouled Crown",neck="Incanter's Torque",ear1="Gwati Earring",ear2="Loquac. Earring",
		body="Witching Robe",hands="Fanatic Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Alaunus's Cape",waist="Hachirin-no-Obi",legs="Vanya Slops",feet="Gende. Galosh. +1"}
	sets.midcast['Enfeebling Magic'].Resistant = {main="Marin Staff +1",sub="Enki Strap",ammo="Clarus Stone",
		head="Befouled Crown",neck="Incanter's Torque",ear1="Gwati Earring",ear2="Loquac. Earring",
		body="Witching Robe",hands="Fanatic Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Alaunus's Cape",waist="Hachirin-no-Obi",legs="Vanya Slops",feet="Gende. Galosh. +1"}
		
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = sets.midcast['Enfeebling Magic']
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = sets.midcast['Enfeebling Magic']

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

    -- Sets to return to when not performing an action.

    -- Resting sets
	sets.resting = {main="Chatoyant Staff",sub="Clemency Grip",ammo="Homiliary",
		head="Befouled Crown",neck="Chrys. Torque",ear1="Moonshade Earring",ear2="Ethereal Earring",
		body=gear.relic_body,hands=gear.relic_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Alaunus's Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet=gear.relic_feet}

    -- Idle sets
	sets.idle = {main="Queller Rod",sub="Genmei Shield",ammo="Homiliary",
		head="Inyanga Tiara +2",neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Ethereal Earring",
		body=gear.artifact_body,hands="Inyan. Dastanas +2",ring1="Defending Ring",ring2="Inyanga Ring",
		back="Alaunus's Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Inyan. Crackows +2"}

	sets.idle.PDT = {main="Mafic Cudgel ",sub="Genmei Shield",ammo="Homiliary",
		head="Bunzi's Hat",neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Ethereal Earring",
		body="Bunzi's Robe",hands="Bunzi's Gloves",ring1="Defending Ring",ring2="Dark Ring",
		back="Alaunus's Cape",waist="Fucho-no-obi",legs="Bunzi's Pants",feet="Bunzi's Sabots"}
		
	sets.idle.MDT = {main="Queller Rod",sub="Genmei Shield",ammo="Homiliary",
		head="Bunzi's Hat",neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Ethereal Earring",
		body="Bunzi's Robe",hands="Bunzi's Gloves",ring1="Defending Ring",ring2="Inyanga Ring",
		back="Alaunus's Cape",waist="Flax Sash",legs="Bunzi's Pants",feet="Bunzi's Sabots"}
		
	sets.idle.MEVA = {main="Queller Rod",sub="Genmei Shield",ammo="Homiliary",
		head="Befouled Crown",neck="Warder's Charm +1",ear1="Moonshade Earring",ear2="Ethereal Earring",
		body="Witching Robe",hands=gear.relic_hands,ring1="Defending Ring",ring2="Inyanga Ring",
		back="Alaunus's Cape",waist="Flax Sash",legs="Assid. Pants +1",feet=gear.relic_feet}
		
	-- Situational Idle sets
    sets.Kiting = {}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {}
	sets.DayIdle = {}
	sets.NightIdle = {back="Umbra Cape"}

    -- Defense sets

	sets.defense.PDT = {main="Queller Rod",sub="Genmei Shield",ammo="Homiliary",
		head="Bunzi's Hat",neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Ethereal Earring",
		body="Bunzi's Hat",hands=gear.relic_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Alaunus's Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet=gear.relic_feet}

	sets.defense.MDT = {main="Mafic Cudgel ",sub="Genmei Shield",ammo="Homiliary",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Ethereal Earring",
		body="Witching Robe",hands=gear.relic_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Alaunus's Cape",waist="Flax Sash",legs="Assid. Pants +1",feet=gear.relic_feet}

    sets.defense.MEVA = {main="Queller Rod",sub="Genmei Shield",ammo="Homiliary",
		head="Befouled Crown",neck="Warder's Charm +1",ear1="Moonshade Earring",ear2="Ethereal Earring",
		body="Witching Robe",hands=gear.relic_hands,ring1="Defending Ring",ring2="Inyanga Ring",
		back="Alaunus's Cape",waist="Flax Sash",legs="Assid. Pants +1",feet=gear.relic_feet}
		
		-- Engaged sets

    sets.engaged = {ammo="Homiliary",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Ethereal Earring",
		body="Witching Robe",hands=gear.relic_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Alaunus's Cape",waist="Flax Sash",legs="Assid. Pants +1",feet=gear.relic_feet}
		
    sets.engaged.Acc = {ammo="Homiliary",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Ethereal Earring",
		body="Witching Robe",hands=gear.relic_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Alaunus's Cape",waist="Flax Sash",legs="Assid. Pants +1",feet=gear.relic_feet}

	sets.engaged.DW = {ammo="Homiliary",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Ethereal Earring",
		body="Witching Robe",hands=gear.relic_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Alaunus's Cape",waist="Flax Sash",legs="Assid. Pants +1",feet=gear.relic_feet}

    sets.engaged.DW.Acc = {ammo="Homiliary",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Ethereal Earring",
		body="Witching Robe",hands=gear.relic_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Alaunus's Cape",waist="Flax Sash",legs="Assid. Pants +1",feet=gear.relic_feet}

		-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	-- MISSING: back Mending Cape
    sets.buff['Divine Caress'] = {hands=gear.relic_hands}
    sets.buff.Sublimation = {}
    sets.buff.DTSublimation = {}

	sets.HPDown = {}
	sets.HPCure = {}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 4)
end

function user_job_buff_change(buff, gain)
	if buff:startswith('Addendum: ') or buff:endswith(' Arts') then
		style_lock = true
	end
end

function user_job_lockstyle()
	if player.sub_job == 'SCH' then
		if state.Buff['Light Arts'] or state.Buff['Addendum: White'] then
			windower.chat.input('/lockstyleset 001')
		elseif state.Buff['Dark Arts'] or state.Buff['Addendum: Black'] then
			windower.chat.input('/lockstyleset 002')
		else
			windower.chat.input('/lockstyleset 003')
		end
	else
		windower.chat.input('/lockstyleset 003')
	end
end
