function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Fodder','Acc')
	state.HybridMode:options('Normal')
    state.WeaponskillMode:options('Match','Normal','Acc')
    state.CastingMode:options('Normal','SIRD','Resistant','Proc')
    state.IdleMode:options('Normal','PDT')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Tizona','MeleeClubs','Naegbron','Learn')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','MP','SuppaBrutal','DWEarrings','DWMax'}

	-- JSE Capes
	gear.stp_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	gear.wsd_jse_back = {name="Rosmerta's Cape",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	-- **** Needs SAP +10 INT ****
	gear.nuke_jse_back = {name="Rosmerta's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}}

	autows = 'Expiacion'

	-- Reforged Gear
	gear.artifact_head = {name="Assim. Keffiyeh +2"}
	gear.artifact_body = {name="Assim. Jubbah +2"}	
	gear.artifact_hands = {name="Assim. Bazu. +1"}
	gear.artifact_legs = {name="Assim. Shalwar +2"}
	gear.artifact_feet = {name="Assim. Charuqs +1"}

	gear.relic_head = {name="Luhlaza Keffiyeh +1"}
	gear.relic_body = {name="Luhlaza Jubbah +1"}	
	gear.relic_hands = {name="Luhlaza Bazubands +1"}
	gear.relic_legs = {name="Luhlaza Shalwar +1"}
	gear.relic_feet = {name="Luhlaza charuqs +1"}

	gear.empyrean_head = {name="Hashishin Kavuk +1"}
	gear.empyrean_body = {name="Hashishin Mintan +1"}	
	gear.empyrean_hands = {name="Hashishin Bazubands +1"}
	gear.empyrean_legs = {name="Hashishin Tayt +1"}
	gear.empyrean_feet = {name="Hashishin Basmak +1"}

	-- Additional local binds
	send_command('bind ^` input /ja "Chain Affinity" <me>')
	send_command('bind @` input /ja "Efflux" <me>')
	send_command('bind !` input /ja "Burst Affinity" <me>')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	send_command('bind ^backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Mighty Guard" <me>')
	send_command('bind !backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Carcharian Verve" <me>')
	send_command('bind @backspace input /ja "Convergence" <me>')
	send_command('bind @f10 gs c toggle LearningMode')
	send_command('bind ^@!` gs c cycle MagicBurstMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	sets.buff['Burst Affinity'] = {legs=gear.artifact_legs,feet=gear.empyrean_feet}
	sets.buff['Chain Affinity'] = {feet=gear.artifact_feet}
	sets.buff.Convergence = {head=gear.relic_head}
	sets.buff.Diffusion = {head=gear.relic_head}
	sets.buff.Enchainment = {}
	sets.buff.Efflux = {back=gear.stp_jse_back,legs=gear.empyrean_legs}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	sets.HPDown = {}
		
	sets.HPCure = {}

	-- Precast Sets

	-- Precast sets to enhance JAs
	sets.precast.JA['Azure Lore'] = {hands=gear.relic_hands}


	-- Waltz set (chr and vit)
    sets.precast.Waltz = {}
	
	sets.Self_Waltz = {body="Passion Jacket",ring1="Asklepian Ring"}

	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {}

	sets.precast.Flourish1 = {}

	-- Fast cast sets for spells

	sets.precast.FC = {ammo="Sapience Orb",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body=gear.relic_body,hands="Leyline Gloves",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Fi Follet Cape +1",waist="Witful Belt",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {body="Passion Jacket"})

	sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body=gear.empyrean_body})


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Crepuscular Pebble",
		head="Nyame Helm",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Ifrit Ring +1",ring2="Ifrit Ring +1",
		back=gear.wsd_jse_back,waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.precast.WS.Acc = {ammo="Hasty Pinion +1",
		head="Nyame Helm",neck="Fotia Gorget",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Ifrit Ring +1",ring2="Ifrit Ring +1",
		back=gear.wsd_jse_back,waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.precast.WS.DT = {ammo="Crepuscular Pebble",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Ilabrat Ring",
		back=gear.da_jse_back,waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {ear2="Regal Earring",ring1="Metamor. Ring +1",ring2="Rufescent Ring"})
	sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {ear2="Regal Earring",ring1="Metamor. Ring +1",ring2="Rufescent Ring"})
	sets.precast.WS['Requiescat'].DT = set_combine(sets.precast.WS.DT, {})

	sets.precast.WS['Realmrazer'] = set_combine(sets.precast.WS, {ear2="Regal Earring",ring1="Metamor. Ring +1",ring2="Rufescent Ring"})
	sets.precast.WS['Realmrazer'].Acc = set_combine(sets.precast.WS.Acc, {ear2="Regal Earring",ring1="Metamor. Ring +1",ring2="Rufescent Ring"})
	sets.precast.WS['Realmrazer'].DT = set_combine(sets.precast.WS.DT, {})

	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {head="Adhemar Bonnet +1",neck="Mirage Stole +2",ear1="Moonshade Earring",ear2="Odr Earring",body="Gleti's Cuirass",hands="Gleti's Gauntlets",ring2="Begrudging Ring",legs="Gleti's Breeches",feet="Gleti's Boots"})
	sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {head="Adhemar Bonnet +1",neck="Mirage Stole +2",ear1="Moonshade Earring",ear2="Odr Earring",body="Gleti's Cuirass",hands="Gleti's Gauntlets",ring2="Begrudging Ring",legs="Gleti's Breeches",feet="Gleti's Boots"})
	sets.precast.WS['Chant du Cygne'].DT = set_combine(sets.precast.WS.DT, {back=gear.crit_jse_back})

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {neck="Mirage Stole +2",ring1="Rufescent Ring",ring2="Karieyh Ring",waist="Sailfi Belt +1"})
	sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {neck="Mirage Stole +2",ring1="Rufescent Ring",ring2="Karieyh Ring",waist="Sailfi Belt +1"})
	sets.precast.WS['Savage Blade'].DT = set_combine(sets.precast.WS.DT, {back=gear.wsd_jse_back})

	sets.precast.WS['Vorpal Blade'] = sets.precast.WS['Chant du Cygne']
	sets.precast.WS['Vorpal Blade'].Acc = sets.precast.WS['Chant du Cygne'].Acc
	sets.precast.WS['Vorpal Blade'].DT = sets.precast.WS['Chant du Cygne'].DT

	sets.precast.WS['Expiacion'] = set_combine(sets.precast.WS, {neck="Mirage Stole +2",ring1="Beithir Ring",ring2="Rufescent Ring",waist="Sailfi Belt +1"})
	sets.precast.WS['Expiacion'].Acc = set_combine(sets.precast.WS.Acc, {neck="Mirage Stole +2",ring1="Beithir Ring",ring2="Rufescent Ring",waist="Sailfi Belt +1"})
	sets.precast.WS['Expiacion'].DT = set_combine(sets.precast.WS.DT, {back=gear.wsd_jse_back})

	sets.precast.WS['Sanguine Blade'] = {ammo="Ghastly Tathlum +1",
			         head="Pixie Hairpin +1",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Friomisi Earring",
		             body="Amalric Doublet +1",hands="Jhakri Cuffs +2",ring1="Metamor. Ring +1",ring2="Archon Ring",
			         back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs=gear.relic_legs,feet="Amalric Nails +1"}
					 
	sets.precast.WS['Sanguine Blade'].DT = set_combine(sets.precast.WS.DT, {back=gear.nuke_jse_back})

	sets.precast.WS['Flash Nova'] = {ammo="Ghastly Tathlum +1",
			         head="Jhakri Coronal +2",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Friomisi Earring",
		             body="Amalric Doublet +1",hands="Jhakri Cuffs +2",ring1="Metamor. Ring +1",ring2="Shiva Ring +1",
			         back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs=gear.relic_legs,feet="Amalric Nails +1"}
					 
	sets.precast.WS['Sanguine Blade'].DT = set_combine(sets.precast.WS.DT, {back=gear.nuke_jse_back})

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring"}
	sets.AccMaxTP = {ear1="Regal Earring",ear2="Telos Earring"}

	-- Midcast Sets
