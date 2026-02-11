-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal')
    state.CastingMode:options('Normal','Resistant','Proc','OccultAcumen','9k')
    state.IdleMode:options('Normal','PDT')
    state.HybridMode:options('Normal','PDT')
    state.Weapons:options('None','Bunzi','Maxentius')

    default_weapons = 'Maxentius'

    autows_list = {['Maxentius']='Black Halo'}

    gear.nuke_jse_back = {name="Lugh's Cape",augments={'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', '"Mag.Atk.Bns."+10'}}

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
    sets.weapons.Bunzi = {main="Bunzi's Rod",sub="Ammurapi Shield"}
    sets.weapons.Maxentius = {main="Maxentius",sub="Ammurapi Shield"}

    -- Precast Sets

    -- MISSING: legs Peda. Pants +1
    sets.precast.JA['Tabula Rasa'] = {}
    sets.precast.JA['Enlightenment'] = {}

    -- Fast cast sets for spells
    -- MISSING: ear1 Enchntr. Earring +1
    -- MISSING: body Zendik Robe
    -- MISSING: hands Acad. Bracers +3
    -- MISSING: legs Psycloth Lappas
    -- MISSING: feet Regal Pumps +1
    sets.precast.FC = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Impatiens",
        head="Amalric Coif +1",neck="Voltsurge Torque",ear2="Malignance Earring",
        ring1="Kishar Ring",ring2="Lebeche Ring",
        back="Perimede Cape",waist="Witful Belt"}

    -- MISSING: body Pinga Tunic
    -- MISSING: hands Gende. Gages +1
    -- MISSING: legs Pinga Pants
    sets.precast.FC.DT = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Impatiens",
        head=gear.merlinic_fc_head,neck="Orunmila's Torque",ear1="Malignance Earring",ear2="Loquac. Earring",
        ring1="Kishar Ring",ring2="Lebeche Ring",
        back="Perimede Cape",waist="Witful Belt",feet=gear.merlinic_fc_feet}

    sets.precast.FC.Arts = {}
    sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak",ear1="Malignance Earring"})
    sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    -- MISSING: ammo Oshasha's Treatise
    -- MISSING: ring1 Epaminondas's Ring
    -- MISSING: ring2 Cornelia's Ring
    -- MISSING: back Null Shawl
    sets.precast.WS = {
        head="Nyame Helm",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",
        waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    -- NOTE: duplicate ring/ear detected; will validate in Task 2
    -- MISSING: ring1 Mephitas's Ring +1
    -- MISSING: ring2 Mephitas's Ring
    -- MISSING: back Aurist's Cape +1
    -- MISSING: legs Psycloth Lappas
    -- MISSING: hands Regal Cuffs
    sets.precast.WS['Myrkr'] = {ammo="Ghastly Tathlum +1",
        head="Pixie Hairpin +1",neck="Sanctity Necklace",ear1="Evans Earring",ear2="Etiolation Earring",
        body="Amalric Doublet +1",
        waist="Luminary Sash",feet="Kaykaus Boots +1"}

    -- Midcast Sets

    -- MISSING: ear1 Enchntr. Earring +1
    -- MISSING: body Zendik Robe
    -- MISSING: hands Gende. Gages +1
    -- MISSING: legs Psycloth Lappas
    -- MISSING: feet Regal Pumps +1
    -- MISSING: back Swith Cape +1
    sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
        head="Amalric Coif +1",neck="Voltsurge Torque",ear2="Malignance Earring",
        ring1="Kishar Ring",ring2="Prolix Ring",
        waist="Witful Belt"}

    -- MISSING: main Serenity
    -- MISSING: head Gende. Caubeen +1
    -- MISSING: ear1 Meili Earring
    -- MISSING: ring1 Janniston Ring
    sets.midcast.Cure = {sub="Curatio Grip",ammo="Hasty Pinion +1",
        neck="Incanter's Torque",ear2="Malignance Earring",
        body="Kaykaus Bliaut +1",hands="Kaykaus Cuffs +1",ring2="Lebeche Ring",
        waist="Luminary Sash",legs="Chironic Hose",feet="Kaykaus Boots +1"}

    -- MISSING: head Gende. Caubeen +1
    -- MISSING: ear1 Meili Earring
    -- MISSING: ring1 Janniston Ring
    sets.midcast.LightWeatherCure = {main="Chatoyant Staff",sub="Curatio Grip",ammo="Hasty Pinion +1",
        neck="Incanter's Torque",ear2="Malignance Earring",
        body="Kaykaus Bliaut +1",hands="Kaykaus Cuffs +1",ring2="Lebeche Ring",
        back="Twilight Cape",waist="Hachirin-no-Obi",legs="Chironic Hose",feet="Kaykaus Boots +1"}

    -- MISSING: main Serenity
    -- MISSING: head Gende. Caubeen +1
    -- MISSING: ear1 Meili Earring
    -- MISSING: ring1 Janniston Ring
    sets.midcast.LightDayCure = {sub="Curatio Grip",ammo="Hasty Pinion +1",
        neck="Incanter's Torque",ear2="Malignance Earring",
        body="Kaykaus Bliaut +1",hands="Kaykaus Cuffs +1",ring2="Lebeche Ring",
        back="Twilight Cape",waist="Hachirin-no-Obi",legs="Chironic Hose",feet="Kaykaus Boots +1"}

    sets.midcast.Curaga = sets.midcast.Cure

    -- MISSING: neck Phalaina Locket
    -- MISSING: ring2 Asklepian Ring
    sets.Self_Healing = {ring1="Kunaji Ring",waist="Gishdubar Sash"}
    -- MISSING: neck Phalaina Locket
    -- MISSING: ring2 Asklepian Ring
    sets.Cure_Received = {ring1="Kunaji Ring",waist="Gishdubar Sash"}
    -- MISSING: feet Inspirited Boots
    sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}

    -- MISSING: ear1 Meili Earring
    -- MISSING: body Zendik Robe
    -- MISSING: hands Hieros Mittens
    -- MISSING: legs Psycloth Lappas
    -- MISSING: feet Vanya Clogs
    sets.midcast.Cursna = {main=gear.grioavolr_fc_staff,sub="Clemency Grip",ammo="Hasty Pinion +1",
        head="Amalric Coif +1",neck="Debilis Medallion",ear2="Malignance Earring",
        ring1="Haoma's Ring",ring2="Menelaus's Ring",
        back="Oretan. Cape +1",waist="Witful Belt"}

    sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,sub="Clemency Grip"})

    -- NOTE: duplicate ring/ear detected; will validate in Task 2
    -- MISSING: ammo Savant's Treatise
    -- MISSING: head Telchine Cap
    -- MISSING: body Telchine Chas.
    -- MISSING: hands Telchine Gloves
    -- MISSING: waist Embla Sash
    -- MISSING: legs Telchine Braconi
    sets.midcast['Enhancing Magic'] = {sub="Ammurapi Shield",
        neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
        ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back="Perimede Cape",feet="Telchine Pigaches"}

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {back=gear.nuke_jse_back})

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})

    sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})

    -- MISSING: main Vadose Rod
    -- MISSING: hands Regal Cuffs
    sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {sub="Genmei Shield",head="Amalric Coif +1",waist="Emphatikos Rope",legs="Shedir Seraweels"})

    sets.midcast.BarElement = set_combine(sets.precast.FC, {waist="Siegel Sash",legs="Shedir Seraweels"})

    -- MISSING: feet Peda. Loafers +1
    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {})

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shellra = sets.midcast.Shell


    -- Custom spell classes

    -- MISSING: head Acad. Mortar. +3
    -- MISSING: body Chironic Doublet
    -- MISSING: hands Regal Cuffs
    -- MISSING: feet Uk'uxkaj Boots
    sets.midcast['Enfeebling Magic'] = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        ring1="Kishar Ring",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Obstin. Sash",legs="Chironic Hose"}

    -- MISSING: head Acad. Mortar. +3
    -- MISSING: body Chironic Doublet
    -- MISSING: hands Acad. Bracers +3
    -- MISSING: feet Medium's Sabots
    sets.midcast['Enfeebling Magic'].Resistant = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
        ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Luminary Sash",legs="Chironic Hose"}

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1",ear2="Malignance Earring",back=gear.nuke_jse_back,waist="Acuity Belt +1"})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",back=gear.nuke_jse_back,waist="Acuity Belt +1"})

    sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.chironic_treasure_feet})
    sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
    sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
    sets.midcast['Dia II'] = sets.midcast['Enfeebling Magic']
    sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
    sets.midcast['Bio II'] = sets.midcast['Enfeebling Magic']

    sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {ring2="Stikini Ring +1",feet=gear.chironic_nuke_feet})

    -- NOTE: duplicate ring/ear detected; will validate in Task 2
    -- MISSING: body Chironic Doublet
    -- MISSING: hands Acad. Bracers +3
    sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Amalric Coif +1",neck="Incanter's Torque",ear1="Regal Earring",ear2="Malignance Earring",
        ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Chironic Hose",feet=gear.merlinic_aspir_feet}

    -- MISSING: main Akademos
    -- MISSING: ear1 Crematio Earring
    sets.midcast.Kaustra = {sub="Enki Strap",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Saevus Pendant +1",ear2="Malignance Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Freke Ring",ring2="Archon Ring",
        back=gear.nuke_jse_back,waist="Refoccilation Stone",legs="Merlinic Shalwar",feet="Amalric Nails +1"}

    sets.midcast.Kaustra.Resistant = {main=gear.grioavolr_nuke_staff,sub="Enki Strap",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Erra Pendant",ear1="Crematio Earring",ear2="Malignance Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Freke Ring",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet="Amalric Nails +1"}

    -- MISSING: body Chironic Doublet
    -- MISSING: hands Acad. Bracers +3
    sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        ring1="Evanescence Ring",ring2="Archon Ring",
        back=gear.nuke_jse_back,waist="Fucho-no-obi",legs="Chironic Hose",feet=gear.merlinic_aspir_feet}

    -- NOTE: duplicate ring/ear detected; will validate in Task 2
    -- MISSING: body Chironic Doublet
    -- MISSING: hands Acad. Bracers +3
    sets.midcast.Drain.Resistant = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Amalric Coif +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Chironic Hose",feet=gear.merlinic_aspir_feet}

    sets.midcast.Aspir = sets.midcast.Drain
    sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

    -- MISSING: ear1 Enchntr. Earring +1
    -- MISSING: body Zendik Robe
    -- MISSING: hands Acad. Bracers +3
    -- MISSING: legs Psycloth Lappas
    -- MISSING: feet Regal Pumps +1
    sets.midcast.Stun = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
        head="Amalric Coif +1",neck="Voltsurge Torque",ear2="Malignance Earring",
        ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Witful Belt"}

    -- MISSING: head Acad. Mortar. +3
    -- MISSING: body Zendik Robe
    -- MISSING: hands Acad. Bracers +3
    sets.midcast.Stun.Resistant = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Chironic Hose",feet=gear.merlinic_aspir_feet}

    -- Elemental Magic sets are default for handling low-tier nukes.
    -- MISSING: head Agwu's Cap
    -- MISSING: ear1 Crematio Earring
    -- MISSING: legs Merlinic Shalwar
    sets.midcast['Elemental Magic'] = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
        neck="Saevus Pendant +1",ear2="Friomisi Earring",
        body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Freke Ring",ring2="Shiva Ring +1",
        back=gear.nuke_jse_back,waist="Refoccilation Stone",feet="Amalric Nails +1"}

    -- MISSING: head Agwu's Cap
    -- MISSING: hands Mallquis Cuffs +2
    -- MISSING: legs Merlinic Shalwar
    -- MISSING: feet Agwu's Pigaches
    sets.midcast['Elemental Magic'].Resistant = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        neck="Sanctity Necklace",ear1="Regal Earring",ear2="Malignance Earring",
        body="Amalric Doublet +1",ring1="Freke Ring",ring2="Metamor. Ring +1",
        back=gear.nuke_jse_back,waist="Acuity Belt +1"}

    -- MISSING: ear1 Crematio Earring
    -- MISSING: hands Mallquis Cuffs +2
    -- MISSING: back Swith Cape +1
    -- MISSING: legs Psycloth Lappas
    -- MISSING: feet Regal Pumps +1
    sets.midcast['Elemental Magic']['9k'] = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Saevus Pendant +1",ear2="Malignance Earring",
        body=gear.merlinic_nuke_body,ring1="Shiva Ring +1",ring2="Freke Ring",
        waist="Witful Belt"}

    -- MISSING: head Vanya Hood
    -- MISSING: ear1 Enchntr. Earring +1
    -- MISSING: body Zendik Robe
    -- MISSING: hands Gende. Gages +1
    -- MISSING: back Swith Cape +1
    -- MISSING: legs Psycloth Lappas
    -- MISSING: feet Regal Pumps +1
    sets.midcast['Elemental Magic'].Proc = {main=empty, sub=empty,ammo="Impatiens",
        neck="Voltsurge Torque",ear2="Malignance Earring",
        ring1="Kishar Ring",ring2="Prolix Ring",
        waist="Witful Belt"}

    -- MISSING: sub Bloodrain Strap
    -- MISSING: ammo Seraphic Ampulla
    -- MISSING: head Mall. Chapeau +2
    -- MISSING: waist Oneiros Rope
    -- MISSING: legs Perdition Slops
    sets.midcast['Elemental Magic'].OccultAcumen = {main="Khatvanga",
        neck="Combatant's Torque",ear1="Dedition Earring",ear2="Telos Earring",
        body=gear.merlinic_occult_body,hands=gear.merlinic_occult_hands,ring1="Rajas Ring",ring2="Petrov Ring",
        back=gear.nuke_jse_back,feet=gear.merlinic_occult_feet}

    -- Custom refinements for certain nuke tiers
    -- MISSING: head Merlinic Hood
    -- MISSING: legs Merlinic Shalwar
    sets.midcast['Elemental Magic'].HighTierNuke = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
        neck="Saevus Pendant +1",ear1="Regal Earring",ear2="Malignance Earring",
        body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Freke Ring",ring2="Metamorph Ring +1",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",feet="Amalric Nails +1"}

    -- MISSING: head Merlinic Hood
    -- MISSING: legs Merlinic Shalwar
    sets.midcast['Elemental Magic'].HighTierNuke.Resistant = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
        neck="Sanctity Necklace",ear1="Regal Earring",ear2="Malignance Earring",
        body="Amalric Doublet +1",hands="Jhakri Cuffs +2",ring1="Freke Ring",ring2="Metamorph Ring +1",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",feet="Jhakri Pigaches +2"}

    -- MISSING: head Merlinic Hood
    -- MISSING: ear1 Crematio Earring
    -- MISSING: legs Merlinic Shalwar
    sets.midcast.Helix = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
        neck="Saevus Pendant +1",ear2="Friomisi Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Freke Ring",
        back=gear.nuke_jse_back,waist="Refoccilation Stone",feet="Amalric Nails +1"}

    -- MISSING: legs Merlinic Shalwar
    sets.midcast.Helix.Resistant = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Sanctity Necklace",ear1="Malignance Earring",ear2="Friomisi Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Freke Ring",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",feet="Amalric Nails +1"}

    -- MISSING: head Vanya Hood
    -- MISSING: ear1 Enchntr. Earring +1
    -- MISSING: body Zendik Robe
    -- MISSING: hands Gende. Gages +1
    -- MISSING: back Swith Cape +1
    -- MISSING: legs Psycloth Lappas
    -- MISSING: feet Regal Pumps +1
    sets.midcast.Helix.Proc = {main=empty, sub=empty,ammo="Impatiens",
        neck="Voltsurge Torque",ear2="Malignance Earring",
        ring1="Kishar Ring",ring2="Prolix Ring",
        waist="Witful Belt"}

    -- MISSING: hands Acad. Bracers +3
    -- MISSING: legs Merlinic Shalwar
    sets.midcast.Impact = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head=empty,neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        body="Twilight Cloak",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",feet="Amalric Nails +1"}

    sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {head=empty,body="Twilight Cloak"})

    -- Gear for Magic Burst mode.
    -- MISSING: head Agwu's Cap
    -- MISSING: legs Agwu's Slops
    sets.MagicBurst = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
        neck="Mizukage-no-Kubikazari",ear1="Regal Earring",ear2="Malignance Earring",
        body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Freke Ring",ring2="Mujin Band",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",feet="Amalric Nails +1"}
    -- MISSING: head Agwu's Cap
    -- MISSING: legs Agwu's Slops
    sets.HelixBurst = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
        neck="Mizukage-no-Kubikazari",ear1="Regal Earring",ear2="Malignance Earring",
        body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Freke Ring",ring2="Mujin Band",
        back=gear.nuke_jse_back,waist="Refoccilation Stone",feet="Amalric Nails +1"}
    -- MISSING: head Agwu's Cap
    -- MISSING: legs Agwu's Slops
    -- MISSING: feet Agwu's Pigaches
    sets.ResistantHelixBurst = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
        neck="Mizukage-no-Kubikazari",ear1="Regal Earring",ear2="Malignance Earring",
        body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Mujin Band",ring2="Metamorph Ring +1",
        back=gear.nuke_jse_back,waist="Acuity Belt +1"}

    -- Gear that converts elemental damage done to recover MP.
    -- MISSING: body Seidr Cotehardie
    sets.RecoverMP = {}

    -- Gear for specific elemental nukes.
    sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}

    -- Sets to return to when not performing an action.

    -- Resting sets
    -- MISSING: sub Oneiros Grip
    -- MISSING: head Befouled Crown
    -- MISSING: neck Chrys. Torque
    -- MISSING: ring2 Dark Ring
    -- MISSING: back Umbra Cape
    -- MISSING: legs Assid. Pants +1
    sets.resting = {main="Chatoyant Staff",ammo="Homiliary",
        ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Amalric Doublet +1",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",
        waist="Fucho-no-obi",feet=gear.chironic_refresh_feet}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    -- NOTE: duplicate ring/ear detected; will validate in Task 2
    -- MISSING: main Mpaca's Staff
    -- MISSING: head Befouled Crown
    -- MISSING: back Umbra Cape
    -- MISSING: legs Assid. Pants +1
    sets.idle = {sub="Umbra Strap",ammo="Homiliary",
        neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        waist="Carrier's Sash",feet=gear.chironic_refresh_feet}

    -- MISSING: head Gende. Caubeen +1
    -- MISSING: hands Gende. Gages +1
    -- MISSING: ring2 Dark Ring
    -- MISSING: back Umbra Cape
    sets.idle.PDT = {main="Malignance Pole",sub="Umbra Strap",ammo="Staunch Tathlum +1",
        neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Vrikodara Jupon",ring1="Defending Ring",
        waist="Carrier's Sash",legs="Nyame Flanchard",feet=gear.chironic_refresh_feet}

    -- MISSING: head Arbatel Bonnet +3
    -- MISSING: neck Warder's Charm +1
    -- MISSING: body Arbatel Gown +3
    -- MISSING: hands Arbatel Bracers +3
    -- MISSING: ring2 Shadow Ring
    -- MISSING: back Null Shawl
    -- MISSING: waist Null Belt
    -- MISSING: legs Arbatel Pants +3
    -- MISSING: feet Arbatel Loafers +3
    sets.idle.MDT = {main="Daybreak",sub="Genmei Shield",range=empty,ammo="Staunch Tathlum +1",
        ear1="Etiolation Earring",ear2="Sanare Earring",
        ring1="Defending Ring"}

    -- MISSING: head Arbatel Bonnet +3
    -- MISSING: neck Null Loop
    -- MISSING: body Arbatel Gown +3
    -- MISSING: hands Arbatel Bracers +3
    -- MISSING: ring2 Shadow Ring
    -- MISSING: back Null Shawl
    -- MISSING: waist Null Belt
    -- MISSING: legs Arbatel Pants +3
    -- MISSING: feet Arbatel Loafers +3
    sets.idle.MEVA = {main="Daybreak",sub="Genmei Shield",range=empty,ammo="Staunch Tathlum +1",
        ear1="Etiolation Earring",ear2="Sanare Earring",
        ring1="Defending Ring"}

    -- Defense sets

    -- MISSING: head Gende. Caubeen +1
    -- MISSING: body Mallquis Saio +2
    -- MISSING: hands Gende. Gages +1
    -- MISSING: ring2 Dark Ring
    -- MISSING: back Umbra Cape
    -- MISSING: feet Battlecast Gaiters
    sets.defense.PDT = {main="Malignance Pole",sub="Umbra Strap",ammo="Staunch Tathlum +1",
        neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        ring1="Defending Ring",
        waist="Carrier's Sash",legs="Nyame Flanchard"}

    -- MISSING: head Gende. Caubeen +1
    -- MISSING: body Mallquis Saio +2
    -- MISSING: hands Gende. Gages +1
    -- MISSING: ring2 Dark Ring
    -- MISSING: back Umbra Cape
    -- MISSING: feet Battlecast Gaiters
    sets.defense.MDT = {main="Malignance Pole",sub="Umbra Strap",ammo="Staunch Tathlum +1",
        neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        ring1="Defending Ring",
        waist="Carrier's Sash",legs="Nyame Flanchard"}

    -- MISSING: neck Warder's Charm +1
    -- MISSING: hands Gende. Gages +1
    -- MISSING: ring1 Vengeful Ring
    -- MISSING: legs Merlinic Shalwar
    sets.defense.MEVA = {main="Daybreak",sub="Genmei Shield",ammo="Staunch Tathlum +1",
        head=gear.merlinic_nuke_head,ear1="Etiolation Earring",ear2="Sanare Earring",
        body=gear.merlinic_nuke_body,ring2="Purity Ring",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",feet="Amalric Nails +1"}

    -- MISSING: feet Herald's Gaiters
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
    -- MISSING: head Befouled Crown
    -- MISSING: back Umbra Cape
    -- MISSING: legs Assid. Pants +1
    sets.engaged = {main="Bolelabunga",sub="Genmei Shield",ammo="Homiliary",
        neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Sheltered Ring",
        waist="Carrier's Sash",feet=gear.chironic_refresh_feet}

    -- NOTE: duplicate ring/ear detected; will validate in Task 2
    -- MISSING: neck Null Loop
    -- MISSING: back Null Shawl
    -- MISSING: waist Null Belt
    sets.engaged.Acc = {main="Maxentius",sub="Genmei Shield",ammo="Staunch Tathlum +1",
        head="Nyame Helm",ear1="Crep. Earring",ear2="Telos Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
        legs="Nyame Flanchard",feet="Nyame Sollerets"}

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
    -- MISSING: waist Embla Sash
    sets.buff.DTSublimation = {}

    -- NOTE: duplicate ring/ear detected; will validate in Task 2
    -- MISSING: ear1 Mendicant's Earring
    -- MISSING: body Zendik Robe
    -- MISSING: hands Hieros Mittens
    -- MISSING: ring1 Mephitas's Ring +1
    -- MISSING: ring2 Mephitas's Ring
    -- MISSING: back Swith Cape +1
    -- MISSING: legs Shedir Seraweels
    sets.HPDown = {head="Pixie Hairpin +1",ear2="Evans Earring",
        waist="Carrier's Sash",feet=""}

    -- MISSING: head Gende. Caubeen +1
    -- MISSING: ear1 Gifted Earring
    -- MISSING: ear2 Mendi. Earring
    -- MISSING: ring1 Gelatinous Ring +1
    -- MISSING: ring2 Meridian Ring
    -- MISSING: back Moonlight Cape
    sets.HPCure = {main="Daybreak",sub="Sors Shield",range=empty,ammo="Hasty Pinion +1",
        neck="Unmoving Collar +1",
        body="Kaykaus Bliaut +1",hands="Kaykaus Cuffs +1",
        waist="Luminary Sash",legs="Carmine Cuisses +1",feet="Kaykaus Boots +1"}
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