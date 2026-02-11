-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal')
    state.CastingMode:options('Normal','Resistant','Proc','OccultAcumen','9k')
    state.IdleMode:options('Normal','PDT')
    state.HybridMode:options('Normal','PDT')
    state.Weapons:options('None','Bunzi','Maxentius')
    
    default_weapons = 'Maxentius'
    
    autows_list = {['Maxentius']='Black Halo'}

    gear.nuke_jse_back = {name="Lugh's Cape",augments={'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'INT+10', '"Mag.Atk.Bns."+10',}}
    gear.idle_jse_back = {name="Lugh's Cape",augments={'MND+20', 'Eva.+20 /Mag. Eva.+20', 'Mag. Evasion+10', 'Enmity-10', 'Damage taken-5%'}}

    -- Reforged Gear
    gear.empyrean_head = "Agwu's Cap"
    gear.empyrean_body = "Agwu's Robe"
    gear.empyrean_hands = "Agwu's Gages"
    gear.empyrean_legs = "Agwu's Slops"
    gear.empyrean_feet = "Agwu's Pigaches"

    gear.relic_body = "Jhakri Robe +2"
    gear.relic_hands = "Jhakri Cuffs +2"
    gear.relic_feet = "Jhakri Pigaches +2"

        -- Additional local binds
    send_command('bind @` gs c cycle ElementalMode')
    send_command('bind ^` gs c scholar dark')
    send_command('bind !` gs c scholar light')
    send_command('bind !backspace gs c scholar speed')
    send_command('bind ^backspace gs c scholar power')
    send_command('bind @backspace gs c scholar cost')
    send_command('bind ^\\\\ input /ma "Protect V" <t>')
    send_command('bind @\\\\ input /ma "Shell V" <t>')
    send_command('bind !\\\\ input /ma "Reraise III" <me>')
    send_command('bind @f8 gs c toggle AutoNukeMode')
    send_command('bind @f10 gs c cycle RecoverMode')
    send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Weapons sets
    sets.weapons.Mpaca = {main="Mpaca's Staff",sub="Clerisy Strap +1"}
    -- MISSING: main Bunzi's Rod
    sets.weapons.Bunzi = {sub="Ammurapi Shield"}
    -- MISSING: main Maxentius
    sets.weapons.Maxentius = {sub="Ammurapi Shield"}

    -- Precast Sets

    -- MISSING: legs Peda. Pants +1
    sets.precast.JA['Tabula Rasa'] = {}
    sets.precast.JA['Enlightenment'] = {} --body="Peda. Gown +1"

    -- Fast cast sets for spells
    -- MISSING: neck Voltsurge Torque
    sets.precast.FC = {main="Mpaca's Staff",sub="Clerisy Strap +1",ammo="Impatiens",
        head=gear.empyrean_head,ear1="Loquac. Earring",ear2="Malignance Earring",
        body=gear.empyrean_body,hands=gear.empyrean_hands,ring1="Kishar Ring",ring2="Lebeche Ring",
        back="Swith Cape",waist="Witful Belt",legs=gear.empyrean_legs,feet="Regal Pumps +1"}
        
    -- MISSING: neck Voltsurge Torque
    sets.precast.FC.DT = {main="Mpaca's Staff",sub="Clerisy Strap +1",ammo="Impatiens",
        head=gear.empyrean_head,ear1="Loquac. Earring",ear2="Malignance Earring",
        body=gear.empyrean_body,hands=gear.empyrean_hands,ring1="Kishar Ring",ring2="Lebeche Ring",
        back="Swith Cape",waist="Witful Belt",legs=gear.empyrean_legs,feet="Regal Pumps +1"}
        
    sets.precast.FC.Arts = {}
    -- MISSING: body Twilight Cloak
    sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty})
    -- MISSING: main Daybreak
    sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {sub="Genmei Shield"})

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    
    -- MISSING: ammo Oshasha's Treatise
    -- MISSING: neck Fotia Gorget
    -- MISSING: ear1 Brutal Earring
    -- MISSING: back Null Shawl
    -- MISSING: waist Fotia Belt
    -- MISSING: ring1 Epaminondas's Ring
    -- MISSING: ring2 Cornelia's Ring
    sets.precast.WS = {head="Nyame Helm",ear2="Moonshade Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",
        legs="Nyame Flanchard",feet="Nyame Sollerets"}
    
    sets.precast.WS['Myrkr'] = {}

    -- Midcast Sets

    -- MISSING: neck Voltsurge Torque
    sets.midcast.FastRecast = {main="Mpaca's Staff",sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
        head=gear.empyrean_head,ear1="Loquac. Earring",ear2="Malignance Earring",
        body=gear.empyrean_body,hands=gear.empyrean_hands,ring1="Kishar Ring",ring2="Lebeche Ring",
        back="Swith Cape",waist="Witful Belt",legs=gear.empyrean_legs,feet="Regal Pumps +1"}
        
    -- MISSING: ear1 Meili Earring
    sets.midcast.Cure = {main="Gada",sub="Sors Shield",ammo="Hasty Pinion +1",
        head="Kaykaus Mitra",neck="Incanter's Torque",ear2="Malignance Earring",
        body="Kaykaus Bliaut",hands="Telchine Gloves",ring1="Janniston Ring",ring2="Lebeche Ring",
        back="Tempered Cape +1",waist="Bishop's Sash",legs="Vanya Slops",feet="Kaykaus Boots"}
        
    -- MISSING: ear1 Meili Earring
    sets.midcast.LightWeatherCure = {main="Chatoyant Staff",sub="Curatio Grip",ammo="Hasty Pinion +1",
        head="Kaykaus Mitra",neck="Incanter's Torque",ear2="Malignance Earring",
        body="Kaykaus Bliaut",hands="Telchine Gloves",ring1="Janniston Ring",ring2="Lebeche Ring",
        back="Tempered Cape +1",waist="Bishop's Sash",legs="Vanya Slops",feet="Kaykaus Boots"}
        
    -- MISSING: ear1 Meili Earring
    sets.midcast.LightDayCure = {main="Gada",sub="Sors Shield",ammo="Hasty Pinion +1",
        head="Kaykaus Mitra",neck="Incanter's Torque",ear2="Malignance Earring",
        body="Kaykaus Bliaut",hands="Telchine Gloves",ring1="Janniston Ring",ring2="Lebeche Ring",
        back="Tempered Cape +1",waist="Bishop's Sash",legs="Vanya Slops",feet="Kaykaus Boots"}

    sets.midcast.Curaga = sets.midcast.Cure

    -- MISSING: waist Gishdubar Sash
    sets.Self_Healing = {ring1="Kunaji Ring",ring2="Asklepian Ring"}
    -- MISSING: waist Gishdubar Sash
    sets.Cure_Received = {ring1="Kunaji Ring",ring2="Asklepian Ring"}
    -- MISSING: back Grapevine Cape
    -- MISSING: waist Gishdubar Sash
    -- MISSING: feet Inspirited Boots
    sets.Self_Refresh = {}
    
    -- MISSING: main Grioavolr
    -- MISSING: head Amalric Coif +1
    -- MISSING: ear1 Meili Earring
    -- MISSING: body Zendik Robe
    -- MISSING: hands Hieros Mittens
    -- MISSING: back Oretan. Cape +1
    -- MISSING: legs Psycloth Lappas
    sets.midcast.Cursna = {sub="Clemency Grip",ammo="Hasty Pinion +1",
        neck="Debilis Medallion",ear2="Malignance Earring",
        ring1="Haoma's Ring",ring2="Menelaus's Ring",
        waist="Witful Belt",feet="Vanya Clogs"}
        
    -- MISSING: main Grioavolr
    sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {sub="Clemency Grip"})

    -- NOTE: duplicate ring/ear detected; will validate in Task 2
    -- MISSING: ammo Savant's Treatise
    -- MISSING: head Telchine Cap
    -- MISSING: ear2 Gifted Earring
    -- MISSING: back Perimede Cape
    sets.midcast['Enhancing Magic'] = {main="Gada",sub="Ammurapi Shield",
        neck="Incanter's Torque",ear1="Andoaa Earring",
        body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        waist="Olympus Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {back=gear.nuke_jse_back})

    -- MISSING: waist Siegel Sash
    -- MISSING: legs Shedir Seraweels
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring"})
    
    -- MISSING: head Amalric Coif +1
    sets.midcast.Refresh = sets.midcast['Enhancing Magic']
    
    -- MISSING: head Amalric Coif +1
    -- MISSING: hands Regal Cuffs
    -- MISSING: legs Shedir Seraweels
    sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Genmei Shield",waist="Emphatikos Rope"})
    
    -- MISSING: waist Siegel Sash
    -- MISSING: legs Shedir Seraweels
    sets.midcast.BarElement = sets.precast.FC

    -- MISSING: feet Peda. Loafers +1
    sets.midcast.Storm = sets.midcast['Enhancing Magic']

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shellra = sets.midcast.Shell


    -- Custom spell classes

    -- MISSING: main Daybreak
    -- MISSING: ammo Pemphredo Tathlum
    -- MISSING: head Acad. Mortar. +3
    -- MISSING: ear1 Regal Earring
    -- MISSING: body Chironic Doublet
    -- MISSING: hands Regal Cuffs
    -- MISSING: waist Obstin. Sash
    -- MISSING: legs Chironic Hose
    -- MISSING: feet Uk'uxkaj Boots
    sets.midcast['Enfeebling Magic'] = {sub="Ammurapi Shield",
        neck="Erra Pendant",ear2="Malignance Earring",
        ring1="Kishar Ring",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back}
    
    -- MISSING: main Daybreak
    -- MISSING: ammo Pemphredo Tathlum
    -- MISSING: head Acad. Mortar. +3
    -- MISSING: ear1 Regal Earring
    -- MISSING: ear2 Digni. Earring
    -- MISSING: body Chironic Doublet
    -- MISSING: hands Acad. Bracers +3
    -- MISSING: waist Luminary Sash
    -- MISSING: legs Chironic Hose
    -- MISSING: feet Medium's Sabots
    sets.midcast['Enfeebling Magic'].Resistant = {sub="Ammurapi Shield",
        neck="Erra Pendant",
        ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back}
        
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1",ear2="Malignance Earring",back=gear.nuke_jse_back,waist="Acuity Belt +1"})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",back=gear.nuke_jse_back,waist="Acuity Belt +1"})
    
    -- MISSING: feet Chironic Slippers
    sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
    sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
    sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
    sets.midcast['Dia II'] = sets.midcast['Enfeebling Magic']
    sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
    sets.midcast['Bio II'] = sets.midcast['Enfeebling Magic']
    
    -- MISSING: feet Chironic Slippers
    sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {ring2="Stikini Ring +1"})

    -- NOTE: duplicate ring/ear detected; will validate in Task 2
    -- MISSING: main Rubicundity
    -- MISSING: ammo Pemphredo Tathlum
    -- MISSING: head Amalric Coif +1
    -- MISSING: ear1 Regal Earring
    -- MISSING: body Chironic Doublet
    -- MISSING: hands Acad. Bracers +3
    -- MISSING: waist Acuity Belt +1
    -- MISSING: legs Chironic Hose
    -- MISSING: feet Merlinic Crackows
    sets.midcast['Dark Magic'] = {sub="Ammurapi Shield",
        neck="Incanter's Torque",ear2="Malignance Earring",
        ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back}

    -- MISSING: main Akademos
    -- MISSING: ammo Pemphredo Tathlum
    -- MISSING: head Pixie Hairpin +1
    -- MISSING: neck Saevus Pendant +1
    -- MISSING: body Merlinic Doublet
    -- MISSING: hands Amalric Gages +1
    -- MISSING: ring1 Archon Ring
    -- MISSING: ring2 Freke Ring
    -- MISSING: waist Refoccilation Stone
    -- MISSING: feet Amalric Nails +1
    sets.midcast.Kaustra = {sub="Enki Strap",
        ear1="Crematio Earring",ear2="Malignance Earring",
        back=gear.nuke_jse_back,legs="Merlinic Shalwar"}
        
    -- MISSING: main Grioavolr
    -- MISSING: ammo Pemphredo Tathlum
    -- MISSING: head Merlinic Hood
    -- MISSING: body Merlinic Doublet
    -- MISSING: hands Amalric Gages +1
    -- MISSING: ring1 Shiva Ring +1
    -- MISSING: ring2 Freke Ring
    -- MISSING: waist Acuity Belt +1
    -- MISSING: feet Amalric Nails +1
    sets.midcast.Kaustra.Resistant = {sub="Enki Strap",
        neck="Erra Pendant",ear1="Crematio Earring",ear2="Malignance Earring",
        back=gear.nuke_jse_back,legs="Merlinic Shalwar"}

    -- MISSING: main Rubicundity
    -- MISSING: ammo Pemphredo Tathlum
    -- MISSING: head Pixie Hairpin +1
    -- MISSING: ear1 Regal Earring
    -- MISSING: body Chironic Doublet
    -- MISSING: hands Acad. Bracers +3
    -- MISSING: legs Chironic Hose
    -- MISSING: ring2 Archon Ring
    -- MISSING: feet Merlinic Crackows
    sets.midcast.Drain = {sub="Ammurapi Shield",
        neck="Erra Pendant",ear2="Malignance Earring",
        ring1="Evanescence Ring",
        back=gear.nuke_jse_back,waist="Fucho-no-obi"}
        
    -- NOTE: duplicate ring/ear detected; will validate in Task 2
    -- MISSING: main Rubicundity
    -- MISSING: ammo Pemphredo Tathlum
    -- MISSING: head Amalric Coif +1
    -- MISSING: ear1 Regal Earring
    -- MISSING: body Chironic Doublet
    -- MISSING: hands Acad. Bracers +3
    -- MISSING: waist Acuity Belt +1
    -- MISSING: legs Chironic Hose
    -- MISSING: feet Merlinic Crackows
    sets.midcast.Drain.Resistant = {sub="Ammurapi Shield",
        neck="Erra Pendant",ear2="Malignance Earring",
        ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back}

    sets.midcast.Aspir = sets.midcast.Drain
    sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

    -- MISSING: main Grioavolr
    -- MISSING: neck Voltsurge Torque
    -- MISSING: head Amalric Coif +1
    -- MISSING: ear1 Enchntr. Earring +1
    -- MISSING: body Zendik Robe
    -- MISSING: hands Acad. Bracers +3
    -- MISSING: legs Psycloth Lappas
    sets.midcast.Stun = {sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
        ear2="Malignance Earring",
        ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Witful Belt",feet="Regal Pumps +1"}

    -- MISSING: main Daybreak
    -- MISSING: ammo Pemphredo Tathlum
    -- MISSING: head Acad. Mortar. +3
    -- MISSING: ear1 Regal Earring
    -- MISSING: body Zendik Robe
    -- MISSING: hands Acad. Bracers +3
    -- MISSING: waist Acuity Belt +1
    -- MISSING: legs Chironic Hose
    -- MISSING: feet Merlinic Crackows
    sets.midcast.Stun.Resistant = {sub="Ammurapi Shield",
        neck="Erra Pendant",ear2="Malignance Earring",
        ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back}

    -- Elemental Magic sets are default for handling low-tier nukes.
    -- MISSING: main Bunzi's Rod
    -- MISSING: ammo Ghastly Tathlum +1
    -- MISSING: neck Saevus Pendant +1
    -- MISSING: ear2 Friomisi Earring
    -- MISSING: body Amalric Doublet +1
    -- MISSING: hands Amalric Gages +1
    -- MISSING: ring1 Shiva Ring +1
    -- MISSING: ring2 Freke Ring
    -- MISSING: waist Refoccilation Stone
    -- MISSING: feet Amalric Nails +1
    sets.midcast['Elemental Magic'] = {sub="Ammurapi Shield",
        head=gear.empyrean_head,ear1="Crematio Earring",
        back=gear.nuke_jse_back,legs="Merlinic Shalwar"}
        
    -- MISSING: main Bunzi's Rod
    -- MISSING: ammo Pemphredo Tathlum
    -- MISSING: neck Sanctity Necklace
    -- MISSING: ear1 Regal Earring
    -- MISSING: body Amalric Doublet +1
    -- MISSING: hands Mallquis Cuffs +2
    -- MISSING: ring2 Freke Ring
    -- MISSING: waist Acuity Belt +1
    sets.midcast['Elemental Magic'].Resistant = {sub="Ammurapi Shield",
        head=gear.empyrean_head,ear2="Malignance Earring",
        ring1="Metamor. Ring +1",
        back=gear.nuke_jse_back,legs="Merlinic Shalwar",feet=gear.empyrean_feet}
        
    -- MISSING: main Daybreak
    -- MISSING: ammo Pemphredo Tathlum
    -- MISSING: head Merlinic Hood
    -- MISSING: neck Saevus Pendant +1
    -- MISSING: body Merlinic Doublet
    -- MISSING: hands Mallquis Cuffs +2
    -- MISSING: ring1 Shiva Ring +1
    -- MISSING: ring2 Freke Ring
    -- MISSING: back Swith Cape +1
    -- MISSING: legs Psycloth Lappas
    sets.midcast['Elemental Magic']['9k'] = {sub="Ammurapi Shield",
        ear1="Crematio Earring",ear2="Malignance Earring",
        waist="Witful Belt",feet="Regal Pumps +1"}
        
    -- MISSING: neck Voltsurge Torque
    -- MISSING: ear1 Enchntr. Earring +1
    -- MISSING: body Zendik Robe
    -- MISSING: hands Gende. Gages +1
    -- MISSING: back Swith Cape +1
    -- MISSING: legs Psycloth Lappas
    sets.midcast['Elemental Magic'].Proc = {main=empty, sub=empty,ammo="Impatiens",
        head="Vanya Hood",ear2="Malignance Earring",
        ring1="Kishar Ring",ring2="Prolix Ring",
        waist="Witful Belt",feet="Regal Pumps +1"}
        
    -- MISSING: main Khatvanga
    -- MISSING: sub Bloodrain Strap
    -- MISSING: ammo Seraphic Ampulla
    -- MISSING: head Mall. Chapeau +2
    -- MISSING: neck Combatant's Torque
    -- MISSING: ear1 Dedition Earring
    -- MISSING: body Merlinic Dastanas
    -- MISSING: hands Merlinic Dastanas
    -- MISSING: ring1 Rajas Ring
    -- MISSING: waist Oneiros Rope
    -- MISSING: legs Perdition Slops
    -- MISSING: feet Merlinic Dastanas
    sets.midcast['Elemental Magic'].OccultAcumen = {ear2="Telos Earring",
        ring2="Petrov Ring",
        back=gear.nuke_jse_back}
    
        
    -- Custom refinements for certain nuke tiers
    -- MISSING: main Bunzi's Rod
    -- MISSING: ammo Ghastly Tathlum +1
    -- MISSING: head Merlinic Hood
    -- MISSING: neck Saevus Pendant +1
    -- MISSING: ear1 Regal Earring
    -- MISSING: body Amalric Doublet +1
    -- MISSING: hands Amalric Gages +1
    -- MISSING: ring1 Metamorph Ring +1
    -- MISSING: ring2 Freke Ring
    -- MISSING: waist Acuity Belt +1
    -- MISSING: feet Amalric Nails +1
    sets.midcast['Elemental Magic'].HighTierNuke = {sub="Ammurapi Shield",
        ear2="Malignance Earring",
        back=gear.nuke_jse_back,legs="Merlinic Shalwar"}
        
    -- MISSING: main Bunzi's Rod
    -- MISSING: ammo Ghastly Tathlum +1
    -- MISSING: head Merlinic Hood
    -- MISSING: neck Sanctity Necklace
    -- MISSING: ear1 Regal Earring
    -- MISSING: body Amalric Doublet +1
    -- MISSING: ring1 Metamorph Ring +1
    -- MISSING: ring2 Freke Ring
    -- MISSING: waist Acuity Belt +1
    sets.midcast['Elemental Magic'].HighTierNuke.Resistant = {sub="Ammurapi Shield",
        ear2="Malignance Earring",
        hands=gear.relic_hands,
        back=gear.nuke_jse_back,legs="Merlinic Shalwar",feet=gear.relic_feet}

    -- MISSING: main Bunzi's Rod
    -- MISSING: ammo Ghastly Tathlum +1
    -- MISSING: head Merlinic Hood
    -- MISSING: neck Saevus Pendant +1
    -- MISSING: ear2 Friomisi Earring
    -- MISSING: body Merlinic Doublet
    -- MISSING: hands Amalric Gages +1
    -- MISSING: ring2 Freke Ring
    -- MISSING: waist Refoccilation Stone
    -- MISSING: feet Amalric Nails +1
    sets.midcast.Helix = {sub="Ammurapi Shield",
        ear1="Crematio Earring",
        ring1="Metamor. Ring +1",
        back=gear.nuke_jse_back,legs="Merlinic Shalwar"}
    
    -- MISSING: main Daybreak
    -- MISSING: ammo Pemphredo Tathlum
    -- MISSING: head Merlinic Hood
    -- MISSING: neck Sanctity Necklace
    -- MISSING: ear2 Friomisi Earring
    -- MISSING: body Merlinic Doublet
    -- MISSING: hands Amalric Gages +1
    -- MISSING: ring2 Freke Ring
    -- MISSING: waist Acuity Belt +1
    -- MISSING: feet Amalric Nails +1
    sets.midcast.Helix.Resistant = {sub="Ammurapi Shield",
        ear1="Malignance Earring",
        ring1="Metamor. Ring +1",
        back=gear.nuke_jse_back,legs="Merlinic Shalwar"}
        
    -- MISSING: neck Voltsurge Torque
    -- MISSING: ear1 Enchntr. Earring +1
    -- MISSING: body Zendik Robe
    -- MISSING: hands Gende. Gages +1
    -- MISSING: back Swith Cape +1
    -- MISSING: legs Psycloth Lappas
    sets.midcast.Helix.Proc = {main=empty, sub=empty,ammo="Impatiens",
        head="Vanya Hood",ear2="Malignance Earring",
        ring1="Kishar Ring",ring2="Prolix Ring",
        waist="Witful Belt",feet="Regal Pumps +1"}

    -- MISSING: main Daybreak
    -- MISSING: ammo Pemphredo Tathlum
    -- MISSING: ear1 Regal Earring
    -- MISSING: body Twilight Cloak
    -- MISSING: hands Acad. Bracers +3
    -- MISSING: waist Acuity Belt +1
    -- MISSING: feet Amalric Nails +1
    sets.midcast.Impact = {sub="Ammurapi Shield",
        head=empty,neck="Erra Pendant",ear2="Malignance Earring",
        ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,legs="Merlinic Shalwar"}
        
    -- MISSING: body Twilight Cloak
    sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {head=empty})

    -- Gear for Magic Burst mode.
    -- MISSING: main Bunzi's Rod
    -- MISSING: ammo Ghastly Tathlum +1
    -- MISSING: ear1 Regal Earring
    -- MISSING: body Amalric Doublet +1
    -- MISSING: hands Amalric Gages +1
    -- MISSING: ring2 Freke Ring
    -- MISSING: waist Acuity Belt +1
    -- MISSING: feet Amalric Nails +1
    sets.MagicBurst = {sub="Ammurapi Shield",
        head=gear.empyrean_head,neck="Mizu. Kubikazari",ear2="Malignance Earring",
        ring1="Mujin Band",
        back=gear.nuke_jse_back,legs=gear.empyrean_legs}

    -- MISSING: main Bunzi's Rod
    -- MISSING: ammo Ghastly Tathlum +1
    -- MISSING: ear1 Regal Earring
    -- MISSING: body Amalric Doublet +1
    -- MISSING: hands Amalric Gages +1
    -- MISSING: ring2 Freke Ring
    -- MISSING: waist Refoccilation Stone
    -- MISSING: feet Amalric Nails +1
    sets.HelixBurst = {sub="Ammurapi Shield",
        head=gear.empyrean_head,neck="Mizu. Kubikazari",ear2="Malignance Earring",
        ring1="Mujin Band",
        back=gear.nuke_jse_back,legs=gear.empyrean_legs}
        
    -- MISSING: main Bunzi's Rod
    -- MISSING: ammo Ghastly Tathlum +1
    -- MISSING: ear1 Regal Earring
    -- MISSING: body Amalric Doublet +1
    -- MISSING: hands Amalric Gages +1
    -- MISSING: ring2 Metamorph Ring +1
    -- MISSING: waist Acuity Belt +1
    sets.ResistantHelixBurst = {sub="Ammurapi Shield",
        head=gear.empyrean_head,neck="Mizu. Kubikazari",ear2="Malignance Earring",
        ring1="Mujin Band",
        back=gear.nuke_jse_back,legs=gear.empyrean_legs,feet=gear.empyrean_feet}
    
    -- Gear that converts elemental damage done to recover MP.    
    -- MISSING: body Seidr Cotehardie
    sets.RecoverMP = {}
    
    -- Gear for specific elemental nukes.
    -- MISSING: head Pixie Hairpin +1
    -- MISSING: ring2 Archon Ring
    sets.element.Dark = {}
        
    -- Sets to return to when not performing an action.

     -- Resting sets
    -- MISSING: sub Oneiros Grip
    -- MISSING: ear1 Etiolation Earring
    -- MISSING: body Amalric Doublet +1
    -- MISSING: hands Merlinic Dastanas
    -- MISSING: feet Chironic Slippers
    sets.resting = {main="Chatoyant Staff",ammo="Homiliary",
        head="Befouled Crown",neck="Chrys. Torque",ear2="Ethereal Earring",
        ring1="Defending Ring",ring2="Dark Ring",
        back=gear.idle_jse_back,waist="Fucho-no-obi",legs="Assid. Pants +1"}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    -- NOTE: duplicate ring/ear detected; will validate in Task 2
    -- MISSING: waist Carrier's Sash
    sets.idle = {main="Bolelabunga",sub="Genmei Shield",ammo="Homiliary",
        head="Befouled Crown",neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Ethereal Earring",
        body=gear.relic_body,hands="Nyame Gauntlets",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back=gear.idle_jse_back,legs="Assid. Pants +1",feet="Nyame Sollerets"}

    -- MISSING: main Malignance Pole
    -- MISSING: head Gende. Caubeen +1
    -- MISSING: ear1 Etiolation Earring
    -- MISSING: body Vrikodara Jupon
    -- MISSING: hands Gende. Gages +1
    -- MISSING: waist Carrier's Sash
    sets.idle.PDT = {sub="Umbra Strap",ammo="Staunch Tathlum +1",
        neck="Loricate Torque +1",ear2="Ethereal Earring",
        ring1="Defending Ring",ring2="Dark Ring",
        back=gear.idle_jse_back,legs="Nyame Flanchard",feet=gear.empyrean_feet}
        
    -- MISSING: main Malignance Pole
    -- MISSING: head Gende. Caubeen +1
    -- MISSING: ear1 Etiolation Earring
    -- MISSING: body Mallquis Saio +2
    -- MISSING: hands Gende. Gages +1
    -- MISSING: waist Carrier's Sash
    -- MISSING: feet Battlecast Gaiters
    sets.idle.MDT = {sub="Umbra Strap",ammo="Staunch Tathlum +1",
        neck="Loricate Torque +1",ear2="Ethereal Earring",
        ring1="Defending Ring",ring2="Dark Ring",
        back=gear.idle_jse_back,legs="Nyame Flanchard"}
        
    -- MISSING: main Daybreak
    -- MISSING: head Merlinic Hood
    -- MISSING: ear1 Etiolation Earring
    -- MISSING: ear2 Sanare Earring
    -- MISSING: body Merlinic Doublet
    -- MISSING: hands Gende. Gages +1
    -- MISSING: ring1 Vengeful Ring
    -- MISSING: waist Acuity Belt +1
    -- MISSING: feet Amalric Nails +1
    sets.idle.MEVA = {sub="Genmei Shield",ammo="Staunch Tathlum +1",
        neck="Warder's Charm +1",
        ring2="Purity Ring",
        back=gear.nuke_jse_back,legs="Merlinic Shalwar"}
        
    -- Defense sets

    -- MISSING: main Malignance Pole
    -- MISSING: head Gende. Caubeen +1
    -- MISSING: ear1 Etiolation Earring
    -- MISSING: body Mallquis Saio +2
    -- MISSING: hands Gende. Gages +1
    -- MISSING: waist Carrier's Sash
    -- MISSING: feet Battlecast Gaiters
    sets.defense.PDT = {sub="Umbra Strap",ammo="Staunch Tathlum +1",
        neck="Loricate Torque +1",ear2="Ethereal Earring",
        ring1="Defending Ring",ring2="Dark Ring",
        back=gear.idle_jse_back,legs="Nyame Flanchard"}

    -- MISSING: main Malignance Pole
    -- MISSING: head Gende. Caubeen +1
    -- MISSING: ear1 Etiolation Earring
    -- MISSING: body Mallquis Saio +2
    -- MISSING: hands Gende. Gages +1
    -- MISSING: waist Carrier's Sash
    -- MISSING: feet Battlecast Gaiters
    sets.defense.MDT = {sub="Umbra Strap",ammo="Staunch Tathlum +1",
        neck="Loricate Torque +1",ear2="Ethereal Earring",
        ring1="Defending Ring",ring2="Dark Ring",
        back=gear.idle_jse_back,legs="Nyame Flanchard"}
        
    -- MISSING: main Daybreak
    -- MISSING: head Merlinic Hood
    -- MISSING: ear1 Etiolation Earring
    -- MISSING: ear2 Sanare Earring
    -- MISSING: body Merlinic Doublet
    -- MISSING: hands Gende. Gages +1
    -- MISSING: ring1 Vengeful Ring
    -- MISSING: waist Acuity Belt +1
    -- MISSING: feet Amalric Nails +1
    sets.defense.MEVA = {sub="Genmei Shield",ammo="Staunch Tathlum +1",
        neck="Warder's Charm +1",
        ring2="Purity Ring",
        back=gear.nuke_jse_back,legs="Merlinic Shalwar"}
        
    sets.Kiting = {}
    sets.latent_refresh = {waist="Fucho-no-obi"}
    -- MISSING: sub Oneiros Grip
    sets.latent_refresh_grip = {}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    -- MISSING: ear1 Etiolation Earring
    -- MISSING: waist Carrier's Sash
    -- MISSING: feet Chironic Slippers
    sets.engaged = {main="Bolelabunga",sub="Genmei Shield",ammo="Homiliary",
        head="Befouled Crown",neck="Loricate Torque +1",ear2="Ethereal Earring",
        body=gear.relic_body,hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Sheltered Ring",
        back=gear.idle_jse_back,legs="Assid. Pants +1"}
        
    -- MISSING: ear1 Etiolation Earring
    -- MISSING: waist Carrier's Sash
    -- MISSING: feet Chironic Slippers
    sets.engaged.Acc = {main="Bolelabunga",sub="Genmei Shield",ammo="Homiliary",
        head="Befouled Crown",neck="Loricate Torque +1",ear2="Ethereal Earring",
        body=gear.relic_body,hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Sheltered Ring",
        back=gear.idle_jse_back,legs="Assid. Pants +1"}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    -- MISSING: head Arbatel Bonnet +1
    sets.buff['Ebullience'] = {}
    sets.buff['Rapture'] = {}
    -- MISSING: hands Arbatel Bracers +1
    sets.buff['Perpetuance'] = {}
    sets.buff['Immanence'] = {}
    -- MISSING: legs Arbatel Pants +1
    sets.buff['Penury'] = {}
    sets.buff['Parsimony'] = {}
    sets.buff['Focalization'] = {}
    -- MISSING: feet Peda. Loafers +1
    sets.buff['Celerity'] = {}
    sets.buff['Alacrity'] = {}
    -- MISSING: feet Arbatel Loafers +1
    sets.buff['Klimaform'] = {}
    sets.buff.Doom = set_combine(sets.buff.Doom, {})
    sets.buff['Light Arts'] = {} --legs="Academic's Pants +3"
    sets.buff['Dark Arts'] = {} --body="Academic's Gown +3"
    -- MISSING: head Acad. Mortar. +3
    -- MISSING: waist Embla Sash
    sets.buff.Sublimation = {}
    sets.buff.DTSublimation = {waist="Embla Sash"}    
    
    -- MISSING: head Pixie Hairpin +1
    -- MISSING: ear1 Mendicant's Earring
    -- MISSING: ear2 Evans Earring
    -- MISSING: body Zendik Robe
    -- MISSING: hands Hieros Mittens
    -- MISSING: ring1 Mephitas's Ring +1
    -- MISSING: ring2 Mephitas's Ring
    -- MISSING: back Swith Cape +1
    -- MISSING: waist Carrier's Sash
    -- MISSING: legs Shedir Seraweels
    sets.HPDown = {}
        
    -- MISSING: main Daybreak
    -- MISSING: head Gende. Caubeen +1
    -- MISSING: ear1 Gifted Earring
    -- MISSING: hands Kaykaus Cuffs
    -- MISSING: ring1 Gelatinous Ring +1
    -- MISSING: ring2 Meridian Ring
    -- MISSING: back Moonlight Cape
    -- MISSING: waist Luminary Sash
    -- MISSING: legs Carmine Cuisses +1
    sets.HPCure = {sub="Sors Shield",range=empty,ammo="Hasty Pinion +1",
        neck="Unmoving Collar +1",ear2="Mendi. Earring",
        body="Kaykaus Bliaut",feet="Kaykaus Boots"}
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
    if player.sub_job == 'RDM' then
        set_macro_page(1, 3)
    elseif player.sub_job == 'BLM' then
        set_macro_page(1, 3)
    elseif player.sub_job == 'WHM' then
        set_macro_page(1, 3)
    else
        set_macro_page(1, 3)
    end
end