--	sets.midcast.FastRecast = {main="Vampirism",sub="Sakpata's Sword",ammo="Hasty Pinion +1",
--		head="Carmine Mask +1",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
--		body="Luhlaza Jubbah +3",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Prolix Ring",
--		back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Carmine Greaves +1"}

	sets.midcast['Blue Magic'] = {}

	-- Physical Spells --

	sets.midcast['Blue Magic'].Physical = {ammo="Crepuscular Pebble",
		head="Jhakri Coronal +2",neck="Mirage Stole +2",ear1="Regal Earring",ear2="Telos Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Ifrit Ring +1",ring2="Ilabrat Ring",
		back=gear.wsd_jse_back,waist="Prosilio Belt +1",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.midcast['Blue Magic'].Physical.Resistant = {ammo="Falcon Eye",
		head="Jhakri Coronal +2",neck="Mirage Stole +2",ear1="Regal Earring",ear2="Telos Earring",
	    body="Jhakri Robe +2",hands="Malignance Gloves",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
	    back=gear.wsd_jse_back,waist="Prosilio Belt +1",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.midcast['Blue Magic'].PhysicalAcc = {ammo="Falcon Eye",
		head="Jhakri Coronal +2",neck="Mirage Stole +2",ear1="Regal Earring",ear2="Telos Earring",
	    body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
	    back=gear.wsd_jse_back,waist="Prosilio Belt +1",legs="Jhakri Slops +2",feet="Malignance Boots"}

	sets.midcast['Blue Magic'].PhysicalAcc.Resistant = set_combine(sets.midcast['Blue Magic'].PhysicalAcc, {})

	sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalStr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})

	sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalDex.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})

	sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalVit.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})

	sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalAgi.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})

	sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalInt.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})

	sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalMnd.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})

	sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalChr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})

	sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalHP.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})

	-- Magical Spells --

	sets.midcast['Blue Magic'].Magical = {main="Bunzi's Rod",sub="Maxentius",ammo="Ghastly Tathlum +1",
		 head="Jhakri Coronal +2",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Friomisi Earring",
		 body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Shiva Ring +1",
		 back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs=gear.relic_legs,feet="Amalric Nails +1"}
		 
	sets.midcast['Blue Magic'].Magical.SIRD = {main="Bunzi's Rod",sub="Sakpata's Sword",ammo="Staunch Tathlum +1",
		 head="Jhakri Coronal +2",neck="Loricate Torque +1",ear1="Regal Earring",ear2="Friomisi Earring",
		 body="Amalric Doublet +1",hands="Rawhide Gloves",ring1="Metamor. Ring +1",ring2="Defending Ring",
		 back=gear.nuke_jse_back,waist="Emphatikos Rope",legs="Carmine Cuisses +1",feet="Amalric Nails +1"}
		 
	sets.midcast['Blue Magic'].Subduction = {main="Bunzi's Rod",sub="Maxentius",ammo="Ghastly Tathlum +1",
		 head="Jhakri Coronal +2",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Friomisi Earring",
		 body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Shiva Ring +1",
		 back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs=gear.relic_legs,feet="Amalric Nails +1"}
					 
	sets.midcast['Blue Magic'].Magical.Proc = {ammo="Hasty Pinion +1",
		head="Carmine Mask +1",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body=gear.relic_body,hands="Leyline Gloves",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Fi Follet Cape +1",waist="Witful Belt",legs=gear.relic_legs,feet="Carmine Greaves +1"}
					 
	sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical,
		{neck="Mirage Stole +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1"})

	sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical, {ring2="Stikini Ring +1"})
	sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical, {})

	sets.midcast['Blue Magic'].MagicAccuracy = {main="Tizona",sub="Sakpata's Sword",ammo="Pemphredo Tathlum",
		head=gear.artifact_head,neck="Mirage Stole +2",ear1="Regal Earring",ear2="Njordr Earring",
		body="Amalric Doublet +1",hands="Malignance Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Cornflower Cape",waist="Acuity Belt +1",legs=gear.artifact_legs,feet="Malignance Boots"}

	sets.midcast['Enfeebling Magic'] = {main="Tizona",sub="Sakpata's Sword",ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",neck="Mirage Stole +2",ear1="Regal Earring",ear2="Digni. Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Acuity Belt +1",legs=gear.relic_legs,feet="Amalric Nails +1"}

	sets.midcast['Dark Magic'] = {main="Tizona",sub="Sakpata's Sword",ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
		body="Amalric Doublet +1",hands="Jhakri Cuffs +2",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Acuity Belt +1",legs=gear.relic_legs,feet="Amalric Nails +1"}

	sets.midcast['Enhancing Magic'] = {main="Vampirism", sub="Sakpata's Sword",ammo="Hasty Pinion +1",
		neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Perimede Cape",waist="Olympus Sash"}
		
	sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{main="Pukulatmuj +1",sub="Sakpata's Sword",head="Carmine Mask +1",ear2="Mimir Earring",legs="Carmine Cuisses +1"})

	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1",waist="Emphatikos Rope",legs="Shedir Seraweels"})

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})

	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	sets.midcast['Divine Magic'] = {ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",neck="Incanter's Torque",ear1="Regal Earring",ear2="Digni. Earring",
		body="Amalric Doublet +1",hands="Jhakri Cuffs +2",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Luminary Sash",legs="Luhlaza Shalwar +3",feet="Amalric Nails +1"}

	sets.midcast['Elemental Magic'] = {main="Maxentius",sub="Sakpata's Sword",ammo="Ghastly Tathlum +1",
		head="Jhakri Coronal +2",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Friomisi Earring",
		body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Luhlaza Shalwar +3",feet="Amalric Nails +1"}

	sets.midcast['Elemental Magic'].Resistant = {main="Maxentius",sub="Sakpata's Sword",ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",neck="Mirage Stole +2",ear1="Regal Earring",ear2="Friomisi Earring",
		body="Amalric Doublet +1",hands="Jhakri Cuffs +2",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Luhlaza Shalwar +3",feet="Jhakri Pigaches +2"}

	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Resistant

	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}
	sets.element.Light = {} --ring2="Weatherspoon Ring"

	sets.midcast.Cure = {main="Bunzi's Rod",sub="Sakpata's Sword",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Regal Earring",ear2="Mendi. Earring",
		body="Vrikodara Jupon",hands="Telchine Gloves",ring1="Metamor. Ring +1",ring2="Menelaus's Ring",
		back="Oretan. Cape +1",waist="Luminary Sash",legs="Nyame Flanchard",feet="Medium's Sabots"}
		
	sets.midcast.UnlockedCure = {main="Bunzi's Rod",sub="Sakpata's Sword",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Regal Earring",ear2="Mendi. Earring",
		body="Nyame Mail",hands="Telchine Gloves",ring1="Metamor. Ring +1",ring2="Menelaus's Ring",
		back="Oretan. Cape +1",waist="Luminary Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",hands="Hieros Mittens",
		back="Oretan. Cape +1",ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt"})

	-- Breath Spells --

	sets.midcast['Blue Magic'].Breath = {ammo="Mavi Tathlum",
		head=gear.relic_head,neck="Mirage Stole +2",ear1="Regal Earring",ear2="Digni. Earring",
		body=gear.artifact_body,hands=gear.relic_hands,ring1="Kunaji Ring",ring2="Meridian Ring",
		back="Cornflower Cape",legs=gear.empyrean_legs,feet=gear.relic_feet}

	-- Physical Added Effect Spells most notably "Stun" spells --

	sets.midcast['Blue Magic'].Stun = {main="Tizona",sub="Sakpata's Sword",ammo="Pemphredo Tathlum",
		head="Malignance Chapeau",neck="Mirage Stole +2",ear1="Regal Earring",ear2="Digni. Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back="Cornflower Cape",waist="Luminary Sash",legs="Malignance Tights",feet="Malignance Boots"}

	sets.midcast['Blue Magic'].Stun.Resistant = {main="Tizona",sub="Sakpata's Sword",ammo="Falcon Eye",
		head="Malignance Chapeau",neck="Mirage Stole +2",ear1="Regal Earring",ear2="Digni. Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back="Cornflower Cape",waist="Olseni Belt",legs="Malignance Tights",feet="Malignance Boots"}

	sets.midcast['Blue Magic'].Stun.Fodder = sets.midcast['Blue Magic'].Stun

	-- Other Specific Spells --

	sets.midcast['Blue Magic'].UnlockedAoEHealing = {main="Bunzi's Rod",sub="Sakpata's Sword",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Unmoving Collar +1",ear1="Tuisto Earring",ear2="Odnowa Earring +1",
		body="Nyame Mail",hands="Telchine Gloves",ring1="Gelatinous Ring +1",ring2="Meridian Ring",
		back="Moonbeam Cape",waist="Eschan Stone",legs="Nyame Flanchard",feet="Nyame Sollerets"}
					
	sets.midcast['Blue Magic'].AoEHealing = {main="Bunzi's Rod",sub="Sakpata's Sword",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Unmoving Collar +1",ear1="Tuisto Earring",ear2="Odnowa Earring +1",
		body="Vrikodara Jupon",hands="Telchine Gloves",ring1="Gelatinous Ring +1",ring2="Meridian Ring",
		back="Moonbeam Cape",waist="Eschan Stone",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.midcast['Blue Magic'].Healing = {main="Bunzi's Rod",sub="Sakpata's Sword",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Tuisto Earring",ear2="Odnowa Earring +1",
		body="Vrikodara Jupon",hands="Telchine Gloves",ring1="Gelatinous Ring +1",ring2="Meridian Ring",
		back="Moonbeam Cape",waist="Eschan Stone",legs="Gyve Trousers",feet="Medium's Sabots"}
		
	sets.midcast['Blue Magic'].UnlockedHealing = {main="Bunzi's Rod",sub="Sakpata's Sword",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Regal Earring",ear2="Mendi. Earring",
		body="Nyame Mail",hands="Telchine Gloves",ring1="Metamor. Ring +1",ring2="Meridian Ring",
		back="Moonbeam Cape",waist="Luminary Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.midcast['Blue Magic'].SkillBasedBuff = {main="Iris",sub="Iris",ammo="Mavi Tathlum",
		head=gear.relic_head,neck="Mirage Stole +2",ear1="Gifted Earring",ear2="Njordr Earring",
		body=gear.artifact_body,hands="Rawhide Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Cornflower Cape",waist="Witful Belt",legs=gear.empyrean_legs,feet=gear.relic_feet}

	sets.midcast['Blue Magic'].Buff = {main="Vampirism",sub="Vampirism",ammo="Mavi Tathlum",
		head=gear.relic_head,neck="Mirage Stole +2",ear1="Gifted Earring",ear2="Njordr Earring",
		body=gear.artifact_body,hands="Rawhide Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Cornflower Cape",waist="Witful Belt",legs=gear.empyrean_legs,feet=gear.relic_feet}

	sets.midcast['Blue Magic']['Battery Charge'] = set_combine(sets.midcast['Blue Magic'].Buff, {head="Amalric Coif +1",back="Grapevine Cape",waist="Gishdubar Sash"})

	sets.midcast['Blue Magic']['Carcharian Verve'] = set_combine(sets.midcast['Blue Magic'].Buff, {head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})

	-- Sets to return to when not performing an action.

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	-- Gear for learning spells: +skill and AF hands.
	sets.Learning = {hands="Assim. Bazu. +3"}

	-- Resting sets
	sets.resting = {main="Colada",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Gleti's Mask",neck="Loricate Torque +1",ear1="Etiolation Earring", ear2="Ethereal Earring",
		body="Gleti's Cuirass",hands="Gleti's Gauntlets",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.stp_jse_back,waist="Flume Belt +1",legs="Gleti's Breeches",feet="Gleti's Boots"}

	-- Idle sets
	sets.idle = {main="Colada",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Gleti's Mask",neck="Loricate Torque +1",ear1="Etiolation Earring", ear2="Ethereal Earring",
		body="Gleti's Cuirass",hands="Gleti's Gauntlets",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.stp_jse_back,waist="Flume Belt +1",legs="Gleti's Breeches",feet="Gleti's Boots"}

	sets.idle.PDT = {main="Sakpata's Sword",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Gleti's Mask",neck="Loricate Torque +1",ear1="Etiolation Earring", ear2="Ethereal Earring",
		body="Gleti's Cuirass",hands="Gleti's Gauntlets",ring1="Defending Ring",ring2="Dark Ring",
		back=gear.stp_jse_back,waist="Flume Belt +1",legs="Gleti's Breeches",feet="Gleti's Boots"}

	-- Defense sets
	sets.defense.PDT = {main="Sakpata's Sword",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Gleti's Mask",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Gleti's Cuirass",hands="Gleti's Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.stp_jse_back,waist="Flume Belt +1",legs="Gleti's Breeches",feet="Gleti's Boots"}

	sets.defense.MDT = {main="Bolelabunga",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Gleti's Mask",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Gleti's Cuirass",hands="Gleti's Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.stp_jse_back,waist="Carrier's Sash",legs="Gleti's Breeches",feet="Gleti's Boots"}

    sets.defense.MEVA = {main="Bolelabunga",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Malignance Tabard",hands="Leyline Gloves",ring1="Vengeful Ring",ring2="Purity Ring",
		back=gear.nuke_jse_back,waist="Carrier's Sash",legs="Malignance Tights",feet="Malignance Boots"}

	sets.defense.NukeLock = sets.midcast['Blue Magic'].Magical

    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
    sets.MP = {waist="Flume Belt +1",ear1="Suppanomimi", ear2="Ethereal Earring"}
    sets.MP_Knockback = {}
	sets.SuppaBrutal = {ear1="Suppanomimi", ear2="Brutal Earring"}
	sets.DWEarrings = {ear1="Dudgeon Earring",ear2="Heartseeker Earring"}
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Adhemar Jacket +1",waist="Reiki Yotai",legs="Carmine Cuisses +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Tizona = {main="Tizona",sub="Thibron"}	
	sets.weapons.MeleeClubs = {main="Maxentius",sub="Thibron"}
	sets.weapons.Naegbron = {main="Naegling",sub="Thibron"}
	sets.weapons.MaccWeapons = {main="Iris",sub="Iris"}
	sets.weapons.Learn = {main="Extinction",sub="Feline Hagoita"}

	-- Engaged sets

	sets.engaged = {ammo="Coiste Bodhar",
			    head="Adhemar Bonnet +1",neck="Mirage Stole +2",ear1="Dedition Earring",ear2="Eabani Earring", -- Malignance Chapeau
			    body="Malignance Tabard",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
			    back=gear.stp_jse_back,waist="Sailfi Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

	sets.engaged.AM = {ammo="Coiste Bodhar",
			    head="Adhemar Bonnet +1",neck="Mirage Stole +2",ear1="Cessance Earring",ear2="Telos Earring",
			    body="Adhemar Jacket +1",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Chirich Ring +1",
			    back=gear.stp_jse_back,waist="Kentarch Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

	sets.engaged.Acc = {ammo="Falcon Eye",
				head="Adhemar Bonnet +1",neck="Mirage Stole +2",ear1="Cessance Earring",ear2="Telos Earring",
				body="Malignance Tabard",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
				back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

	sets.engaged.Fodder = {main="Tizona",sub="Almace",ammo="Aurgelmir Orb +1",
			    head="Dampening Tam",neck="Mirage Stole +2",ear1="Dedition Earring",ear2="Brutal Earring",
			    body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Petrov Ring",
			    back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}

	sets.engaged.Fodder.AM = {main="Tizona",sub="Almace",ammo="Aurgelmir Orb +1",
			    head="Dampening Tam",neck="Mirage Stole +2",ear1="Dedition Earring",ear2="Telos Earring",
			    body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Petrov Ring",
			    back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Carmine Greaves +1"}

	sets.engaged.Acc.AM = {ammo="Falcon Eye",
			    head="Adhemar Bonnet +1",neck="Mirage Stole +2",ear1="Digni. Earring",ear2="Telos Earring",
			    body="Malignance Tabard",hands="Adhemar Wrist. +1",ring1="Chirich Ring +1",ring2="Ilabrat Ring",
			    back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Malignance Boots"}

	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}
	sets.MagicBurst = {body="Samnuha Coat",hands="Amalric Gages +1",legs=gear.artifact_legs,ring1="Mujin Band",ring2="Locus Ring"}
	sets.Phalanx_Received = {}
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
    set_macro_page(1, 13)
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 005')
end

buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Erratic Flutter',	Buff='Haste',			SpellID=710,	When='Always'},
		{Name='Battery Charge',		Buff='Refresh',			SpellID=662,	When='Idle'},
		{Name='Refresh',			Buff='Refresh',			SpellID=109,	When='Idle'},
		{Name='Nat. Meditation',	Buff='Attack Boost',	SpellID=700,	When='Engaged'},		
	},
	
	AutoMighty = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Erratic Flutter',	Buff='Haste',			SpellID=710,	When='Always'},
		{Name='Battery Charge',		Buff='Refresh',			SpellID=662,	When='Idle'},
		{Name='Refresh',			Buff='Refresh',			SpellID=109,	When='Idle'},
		{Name='Nat. Meditation',	Buff='Attack Boost',	SpellID=700,	When='Engaged'},
		{Name='Mighty Guard',		Buff='Mighty Guard',	SpellID=750,	When='Combat'},
	},
	
	Default = {
		{Name='Erratic Flutter',	Buff='Haste',			SpellID=710,	Reapply=false},
		{Name='Battery Charge',		Buff='Refresh',			SpellID=662,	Reapply=false},
		{Name='Refresh',			Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Phalanx',			Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Barrier Tusk',		Buff='Phalanx',			SpellID=685,	Reapply=false},
		{Name='Stoneskin',			Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Occultation',		Buff='Blink',			SpellID=679,	Reapply=false},
		{Name='Blink',				Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Mighty Guard',		Buff='Mighty Guard',	SpellID=750,	Reapply=false},
		{Name='Nat. Meditation',	Buff='Attack Boost',	SpellID=700,	Reapply=false},
	},
	
	Cleave = {
		{Name='Erratic Flutter',	Buff='Haste',			SpellID=710,	Reapply=false},
		{Name='Battery Charge',		Buff='Refresh',			SpellID=662,	Reapply=false},
		{Name='Refresh',			Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Phalanx',			Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Barrier Tusk',		Buff='Phalanx',			SpellID=685,	Reapply=false},
		{Name='Stoneskin',			Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Occultation',		Buff='Blink',			SpellID=679,	Reapply=false},
		{Name='Blink',				Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Carcharian Verve',	Buff='Aquaveil',		SpellID=745,	Reapply=false},
		{Name='Memento Mori',		Buff='Magic Atk. Boost',SpellID=538,	Reapply=false},
	},
}

autows_list = {['Tizbron']='Expiacion',['Tizalmace']='Expiacion',['Almace']='Chant Du Cygne',['MeleeClubs']='Black Halo',
     ['HybridWeapons']='Sanguine Blade',['Naegbron']='Savage Blade',['Naegmace']='Savage Blade'}