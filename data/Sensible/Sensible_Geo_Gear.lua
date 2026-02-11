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
    gear.nuke_jse_back = {name="Nantosuelta's Cape",augments={'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', '"Mag.Atk.Bns."+10'}}
    gear.idle_jse_back = {name="Nantosuelta's Cape",augments={'HP+60', 'Eva.+20 /Mag. Eva.+20', 'Mag. Evasion+10', 'Pet: "Regen"+10', 'Pet: Damage taken -5%'}}
    
    -- Reforged Gear (Bagua/Azimuth/Jhakri)
    gear.artifact_head = "Bagua Galero +1"
    gear.artifact_body = "Bagua Tunic +1"
    gear.artifact_hands = "Bagua Mitaines +1"
    gear.artifact_legs = "Bagua Pants +1"
    gear.artifact_feet = "Bagua Sandals"

    gear.empyrean_head = "Azimuth Hood +1"
    gear.empyrean_body = "Azimuth Coat"
    gear.empyrean_hands = "Azimuth Gloves"
    gear.empyrean_legs = "Azimuth Tights"
    gear.empyrean_feet = "Azimuth Gaiters +1"

    gear.relic_body = "Jhakri Robe +2"
    gear.relic_hands = "Jhakri Cuffs +2"
    gear.relic_feet = "Jhakri Pigaches +2"
    
    gear.obi_cure_back = "Tempered Cape +1"
    gear.obi_cure_waist = "Witful Belt"

    gear.obi_low_nuke_back = gear.nuke_jse_back
    gear.obi_low_nuke_waist = "Sekhmet Corset"

    gear.obi_high_nuke_back = gear.nuke_jse_back
    gear.obi_high_nuke_waist = "Refoccilation Stone"
    
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

    -- MISSING: neck Voltsurge Torque
    sets.precast.FC = {main="Mpaca's Staff",sub="Clerisy Strap +1",ammo="Impatiens",
        head="Agwu's Cap",ear1="Loquac. Earring",ear2="Malignance Earring",
        body="Agwu's Robe",hands="Agwu's Gages",ring1="Kishar Ring",ring2="Lebeche Ring",
        back="Swith Cape",waist="Witful Belt",legs="Agwu's Slops",feet="Regal Pumps +1"}

    -- NOTE: duplicate ring/ear detected; will validate in Task 2
    -- MISSING: ear1 Etiolation Earring
    sets.precast.FC.Geomancy = {main="Solstice",sub="Genmei Shield",range="Dunna",
        head=gear.empyrean_head,neck="Incanter's Torque",ear2="Malignance Earring",
        body=gear.artifact_body,hands=gear.artifact_hands,ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back=gear.idle_jse_back,waist="Austerity Belt +1",legs=gear.artifact_legs,feet=gear.empyrean_feet}
    
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ear2="Malignance Earring",hands=gear.artifact_hands})

    -- MISSING: main Serenity
    sets.precast.FC.Cure = set_combine(sets.precast.FC, {sub="Clerisy Strap +1"})
        
    sets.precast.FC.Curaga = sets.precast.FC.Cure
    
    -- MISSING: waist Gishdubar Sash
    sets.Self_Healing = {ring1="Kunaji Ring",ring2="Asklepian Ring"}
    -- MISSING: waist Gishdubar Sash
    sets.Cure_Received = {ring1="Kunaji Ring",ring2="Asklepian Ring"}
    -- MISSING: back Grapevine Cape
    -- MISSING: waist Gishdubar Sash
    -- MISSING: feet Inspirited Boots
    sets.Self_Refresh = {}
    
    -- MISSING: waist Siegel Sash
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.precast.FC.Impact = {}
        
    -- MISSING: main Daybreak
    sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {sub="Genmei Shield"})
    
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}


    --------------------------------------
    -- Midcast sets
    --------------------------------------

    -- MISSING: neck Voltsurge Torque
    sets.midcast.FastRecast = {main="Mpaca's Staff",sub="Clerisy Strap +1",ammo="Impatiens",
        head="Agwu's Cap",ear1="Loquac. Earring",ear2="Malignance Earring",
        body="Agwu's Robe",hands="Agwu's Gages",ring1="Kishar Ring",ring2="Prolix Ring",
        back="Swith Cape",waist="Witful Belt",legs="Agwu's Slops",feet="Regal Pumps +1"}

    -- NOTE: duplicate ring/ear detected; will validate in Task 2
    -- MISSING: ear1 Etiolation Earring
    sets.midcast.Geomancy = {main="Solstice",sub="Genmei Shield",range="Dunna",
        head=gear.empyrean_head,neck="Incanter's Torque",ear2="Malignance Earring",
        body=gear.artifact_body,hands=gear.artifact_hands,ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back=gear.idle_jse_back,waist="Austerity Belt +1",legs=gear.artifact_legs,feet=gear.empyrean_feet}

    --Extra Indi duration as long as you can keep your 900 skill cap.
    sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {})
        
    -- MISSING: ear1 Gifted Earring
    -- MISSING: ear2 Etiolation Earring
    sets.midcast.Cure = {main="Gada",sub="Sors Shield",ammo="Hasty Pinion +1",
        head="Vanya Hood",neck="Incanter's Torque",
        body="Vanya Robe",hands="Vanya Cuffs",ring1="Janniston Ring",ring2="Stikini Ring +1",
        back="Tempered Cape +1",waist="Witful Belt",legs="Vanya Slops",feet="Vanya Clogs"}
        
    -- MISSING: ear1 Gifted Earring
    -- MISSING: ear2 Etiolation Earring
    sets.midcast.LightWeatherCure = {main="Chatoyant Staff",sub="Curatio Grip",ammo="Hasty Pinion +1",
        head="Vanya Hood",neck="Incanter's Torque",
        body="Vanya Robe",hands="Vanya Cuffs",ring1="Janniston Ring",ring2="Stikini Ring +1",
        back="Tempered Cape +1",waist="Witful Belt",legs="Vanya Slops",feet="Vanya Clogs"}
        
    --Cureset for if it's not light weather but is light day.
    -- MISSING: ear1 Gifted Earring
    -- MISSING: ear2 Etiolation Earring
    sets.midcast.LightDayCure = {main="Gada",sub="Sors Shield",ammo="Hasty Pinion +1",
        head="Vanya Hood",neck="Incanter's Torque",
        body="Vanya Robe",hands="Vanya Cuffs",ring1="Janniston Ring",ring2="Stikini Ring +1",
        back="Tempered Cape +1",waist="Witful Belt",legs="Vanya Slops",feet="Vanya Clogs"}

    sets.midcast.Curaga = set_combine(sets.midcast.Cure, {})

    -- MISSING: back Oretan. Cape +1
    sets.midcast.Cursna = set_combine(sets.midcast.Cure, {neck="Debilis Medallion",
        ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt",feet="Vanya Clogs"})
    
    sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,sub="Clemency Grip"})
    
    -- MISSING: main Daybreak
    -- MISSING: ammo Ghastly Tathlum +1
    -- MISSING: neck Saevus Pendant +1
    -- MISSING: ear2 Friomisi Earring
    -- MISSING: hands Mallquis Cuffs +2
    -- MISSING: ring1 Shiva Ring +1
    -- MISSING: ring2 Freke Ring
    -- MISSING: feet Amalric Nails +1
    sets.midcast['Elemental Magic'] = {sub="Ammurapi Shield",
        head=gear.merlinic_nuke_head,ear1="Crematio Earring",
        body=gear.merlinic_nuke_body,
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Merlinic Shalwar"}

    -- MISSING: main Daybreak
    -- MISSING: ammo Pemphredo Tathlum
    -- MISSING: neck Sanctity Necklace
    -- MISSING: ear1 Regal Earring
    -- MISSING: hands Mallquis Cuffs +2
    -- MISSING: ring1 Shiva Ring +1
    -- MISSING: ring2 Freke Ring
    -- MISSING: waist Yamabuki-no-Obi
    -- MISSING: feet Amalric Nails +1
    sets.midcast['Elemental Magic'].Resistant = {sub="Ammurapi Shield",
        head=gear.merlinic_nuke_head,ear2="Malignance Earring",
        body=gear.merlinic_nuke_body,
        back=gear.nuke_jse_back,legs="Merlinic Shalwar"}
        
    -- MISSING: body Seidr Cotehardie
    -- MISSING: hands Regal Cuffs
    -- MISSING: back Swith Cape +1
    -- MISSING: ear2 Gifted Earring
    sets.midcast['Elemental Magic'].Proc = {main=empty,sub=empty,ammo="Impatiens",
        head="Vanya Hood",neck="Loricate Torque +1",ear1="Loquac. Earring",
        ring1="Kishar Ring",ring2="Prolix Ring",
        waist="Witful Belt",legs="Assid. Pants +1",feet="Regal Pumps +1"}
        
    -- MISSING: main Daybreak
    -- MISSING: ammo Ghastly Tathlum +1
    -- MISSING: neck Saevus Pendant +1
    -- MISSING: ear2 Friomisi Earring
    -- MISSING: hands Mallquis Cuffs +2
    -- MISSING: ring1 Shiva Ring +1
    -- MISSING: ring2 Freke Ring
    -- MISSING: feet Amalric Nails +1
    sets.midcast['Elemental Magic'].Fodder = {sub="Ammurapi Shield",
        head=gear.merlinic_nuke_head,ear1="Crematio Earring",
        body=gear.merlinic_nuke_body,
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Merlinic Shalwar"}
        
    -- MISSING: main Daybreak
    -- MISSING: ammo Pemphredo Tathlum
    -- MISSING: neck Baetyl Pendant
    -- MISSING: ear1 Regal Earring
    -- MISSING: hands Amalric Gages +1
    -- MISSING: ring2 Freke Ring
    -- MISSING: feet Amalric Nails +1
    sets.midcast['Elemental Magic'].HighTierNuke = {sub="Ammurapi Shield",
        head=gear.merlinic_nuke_head,ear2="Malignance Earring",
        body=gear.merlinic_nuke_body,ring1="Metamor. Ring +1",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Merlinic Shalwar"}
        
    -- MISSING: main Daybreak
    -- MISSING: ammo Pemphredo Tathlum
    -- MISSING: neck Sanctity Necklace
    -- MISSING: ear1 Regal Earring
    -- MISSING: hands Amalric Gages +1
    -- MISSING: ring2 Freke Ring
    -- MISSING: waist Yamabuki-no-Obi
    -- MISSING: feet Amalric Nails +1
    sets.midcast['Elemental Magic'].HighTierNuke.Resistant = {sub="Ammurapi Shield",
        head=gear.merlinic_nuke_head,ear2="Malignance Earring",
        body=gear.merlinic_nuke_body,ring1="Metamor. Ring +1",
        back=gear.nuke_jse_back,legs="Merlinic Shalwar"}

    -- MISSING: main Daybreak
    -- MISSING: ammo Pemphredo Tathlum
    -- MISSING: neck Saevus Pendant +1
    -- MISSING: ear1 Regal Earring
    -- MISSING: hands Amalric Gages +1
    -- MISSING: ring2 Freke Ring
    -- MISSING: feet Amalric Nails +1
    sets.midcast['Elemental Magic'].HighTierNuke.Fodder = {sub="Ammurapi Shield",
        head=gear.merlinic_nuke_head,ear2="Malignance Earring",
        body=gear.merlinic_nuke_body,ring1="Metamor. Ring +1",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Merlinic Shalwar"}
        
    -- MISSING: main Rubicundity
    -- MISSING: ammo Pemphredo Tathlum
    -- MISSING: ear1 Regal Earring
    -- MISSING: hands Amalric Gages +1
    -- MISSING: waist Yamabuki-no-Obi
    sets.midcast['Dark Magic'] = {sub="Ammurapi Shield",
        head=gear.merlinic_nuke_head,neck="Erra Pendant",ear2="Malignance Earring",
        body=gear.merlinic_nuke_body,ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}
        
    -- MISSING: main Rubicundity
    -- MISSING: ammo Pemphredo Tathlum
    -- MISSING: head Pixie Hairpin +1
    -- MISSING: ear1 Regal Earring
    -- MISSING: hands Amalric Gages +1
    -- MISSING: ring1 Archon Ring
    sets.midcast.Drain = {sub="Ammurapi Shield",
        neck="Erra Pendant",ear2="Malignance Earring",
        body=gear.merlinic_nuke_body,ring2="Evanescence Ring",
        back=gear.nuke_jse_back,waist="Fucho-no-obi",legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}
    
    sets.midcast.Aspir = sets.midcast.Drain
        
    -- MISSING: head Amalric Coif +1
    -- MISSING: neck Voltsurge Torque
    -- MISSING: ear1 Enchntr. Earring +1
    -- MISSING: body Zendik Robe
    -- MISSING: hands Volte Gloves
    -- MISSING: back Lifestream Cape
    -- MISSING: legs Psycloth Lappas
    sets.midcast.Stun = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
        ear2="Malignance Earring",
        ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
        waist="Witful Belt",feet="Regal Pumps +1"}
        
    -- MISSING: main Daybreak
    -- MISSING: ammo Pemphredo Tathlum
    -- MISSING: head Amalric Coif +1
    -- MISSING: ear1 Regal Earring
    -- MISSING: body Zendik Robe
    -- MISSING: hands Amalric Gages +1
    -- MISSING: waist Acuity Belt +1
    sets.midcast.Stun.Resistant = {sub="Ammurapi Shield",
        neck="Erra Pendant",ear2="Malignance Earring",
        body=gear.merlinic_nuke_body,ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}
        
    -- MISSING: main Daybreak
    -- MISSING: ammo Pemphredo Tathlum
    -- MISSING: ear1 Regal Earring
    -- MISSING: body Twilight Cloak
    -- MISSING: hands Regal Cuffs
    -- MISSING: waist Acuity Belt +1
    -- MISSING: feet Amalric Nails +1
    sets.midcast.Impact = {sub="Ammurapi Shield",
        head=empty,neck="Erra Pendant",ear2="Malignance Earring",
        ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,legs="Merlinic Shalwar"}
        
    -- MISSING: main Daybreak
    -- MISSING: ammo Pemphredo Tathlum
    -- MISSING: head Amalric Coif +1
    -- MISSING: ear1 Regal Earring
    -- MISSING: body Zendik Robe
    -- MISSING: hands Amalric Gages +1
    -- MISSING: waist Acuity Belt +1
    sets.midcast.Dispel = {sub="Ammurapi Shield",
        neck="Erra Pendant",ear2="Malignance Earring",
        body=gear.merlinic_nuke_body,ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}

    sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {main="Daybreak",sub="Ammurapi Shield"})
        
    -- MISSING: main Daybreak
    -- MISSING: ammo Pemphredo Tathlum
    -- MISSING: ear1 Regal Earring
    -- MISSING: ear2 Digni. Earring
    -- MISSING: hands Regal Cuffs
    -- MISSING: waist Luminary Sash
    -- MISSING: legs Psycloth Lappas
    -- MISSING: feet Uk'uxkaj Boots
    sets.midcast['Enfeebling Magic'] = {sub="Ammurapi Shield",
        head="Befouled Crown",neck="Erra Pendant",
        body=gear.merlinic_nuke_body,ring1="Kishar Ring",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back}
        
    -- MISSING: main Daybreak
    -- MISSING: ammo Pemphredo Tathlum
    -- MISSING: ear1 Regal Earring
    -- MISSING: ear2 Digni. Earring
    -- MISSING: hands Regal Cuffs
    -- MISSING: waist Luminary Sash
    -- MISSING: legs Psycloth Lappas
    -- MISSING: feet Skaoi Boots
    sets.midcast['Enfeebling Magic'].Resistant = {sub="Ammurapi Shield",
        head="Befouled Crown",neck="Erra Pendant",
        body=gear.merlinic_nuke_body,ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back}
        
    -- MISSING: head Amalric Coif +1
    -- MISSING: waist Acuity Belt +1
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {ear2="Malignance Earring"})
    -- MISSING: head Amalric Coif +1
    -- MISSING: waist Acuity Belt +1
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {ear2="Malignance Earring"})
    
    sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
    sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
    
    sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
    sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
    
    sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {ring1="Stikini Ring +1"})
        
    -- NOTE: duplicate ring/ear detected; will validate in Task 2
    -- MISSING: head Telchine Cap
    -- MISSING: ear2 Gifted Earring
    -- MISSING: back Perimede Cape
    -- MISSING: waist Embla Sash
    sets.midcast['Enhancing Magic'] = {main=gear.gada_enhancing_club,sub="Ammurapi Shield",ammo="Hasty Pinion +1",
        neck="Incanter's Torque",ear1="Andoaa Earring",
        body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        legs="Telchine Braconi",feet="Telchine Pigaches"}
        
    -- MISSING: waist Siegel Sash
    -- MISSING: legs Shedir Seraweels
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring"})
    
    -- MISSING: head Amalric Coif +1
    sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {})
    
    -- MISSING: head Amalric Coif +1
    -- MISSING: hands Regal Cuffs
    -- MISSING: waist Emphatikos Rope
    -- MISSING: legs Shedir Seraweels
    sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Genmei Shield"})
    
    -- MISSING: legs Shedir Seraweels
    sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})
    
    -- MISSING: ear1 Gifted Earring
    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear2="Malignance Earring",waist="Sekhmet Corset"})
    -- MISSING: ear1 Gifted Earring
    sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear2="Malignance Earring",waist="Sekhmet Corset"})
    -- MISSING: ear1 Gifted Earring
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear2="Malignance Earring",waist="Sekhmet Corset"})
    -- MISSING: ear1 Gifted Earring
    sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear2="Malignance Earring",waist="Sekhmet Corset"})

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    -- Resting sets
    -- MISSING: sub Oneiros Grip
    -- MISSING: ear1 Etiolation Earring
    -- MISSING: back Umbra Cape
    sets.resting = {main="Chatoyant Staff",
        head="Befouled Crown",neck="Chrys. Torque",ear2="Ethereal Earring",
        body=gear.relic_body,hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
        legs="Assid. Pants +1",feet=gear.merlinic_refresh_feet}

    -- Idle sets

    -- NOTE: duplicate ring/ear detected; will validate in Task 2
    -- MISSING: ammo Staunch Tathlum +1
    -- MISSING: back Umbra Cape
    sets.idle = {main="Bolelabunga",sub="Genmei Shield",
        head="Befouled Crown",neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Ethereal Earring",
        body=gear.relic_body,hands="Nyame Gauntlets",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Nyame Sollerets"}
        
    -- MISSING: ammo Staunch Tathlum +1
    -- MISSING: ear1 Genmei Earring
    -- MISSING: waist Carrier's Sash
    -- MISSING: feet Mallquis Clogs +2
    sets.idle.PDT = {main="Malignance Pole",sub="Umbra Strap",
        head="Nyame Helm",neck="Loricate Torque +1",ear2="Ethereal Earring",
        body=gear.relic_body,hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
        back="Shadow Mantle",legs="Nyame Flanchard"}

    -- .Pet sets are for when Luopan is present.
    -- MISSING: main Sucellus
    -- MISSING: ear2 Handler's Earring +1
    -- MISSING: waist Isa Belt
    -- MISSING: legs Psycloth Lappas
    sets.idle.Pet = {sub="Genmei Shield",range="Dunna",
        head=gear.empyrean_head,neck="Loricate Torque +1",ear1="Handler's Earring",
        body=gear.relic_body,hands=gear.artifact_hands,ring1="Defending Ring",ring2="Dark Ring",
        back=gear.idle_jse_back,feet=gear.artifact_feet}

    -- MISSING: ear2 Handler's Earring +1
    -- MISSING: waist Isa Belt
    sets.idle.PDT.Pet = {main="Malignance Pole",sub="Umbra Strap",range="Dunna",
        head=gear.empyrean_head,neck="Loricate Torque +1",ear1="Handler's Earring",
        body=gear.relic_body,hands=gear.artifact_hands,ring1="Defending Ring",ring2="Dark Ring",
        back=gear.idle_jse_back,legs="Nyame Flanchard",feet=gear.artifact_feet}

    -- .Indi sets are for when an Indi-spell is active.
    sets.idle.Indi = set_combine(sets.idle, {})
    sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {}) 
    sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {}) 
    sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {})

    -- MISSING: ammo Staunch Tathlum +1
    -- MISSING: ear1 Etiolation Earring
    -- MISSING: back Umbra Cape
    -- MISSING: waist Carrier's Sash
    sets.idle.Weak = {main="Bolelabunga",sub="Genmei Shield",
        head="Befouled Crown",neck="Loricate Torque +1",ear2="Ethereal Earring",
        body=gear.relic_body,hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
        legs="Assid. Pants +1",feet=gear.empyrean_feet}

    -- Defense sets
    
    -- MISSING: ammo Staunch Tathlum +1
    -- MISSING: ear1 Etiolation Earring
    -- MISSING: ear2 Handler's Earring +1
    -- MISSING: body Mallquis Saio +2
    -- MISSING: back Umbra Cape
    -- MISSING: waist Carrier's Sash
    sets.defense.PDT = {main="Malignance Pole",sub="Umbra Strap",
        head="Nyame Helm",neck="Loricate Torque +1",
        body=gear.relic_body,hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Dark Ring",
        legs="Nyame Flanchard",feet=gear.empyrean_feet}

    -- MISSING: ammo Staunch Tathlum +1
    -- MISSING: ear1 Etiolation Earring
    -- MISSING: ear2 Handler's Earring +1
    -- MISSING: body Mallquis Saio +2
    -- MISSING: back Umbra Cape
    -- MISSING: waist Carrier's Sash
    sets.defense.MDT = {main="Malignance Pole",sub="Umbra Strap",
        head=gear.empyrean_head,neck="Loricate Torque +1",
        body=gear.relic_body,hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Dark Ring",
        legs="Nyame Flanchard",feet=gear.empyrean_feet}
        
    -- MISSING: ammo Staunch Tathlum +1
    -- MISSING: ear1 Etiolation Earring
    -- MISSING: ear2 Sanare Earring
    -- MISSING: waist Luminary Sash
    sets.defense.MEVA = {main="Malignance Pole",sub="Enki Strap",
        head=gear.empyrean_head,neck="Warder's Charm +1",
        body=gear.merlinic_nuke_body,hands="Telchine Gloves",ring1="Vengeful Ring",ring2="Purity Ring",
        back=gear.idle_jse_back,legs="Telchine Braconi",feet=gear.empyrean_feet}
        
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
    
    -- MISSING: head Pixie Hairpin +1
    -- MISSING: ear1 Mendicant's Earring
    -- MISSING: ear2 Evans Earring
    -- MISSING: ring1 Mephitas's Ring +1
    -- MISSING: ring2 Mephitas's Ring
    -- MISSING: back Swith Cape +1
    -- MISSING: legs Shedir Seraweels
    sets.HPDown = {body=gear.relic_body,hands=gear.relic_hands,feet=gear.relic_feet}
    
    sets.buff.Doom = set_combine(sets.buff.Doom, {})

    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- NOTE: duplicate ring/ear detected; will validate in Task 2
    -- MISSING: neck Asperity Necklace
    -- MISSING: ear1 Cessance Earring
    -- MISSING: ear2 Brutal Earring
    -- MISSING: hands Gazu Bracelet +1
    -- MISSING: ring1 Ramuh Ring +1
    -- MISSING: ring2 Ramuh Ring +1
    -- MISSING: back Moonlight Cape
    -- MISSING: feet Battlecast Gaiters
    -- Normal melee group
    sets.engaged = {ammo="Hasty Pinion +1",
        head="Befouled Crown",
        body=gear.relic_body,
        waist="Witful Belt",legs="Assid. Pants +1"}
        
    -- NOTE: duplicate ring/ear detected; will validate in Task 2
    -- MISSING: neck Asperity Necklace
    -- MISSING: ear1 Dudgeon Earring
    -- MISSING: ear2 Heartseeker Earring
    -- MISSING: hands Regal Cuffs
    -- MISSING: ring1 Ramuh Ring +1
    -- MISSING: ring2 Ramuh Ring +1
    -- MISSING: back Moonlight Cape
    -- MISSING: feet Battlecast Gaiters
    sets.engaged.DW = {ammo="Hasty Pinion +1",
        head="Befouled Crown",
        body=gear.relic_body,
        waist="Witful Belt",legs="Assid. Pants +1"}

    --------------------------------------
    -- Custom buff sets
    --------------------------------------
    
    -- Gear that converts elemental damage done to recover MP.    
    sets.RecoverMP = {body="Seidr Cotehardie"}
    
    -- Gear for Magic Burst mode.
    -- MISSING: sub Alber Strap
    -- MISSING: head Ea Hat +1
    -- MISSING: body Ea Houppe. +1
    -- MISSING: legs Ea Slops +1
    sets.MagicBurst = {main=gear.grioavolr_nuke_staff,neck="Mizu. Kubikazari",ring1="Mujin Band",feet=gear.relic_feet}
    -- MISSING: head Ea Hat +1
    -- MISSING: body Ea Houppe. +1
    -- MISSING: legs Ea Slops +1
    sets.ResistantMagicBurst = {main=gear.grioavolr_nuke_staff,sub="Enki Strap",neck="Mizu. Kubikazari",ring1="Mujin Band",feet=gear.relic_feet}
    
    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
    
    -- Weapons sets
    sets.weapons.Maxentius = {main="Maxentius",sub="Genmei Shield"}
    sets.weapons.DualWeapons = {main="Maxentius",sub="Nehushtan"}
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
    set_macro_page(1, 10)
end

function user_job_lockstyle()
    windower.chat.input('/lockstyleset 003')
end