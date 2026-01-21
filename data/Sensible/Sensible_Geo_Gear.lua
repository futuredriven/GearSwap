function user_job_setup()

	-- Options: Override default values
    state.OffenseMode:options('Normal')
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal','PDT')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock', 'GeoLock', 'PetPDT')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Maxentius','DualWeapons')

	-- JSE Capes
	gear.idle_jse_back = {name="Nantosuelta's Cape",augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: Damage taken -5%'}}
	
	-- Reforged Gear
	gear.artifact_head = {name="Geomancy Galero +1"}
	gear.artifact_body = {name="Geomancy Tunic +1"}	
	gear.artifact_hands = {name="Geomancy Mitaines +1"}
	gear.artifact_legs = {name="Geomancy Pants +1"}
	gear.artifact_feet = {name="Geomancy Sandals +1"}

	gear.artifact_head = {name="Bagua Galero +1"}
	gear.artifact_body = {name="Bagua Tunic +1"}	
	gear.artifact_hands = {name="Bagua Mitaines +1"}
	gear.artifact_legs = {name="Bagua Pants +1"}
	gear.artifact_feet = {name="Bagua Sandals"}

	gear.empyrean_head = {name="Azimuth Hood +1"}
	gear.empyrean_body = {name="Azimuth Coat"}	
	gear.empyrean_hands = {name="Azimuth Gloves"}
	gear.empyrean_legs = {name="Azimuth Tights"}
	gear.empyrean_feet = {name="Azimuth Gaiters +1"}
	
	autoindi = "Haste"
	autogeo = "Frailty"
	
	-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` input /ja "Full Circle" <me>')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind ^backspace input /ja "Entrust" <me>')
	send_command('bind !backspace input /ja "Life Cycle" <me>')
	send_command('bind @backspace input /ma "Sleep II" <t>')
	send_command('bind ^delete input /ma "Aspir III" <t>')
	send_command('bind @delete input /ma "Sleep" <t>')
	
	indi_duration = 180
	
	select_default_macro_book()
end

function init_gear_sets()
	
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA.Bolster = {body=gear.artifact_body}
	sets.precast.JA['Life Cycle'] = {body=gear.artifact_body,back=gear.idle_jse_back}
	sets.precast.JA['Radial Arcana'] = {feet=gear.artifact_feet}
	sets.precast.JA['Mending Halation'] = {legs=gear.artifact_legs}
	sets.precast.JA['Full Circle'] = {head=gear.empyrean_head,hands=gear.artifact_hands}
	
	-- Indi Duration in slots that would normally have skill here to make entrust more efficient.
	sets.buff.Entrust = {}
	
	-- Relic hat for Blaze of Glory HP increase.
	sets.buff['Blaze of Glory'] = {}
	
	-- Fast cast sets for spells

	sets.precast.FC = {main="Mpaca's Staff",sub="Clerisy Strap +1",ammo="Impatiens",
        head="Agwu's Cap",neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Malignance Earring",
        hands="Agwu's Robe",hands="Agwu's Gages",ring1="Kishar Ring",ring2="Lebeche Ring", -- Merlinic Jubbah
        back="Swith Cape",waist="Witful Belt",legs="Agwu's Slops",feet="Regal Pumps +1"}

	sets.precast.FC.Geomancy = {main="Solstice",sub="Genmei Shield",range="Dunna",
		head=gear.empyrean_head,neck="Incanter's Torque",ear1="Etiolation Earring",ear2="Malignance Earring",
		body=gear.artifact_body,hands=gear.artifact_hands,ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.idle_jse_back,waist="Austerity Belt +1",legs=gear.artifact_legs,feet=gear.empyrean_feet}
	
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ear2="Malignance Earring",hands=gear.artifact_hands})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Serenity",sub="Clerisy Strap +1"})
		
	sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.Self_Healing = {ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
	
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

	sets.precast.FC.Impact = {}
		
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})
	
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {}


	--------------------------------------
	-- Midcast sets
	--------------------------------------

	sets.midcast.Geomancy = {main="Solstice",sub="Genmei Shield",range="Dunna",
		head=gear.empyrean_head,neck="Incanter's Torque",ear1="Etiolation Earring",ear2="Malignance Earring",
		body=gear.artifact_body,hands=gear.artifact_hands,ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.idle_jse_back,waist="Austerity Belt +1",legs=gear.artifact_legs,feet=gear.empyrean_feet}

	--Extra Indi duration as long as you can keep your 900 skill cap.
	sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {})
		
    sets.midcast.Cure = {main="Gada",sub="Sors Shield",ammo="Hasty Pinion +1",
        head="Vanya Hood",neck="Incanter's Torque",ear1="Gifted Earring",ear2="Etiolation Earring",
        body="Vanya Robe",hands="Vanya Cuffs",ring1="Janniston Ring",ring2="Stikini Ring +1",
        back="Tempered Cape +1",waist="Witful Belt",legs="Vanya Slops",feet="Vanya Clogs"}
		
    sets.midcast.LightWeatherCure = {main="Chatoyant Staff",sub="Curatio Grip",ammo="Hasty Pinion +1",
        head="Vanya Hood",neck="Incanter's Torque",ear1="Gifted Earring",ear2="Etiolation Earring",
        body="Vanya Robe",hands="Vanya Cuffs",ring1="Janniston Ring",ring2="Stikini Ring +1",
        back="Tempered Cape +1",waist="Witful Belt",legs="Vanya Slops",feet="Vanya Clogs"}
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {main="Gada",sub="Sors Shield",ammo="Hasty Pinion +1",
        head="Vanya Hood",neck="Incanter's Torque",ear1="Gifted Earring",ear2="Etiolation Earring",
        body="Vanya Robe",hands="Vanya Cuffs",ring1="Janniston Ring",ring2="Stikini Ring +1",
        back="Tempered Cape +1",waist="Witful Belt",legs="Vanya Slops",feet="Vanya Clogs"}

    sets.midcast.Curaga = set_combine(sets.midcast.Cure, {}) -- main="Daybreak",sub="Sors Shield"

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",
		back="Oretan. Cape +1",ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt",feet="Vanya Clogs"})
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,sub="Clemency Grip"})
	
    sets.midcast['Elemental Magic'] = {main="Daybreak",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
        head=gear.merlinic_nuke_head,neck="Saevus Pendant +1",ear1="Crematio Earring",ear2="Friomisi Earring",
        body=gear.merlinic_nuke_body,hands="Mallquis Cuffs +2",ring1="Shiva Ring +1",ring2="Freke Ring",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Merlinic Shalwar",feet="Amalric Nails +1"}

    sets.midcast['Elemental Magic'].Resistant = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Sanctity Necklace",ear1="Regal Earring",ear2="Malignance Earring",
        body=gear.merlinic_nuke_body,hands="Mallquis Cuffs +2",ring1="Shiva Ring +1",ring2="Freke Ring",
        back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Merlinic Shalwar",feet="Amalric Nails +1"}
		
    sets.midcast['Elemental Magic'].Proc = {main=empty,sub=empty,ammo="Impatiens",
        head="Vanya Hood",neck="Loricate Torque +1",ear1="Gifted Earring",ear2="Loquac. Earring",
        body="Seidr Cotehardie",hands="Regal Cuffs",ring1="Kishar Ring",ring2="Prolix Ring",
        back="Swith Cape +1",waist="Witful Belt",legs="Assid. Pants +1",feet="Regal Pumps +1"}
		
    sets.midcast['Elemental Magic'].Fodder = {main="Daybreak",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
        head=gear.merlinic_nuke_head,neck="Saevus Pendant +1",ear1="Crematio Earring",ear2="Friomisi Earring",
        body=gear.merlinic_nuke_body,hands="Mallquis Cuffs +2",ring1="Shiva Ring +1",ring2="Freke Ring",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Merlinic Shalwar",feet="Amalric Nails +1"}
		
    sets.midcast['Elemental Magic'].HighTierNuke = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Baetyl Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Freke Ring",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Merlinic Shalwar",feet="Amalric Nails +1"}
		
    sets.midcast['Elemental Magic'].HighTierNuke.Resistant = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Sanctity Necklace",ear1="Regal Earring",ear2="Malignance Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Freke Ring",
        back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Merlinic Shalwar",feet="Amalric Nails +1"}

	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Saevus Pendant +1",ear1="Regal Earring",ear2="Malignance Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Freke Ring",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Merlinic Shalwar",feet="Amalric Nails +1"}
		
    sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}
		
    sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Archon Ring",ring2="Evanescence Ring",
        back=gear.nuke_jse_back,waist="Fucho-no-obi",legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}
    
    sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Amalric Coif +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		body="Zendik Robe",hands="Volte Gloves",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back="Lifestream Cape",waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}
		
	sets.midcast.Stun.Resistant = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Amalric Coif +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
		body="Zendik Robe",hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}
		
	sets.midcast.Impact = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head=empty,neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
		body="Twilight Cloak",hands="Regal Cuffs",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet="Amalric Nails +1"}
		
	sets.midcast.Dispel = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Amalric Coif +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
		body="Zendik Robe",hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}

	sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {main="Daybreak",sub="Ammurapi Shield"})
		
	sets.midcast['Enfeebling Magic'] = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Befouled Crown",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
		body=gear.merlinic_nuke_body,hands="Regal Cuffs",ring1="Kishar Ring",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Luminary Sash",legs="Psycloth Lappas",feet="Uk'uxkaj Boots"}
		
	sets.midcast['Enfeebling Magic'].Resistant = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Befouled Crown",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
		body=gear.merlinic_nuke_body,hands="Regal Cuffs",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Luminary Sash",legs="Psycloth Lappas",feet="Skaoi Boots"}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1",ear2="Malignance Earring",waist="Acuity Belt +1"})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",ear2="Malignance Earring",waist="Acuity Belt +1"})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1",ear2="Malignance Earring",waist="Acuity Belt +1"})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",ear2="Malignance Earring",waist="Acuity Belt +1"})
	
	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {range=empty,ring1="Stikini Ring +1"})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {range=empty,ring1="Stikini Ring +1"})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {ring1="Stikini Ring +1"})
		
	sets.midcast['Enhancing Magic'] = {main=gear.gada_enhancing_club,sub="Ammurapi Shield",ammo="Hasty Pinion +1",
		head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Perimede Cape",waist="Embla Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Genmei Shield",head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Malignance Earring",waist="Sekhmet Corset"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Malignance Earring",waist="Sekhmet Corset"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Malignance Earring",waist="Sekhmet Corset"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Malignance Earring",waist="Sekhmet Corset"})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Resting sets
	sets.resting = {main="Chatoyant Staff",sub="Oneiros Grip",
		head="Befouled Crown",neck="Chrys. Torque",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",legs="Assid. Pants +1",feet=gear.merlinic_refresh_feet}

	-- Idle sets

	sets.idle = {main="Bolelabunga",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Ethereal Earring",
		body="Jhakri Robe +2",hands="Nyame Gauntlets",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Umbra Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Nyame Sollerets"}
		
	sets.idle.PDT = {main="Malignance Pole",sub="Umbra Strap",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Jhakri Robe +2",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
		back="Shadow Mantle",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Mallquis Clogs +2"}

	-- .Pet sets are for when Luopan is present.
	sets.idle.Pet = {main="Sucellus",sub="Genmei Shield",range="Dunna",
		head=gear.empyrean_head,neck="Loricate Torque +1",ear1="Handler's Earring",ear2="Handler's Earring +1",
		body="Jhakri Robe +2",hands=gear.artifact_hands,ring1="Defending Ring",ring2="Dark Ring",
		back=gear.idle_jse_back,waist="Isa Belt",legs="Psycloth Lappas",feet=gear.artifact_feet}

	sets.idle.PDT.Pet = {main="Malignance Pole",sub="Umbra Strap",range="Dunna",
		head=gear.empyrean_head,neck="Loricate Torque +1",ear1="Handler's Earring",ear2="Handler's Earring +1",
		body="Jhakri Robe +2",hands=gear.artifact_hands,ring1="Defending Ring",ring2="Dark Ring",
		back=gear.idle_jse_back,waist="Isa Belt",legs="Nyame Flanchard",feet=gear.artifact_feet}

	-- .Indi sets are for when an Indi-spell is active.
	sets.idle.Indi = set_combine(sets.idle, {})
	sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {}) 
	sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {}) 
	sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {})

	sets.idle.Weak = {main="Bolelabunga",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Carrier's Sash",legs="Assid. Pants +1",feet="Azimuth Gaiters +1"}

	-- Defense sets
	
	sets.defense.PDT = {main="Malignance Pole",sub="Umbra Strap",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Handler's Earring +1",
		body="Mallquis Saio +2",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Azimuth Gaiters +1"}

	sets.defense.MDT = {main="Malignance Pole",sub="Umbra Strap",ammo="Staunch Tathlum +1",
		head="Azimuth Hood +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Handler's Earring +1",
		body="Mallquis Saio +2",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Azimuth Gaiters +1"}
		
    sets.defense.MEVA = {main="Malignance Pole",sub="Enki Strap",ammo="Staunch Tathlum +1",
        head="Azimuth Hood +1",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body=gear.merlinic_nuke_body,hands="Telchine Gloves",ring1="Vengeful Ring",Ring2="Purity Ring",
        back=gear.idle_jse_back,waist="Luminary Sash",legs="Telchine Braconi",feet="Azimuth Gaiters +1"}
		
	sets.defense.PetPDT = sets.idle.PDT.Pet
		
	sets.defense.NukeLock = sets.midcast['Elemental Magic']
	
	sets.defense.GeoLock = sets.midcast.Geomancy.Indi

	sets.Kiting = {}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.merlinic_treasure_feet})
	
	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",legs="Shedir Seraweels",feet="Jhakri Pigaches +2"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
	sets.engaged = {ammo="Hasty Pinion +1",
		head="Befouled Crown",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Jhakri Robe +2",hands="Gazu Bracelet +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Moonlight Cape",waist="Witful Belt",legs="Assid. Pants +1",feet="Battlecast Gaiters"}
		
	sets.engaged.DW = {ammo="Hasty Pinion +1",
		head="Befouled Crown",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Jhakri Robe +2",hands="Regal Cuffs",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Moonlight Cape",waist="Witful Belt",legs="Assid. Pants +1",feet="Battlecast Gaiters"}

	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {main=gear.grioavolr_nuke_staff,sub="Alber Strap",head="Ea Hat +1",neck="Mizu. Kubikazari",body="Ea Houppe. +1",ring1="Mujin Band",legs="Ea Slops +1",feet="Jhakri Pigaches +2"}
	sets.ResistantMagicBurst = {main=gear.grioavolr_nuke_staff,sub="Enki Strap",head="Ea Hat +1",neck="Mizu. Kubikazari",body="Ea Houppe. +1",ring1="Mujin Band",legs="Ea Slops +1",feet="Jhakri Pigaches +2"}
	
	sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
	-- Weapons sets
	sets.weapons.Maxentius = {main='Maxentius',sub='Genmei Shield'}
	sets.weapons.DualWeapons = {main='Maxentius',sub='Nehushtan'}
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	set_macro_page(1, 10)
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 003')
end