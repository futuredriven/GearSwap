function user_job_setup()
    -- Options: Override default values
    state.OffenseMode:options('Fodder','Normal','Acc','FullAcc')
    state.HybridMode:options('Normal','DT')
    state.WeaponskillMode:options('Match','Normal','Acc','FullAcc','Fodder')
    state.CastingMode:options('Normal','SIRD','Resistant','FullMacc','Fodder','Proc')
    state.IdleMode:options('Normal','Sphere','PDT','DTHippo')
    state.PhysicalDefenseMode:options('PDT')
    state.MagicalDefenseMode:options('MDT')
    state.ResistDefenseMode:options('MEVA')
    state.Weapons:options('Tizbron','Tizalmace','None','Almace','MeleeClubs','HybridWeapons','Naegbron','Naegmace')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','MP','SuppaBrutal','DWEarrings','DWMax'}

    -- JSE CAPES
    gear.stp_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%'}}
    gear.wsd_jse_back = {name="Rosmerta's Cape",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%'}}
    gear.nuke_jse_back = {name="Rosmerta's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%'}}
    gear.da_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%'}}
    gear.crit_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10','Phys. dmg. taken-10%'}}

    autows = 'Expiacion'

    -- Reforged Gear (from old file)
    gear.artifact_head = "Assim. Keffiyeh +2"
    gear.artifact_body = "Assim. Jubbah +2"    
    gear.artifact_hands = "Assim. Bazu. +1"
    gear.artifact_legs = "Assim. Shalwar +2"
    gear.artifact_feet = "Assim. Charuqs +1"

    gear.relic_head = "Luhlaza Keffiyeh +1"
    gear.relic_body = "Luhlaza Jubbah +1"    
    gear.relic_hands = "Luhlaza Bazubands +1"
    gear.relic_legs = "Luhlaza Shalwar +1"
    gear.relic_feet = "Luhlaza charuqs +1"

    gear.empyrean_head = "Hashishin Kavuk +1"
    gear.empyrean_body = "Hashishin Mintan +1"    
    gear.empyrean_hands = "Hashishin Bazubands +1"
    gear.empyrean_legs = "Hashishin Tayt +1"
    gear.empyrean_feet = "Hashishin Basmak +1"

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

    -- MISSING: feet Hashishin Basmak +1
    sets.buff['Burst Affinity'] = {legs=gear.artifact_legs}
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
    -- MISSING: hands Luhlaza Bazubands +1
    sets.precast.JA['Azure Lore'] = {}


    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
    
    sets.Self_Waltz = {body=gear.relic_body}
    -- left_ring: MISSING Asklepian Ring (from old set)

    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    sets.precast.Step = {}

    sets.precast.Flourish1 = {}

    -- Fast cast sets for spells

    sets.precast.FC = {ammo="Sapience Orb",
        head="Carmine Mask +1",neck="Voltsurge Torque",left_ear="Regal Earring",right_ear="Loquac. Earring",
        body=gear.relic_body,hands="Leyline Gloves",left_ring="Kishar Ring",right_ring="Prolix Ring",
        back="Oretan. Cape +1",waist="Witful Belt",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {body=gear.relic_body})

    sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body=gear.empyrean_body})


    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    -- NOTE: duplicate ring detected; normalization skipped for this set
    sets.precast.WS = {ammo="Crepuscular Pebble",
        head="Nyame Helm",neck="Fotia Gorget",left_ear="Moonshade Earring",right_ear="Ishvara Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",left_ring="Ifrit Ring +1",right_ring="Ifrit Ring +1",
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    -- NOTE: duplicate ring detected; normalization skipped for this set
    sets.precast.WS.Acc = {ammo="Hasty Pinion +1",
        head="Nyame Helm",neck="Fotia Gorget",left_ear="Regal Earring",right_ear="Telos Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",left_ring="Ifrit Ring +1",right_ring="Ifrit Ring +1",
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.precast.WS.FullAcc = set_combine(sets.precast.WS.Acc, {})

    sets.precast.WS.DT = {ammo="Crepuscular Pebble",
        head="Nyame Helm",neck="Loricate Torque +1",left_ear="Dedition Earring",right_ear="Brutal Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",left_ring="Defending Ring",right_ring="Ilabrat Ring",
        back=gear.da_jse_back,waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {left_ear="Regal Earring",left_ring="Metamor. Ring +1",right_ring="Rufescent Ring"})
    sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {left_ear="Regal Earring",left_ring="Metamor. Ring +1",right_ring="Rufescent Ring"})
    sets.precast.WS['Requiescat'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Requiescat'].DT = set_combine(sets.precast.WS.DT, {})
    sets.precast.WS['Requiescat'].Fodder = set_combine(sets.precast.WS['Requiescat'], {})

    sets.precast.WS['Realmrazer'] = set_combine(sets.precast.WS, {left_ear="Regal Earring",left_ring="Metamor. Ring +1",right_ring="Rufescent Ring"})
    sets.precast.WS['Realmrazer'].Acc = set_combine(sets.precast.WS.Acc, {left_ear="Regal Earring",left_ring="Metamor. Ring +1",right_ring="Rufescent Ring"})
    sets.precast.WS['Realmrazer'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Realmrazer'].DT = set_combine(sets.precast.WS.DT, {})
    sets.precast.WS['Realmrazer'].Fodder = set_combine(sets.precast.WS['Realmrazer'], {})

    sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {head="Adhemar Bonnet +1",neck="Mirage Stole +2",left_ear="Moonshade Earring",right_ear="Telos Earring",body="Gleti's Cuirass",hands="Gleti's Gauntlets",right_ring="Begrudging Ring",legs="Gleti's Breeches",feet="Gleti's Boots"})
    sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {head="Adhemar Bonnet +1",neck="Mirage Stole +2",left_ear="Moonshade Earring",right_ear="Telos Earring",body="Gleti's Cuirass",hands="Gleti's Gauntlets",right_ring="Begrudging Ring",legs="Gleti's Breeches",feet="Gleti's Boots"})
    sets.precast.WS['Chant du Cygne'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Chant du Cygne'].DT = set_combine(sets.precast.WS.DT, {back=gear.crit_jse_back})
    sets.precast.WS['Chant du Cygne'].Fodder = set_combine(sets.precast.WS['Chant du Cygne'], {})

    sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {neck="Mirage Stole +2",left_ring="Karieyh Ring",right_ring="Rufescent Ring",waist="Sailfi Belt +1"})
    sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {neck="Mirage Stole +2",left_ring="Karieyh Ring",right_ring="Rufescent Ring",waist="Sailfi Belt +1"})
    sets.precast.WS['Savage Blade'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Savage Blade'].DT = set_combine(sets.precast.WS.DT, {back=gear.wsd_jse_back})
    sets.precast.WS['Savage Blade'].Fodder = set_combine(sets.precast.WS['Savage Blade'], {})

    sets.precast.WS['Vorpal Blade'] = sets.precast.WS['Chant du Cygne']
    sets.precast.WS['Vorpal Blade'].Acc = sets.precast.WS['Chant du Cygne'].Acc
    sets.precast.WS['Vorpal Blade'].FullAcc = sets.precast.WS['Chant du Cygne'].FullAcc
    sets.precast.WS['Vorpal Blade'].DT = sets.precast.WS['Chant du Cygne'].DT
    sets.precast.WS['Vorpal Blade'].Fodder = sets.precast.WS['Chant du Cygne'].Fodder

    sets.precast.WS['Expiacion'] = set_combine(sets.precast.WS, {neck="Mirage Stole +2",left_ring="Ifrit Ring +1",right_ring="Rufescent Ring",waist="Sailfi Belt +1"})
    sets.precast.WS['Expiacion'].Acc = set_combine(sets.precast.WS.Acc, {neck="Mirage Stole +2",left_ring="Ifrit Ring +1",right_ring="Rufescent Ring",waist="Sailfi Belt +1"})
    sets.precast.WS['Expiacion'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Expiacion'].DT = set_combine(sets.precast.WS.DT, {back=gear.wsd_jse_back})
    sets.precast.WS['Expiacion'].Fodder = set_combine(sets.precast.WS['Expiacion'], {})

    -- MISSING: waist Yamabuki-no-Obi
    sets.precast.WS['Sanguine Blade'] = {ammo="Ghastly Tathlum +1",
                     head="Pixie Hairpin +1",neck="Baetyl Pendant",left_ear="Regal Earring",right_ear="Friomisi Earring",
                     body="Amalric Doublet +1",hands="Jhakri Cuffs +2",left_ring="Metamor. Ring +1",right_ring="Archon Ring",
                     back=gear.nuke_jse_back,legs=gear.relic_legs,feet="Amalric Nails +1"}
                     
    sets.precast.WS['Sanguine Blade'].DT = set_combine(sets.precast.WS.DT, {back=gear.nuke_jse_back})
    sets.precast.WS['Sanguine Blade'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Sanguine Blade'].Fodder = set_combine(sets.precast.WS['Sanguine Blade'], {})

    -- MISSING: waist Yamabuki-no-Obi
    sets.precast.WS['Flash Nova'] = {ammo="Ghastly Tathlum +1",
                     head="Jhakri Coronal +2",neck="Baetyl Pendant",left_ear="Regal Earring",right_ear="Friomisi Earring",
                     body="Amalric Doublet +1",hands="Jhakri Cuffs +2",left_ring="Metamor. Ring +1",right_ring="Shiva Ring +1",
                     back=gear.nuke_jse_back,legs=gear.relic_legs,feet="Amalric Nails +1"}
                     
    sets.precast.WS['Flash Nova'].DT = set_combine(sets.precast.WS.DT, {back=gear.nuke_jse_back})
    sets.precast.WS['Flash Nova'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Flash Nova'].Fodder = set_combine(sets.precast.WS['Flash Nova'], {})

    -- Swap to these on Moonshade using WS if at 3000 TP
    sets.MaxTP = {left_ear="Dedition Earring",right_ear="Brutal Earring"}
    sets.AccMaxTP = {left_ear="Regal Earring",right_ear="Telos Earring"}

    -- Midcast Sets
    -- MISSING: left_ear Enchntr. Earring +1
    -- MISSING: back Swith Cape +1
    -- MISSING: legs Psycloth Lappas
--    sets.midcast.FastRecast = {main="Vampirism",sub="Sakpata's Sword",ammo="Hasty Pinion +1",
--        head="Carmine Mask +1",right_ear="Loquac. Earring",
--        body="Luhlaza Jubbah +3",hands="Leyline Gloves",left_ring="Kishar Ring",right_ring="Prolix Ring",
--        ,waist="Witful Belt",feet="Carmine Greaves +1"}

    sets.midcast['Blue Magic'] = {}

    -- Physical Spells --

    sets.midcast['Blue Magic'].Physical = {ammo="Crepuscular Pebble",
        head="Jhakri Coronal +2",neck="Mirage Stole +2",left_ear="Regal Earring",right_ear="Telos Earring",
        body="Jhakri Robe +2",hands="Jhakri Cuffs +2",left_ring="Ifrit Ring +1",right_ring="Ilabrat Ring",
        back=gear.wsd_jse_back,waist="Prosilio Belt +1",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

    sets.midcast['Blue Magic'].Physical.Resistant = {ammo="Crepuscular Pebble",
        head="Jhakri Coronal +2",neck="Mirage Stole +2",left_ear="Regal Earring",right_ear="Telos Earring",
        body="Jhakri Robe +2",hands="Malignance Gloves",left_ring="Ifrit Ring +1",right_ring="Ilabrat Ring",
        back=gear.wsd_jse_back,waist="Prosilio Belt +1",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

    sets.midcast['Blue Magic'].Physical.Fodder = set_combine(sets.midcast['Blue Magic'].Physical, {})

    sets.midcast['Blue Magic'].PhysicalAcc = {ammo="Crepuscular Pebble",
        head="Jhakri Coronal +2",neck="Mirage Stole +2",left_ear="Regal Earring",right_ear="Telos Earring",
        body="Jhakri Robe +2",hands="Jhakri Cuffs +2",left_ring="Ifrit Ring +1",right_ring="Ilabrat Ring",
        back=gear.wsd_jse_back,waist="Prosilio Belt +1",legs="Jhakri Slops +2",feet="Malignance Boots"}

    sets.midcast['Blue Magic'].PhysicalAcc.Resistant = set_combine(sets.midcast['Blue Magic'].PhysicalAcc, {})
    sets.midcast['Blue Magic'].PhysicalAcc.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

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

    -- MISSING: waist Yamabuki-no-Obi
    sets.midcast['Blue Magic'].Magical = {main="Bunzi's Rod",sub="Maxentius",ammo="Ghastly Tathlum +1",
         head="Jhakri Coronal +2",neck="Baetyl Pendant",left_ear="Regal Earring",right_ear="Friomisi Earring",
         body="Amalric Doublet +1",hands="Amalric Gages +1",left_ring="Metamor. Ring +1",right_ring="Shiva Ring +1",
         back=gear.nuke_jse_back,legs=gear.relic_legs,feet="Amalric Nails +1"}
         
    -- MISSING: hands Rawhide Gloves
    sets.midcast['Blue Magic'].Magical.SIRD = {main="Bunzi's Rod",sub="Sakpata's Sword",ammo="Staunch Tathlum +1",
         head="Jhakri Coronal +2",neck="Loricate Torque +1",left_ear="Regal Earring",right_ear="Friomisi Earring",
         body="Amalric Doublet +1",left_ring="Metamor. Ring +1",right_ring="Defending Ring",
         back=gear.nuke_jse_back,waist="Emphatikos Rope",legs="Carmine Cuisses +1",feet="Amalric Nails +1"}
         
    -- MISSING: waist Yamabuki-no-Obi
    sets.midcast['Blue Magic'].Subduction = {main="Bunzi's Rod",sub="Maxentius",ammo="Ghastly Tathlum +1",
         head="Jhakri Coronal +2",neck="Baetyl Pendant",left_ear="Regal Earring",right_ear="Friomisi Earring",
         body="Amalric Doublet +1",hands="Amalric Gages +1",left_ring="Metamor. Ring +1",right_ring="Shiva Ring +1",
         back=gear.nuke_jse_back,legs=gear.relic_legs,feet="Amalric Nails +1"}
                     
    sets.midcast['Blue Magic'].Magical.Proc = {ammo="Hasty Pinion +1",
        head="Carmine Mask +1",left_ear="Regal Earring",right_ear="Loquac. Earring",
        body=gear.relic_body,hands="Leyline Gloves",left_ring="Kishar Ring",right_ring="Prolix Ring",
        back="Oretan. Cape +1",waist="Witful Belt",legs=gear.relic_legs,feet="Carmine Greaves +1"}
                     
    -- NOTE: duplicate ring detected; normalization skipped for this set
    sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical,
        {neck="Mirage Stole +2",left_ring="Stikini Ring +1",right_ring="Stikini Ring +1"})

    sets.midcast['Blue Magic'].Magical.Fodder = set_combine(sets.midcast['Blue Magic'].Magical, {})

    sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical, {right_ring="Stikini Ring +1"})
    sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical, {})
    sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical, {})
    sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical, {})

    -- NOTE: duplicate ring detected; normalization skipped for this set
    sets.midcast['Blue Magic'].MagicAccuracy = {main="Tizona",sub="Sakpata's Sword",ammo="Pemphredo Tathlum",
        head=gear.artifact_head,neck="Mirage Stole +2",left_ear="Regal Earring",right_ear="Digni. Earring",
        body="Amalric Doublet +1",hands="Malignance Gloves",left_ring="Stikini Ring +1",right_ring="Stikini Ring +1",
        back="Perimede Cape",waist="Acuity Belt +1",legs=gear.artifact_legs,feet="Malignance Boots"}
        
    sets.midcast['Blue Magic'].Magical.FullMacc = sets.midcast['Blue Magic'].MagicAccuracy
    sets.midcast['Blue Magic'].Subduction.FullMacc = sets.midcast['Blue Magic'].MagicAccuracy

    sets.midcast['Enfeebling Magic'] = {main="Tizona",sub="Sakpata's Sword",ammo="Pemphredo Tathlum",
        head="Jhakri Coronal +2",neck="Mirage Stole +2",left_ear="Regal Earring",right_ear="Digni. Earring",
        body="Jhakri Robe +2",hands="Jhakri Cuffs +2",left_ring="Metamor. Ring +1",right_ring="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs=gear.relic_legs,feet="Amalric Nails +1"}

    sets.midcast['Dark Magic'] = {main="Tizona",sub="Sakpata's Sword",ammo="Pemphredo Tathlum",
        head="Jhakri Coronal +2",neck="Erra Pendant",left_ear="Regal Earring",right_ear="Digni. Earring",
        body="Amalric Doublet +1",hands="Jhakri Cuffs +2",left_ring="Metamor. Ring +1",right_ring="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs=gear.relic_legs,feet="Amalric Nails +1"}

    -- NOTE: duplicate ring detected; normalization skipped for this set
    -- MISSING: right_ear Gifted Earring
    sets.midcast['Enhancing Magic'] = {main="Vampirism", sub="Sakpata's Sword",ammo="Hasty Pinion +1",
        neck="Incanter's Torque",left_ear="Andoaa Earring",
        left_ring="Stikini Ring +1",right_ring="Stikini Ring +1",
        back="Perimede Cape",waist="Olympus Sash"}
        
    -- MISSING: right_ear Gifted Earring
    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{main="Pukulatmuj +1",sub="Sakpata's Sword",head="Carmine Mask +1",legs="Carmine Cuisses +1"})

    sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})

    -- MISSING: hands Rawhide Gloves
    sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1",waist="Emphatikos Rope",legs="Shedir Seraweels"})

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {right_ear="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})

    sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'], {legs="Shedir Seraweels"})
    
    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {right_ring="Sheltered Ring"})
    sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {right_ring="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {right_ring="Sheltered Ring"})
    sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {right_ring="Sheltered Ring"})

    sets.midcast['Divine Magic'] = {ammo="Pemphredo Tathlum",
        head="Jhakri Coronal +2",neck="Incanter's Torque",left_ear="Regal Earring",right_ear="Digni. Earring",
        body="Amalric Doublet +1",hands="Jhakri Cuffs +2",left_ring="Metamor. Ring +1",right_ring="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Luminary Sash",legs=gear.relic_legs,feet="Amalric Nails +1"}

    -- NOTE: duplicate ring detected; normalization skipped for this set
    sets.midcast['Elemental Magic'] = {main="Maxentius",sub="Sakpata's Sword",ammo="Ghastly Tathlum +1",
        head="Jhakri Coronal +2",neck="Baetyl Pendant",left_ear="Regal Earring",right_ear="Friomisi Earring",
        body="Amalric Doublet +1",hands="Amalric Gages +1",left_ring="Shiva Ring +1",right_ring="Shiva Ring +1",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs=gear.relic_legs,feet="Amalric Nails +1"}

    -- NOTE: duplicate ring detected; normalization skipped for this set
    -- MISSING: waist Yamabuki-no-Obi
    sets.midcast['Elemental Magic'].Resistant = {main="Maxentius",sub="Sakpata's Sword",ammo="Pemphredo Tathlum",
        head="Jhakri Coronal +2",neck="Mirage Stole +2",left_ear="Regal Earring",right_ear="Friomisi Earring",
        body="Amalric Doublet +1",hands="Jhakri Cuffs +2",left_ring="Shiva Ring +1",right_ring="Shiva Ring +1",
        back=gear.nuke_jse_back,legs=gear.relic_legs,feet="Jhakri Pigaches +2"}

    sets.midcast.Helix = sets.midcast['Elemental Magic']
    sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Resistant

    sets.element.Dark = {head="Pixie Hairpin +1",right_ring="Archon Ring"}
    -- MISSING: right_ring Weatherspoon Ring
    sets.element.Light = {} --

    -- MISSING: hands Telchine Gloves
    sets.midcast.Cure = {main="Bunzi's Rod",sub="Sakpata's Sword",ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Loricate Torque +1",left_ear="Regal Earring",right_ear="Genmei Earring",
        body="Vrikodara Jupon",left_ring="Metamor. Ring +1",right_ring="Menelaus's Ring",
        back="Oretan. Cape +1",waist="Luminary Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}
        
    -- MISSING: hands Telchine Gloves
    sets.midcast.UnlockedCure = {main="Bunzi's Rod",sub="Sakpata's Sword",ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Loricate Torque +1",left_ear="Regal Earring",right_ear="Genmei Earring",
        body="Nyame Mail",left_ring="Metamor. Ring +1",right_ring="Menelaus's Ring",
        back="Oretan. Cape +1",waist="Luminary Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    -- MISSING: hands Telchine Gloves
    sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",
        back="Oretan. Cape +1",left_ring="Haoma's Ring",right_ring="Menelaus's Ring",waist="Witful Belt"})

    -- Breath Spells --

    -- MISSING: head Luhlaza Keffiyeh +1
    -- MISSING: hands Luhlaza Bazubands +1
    -- MISSING: right_ring Meridian Ring
    sets.midcast['Blue Magic'].Breath = {ammo="Mavi Tathlum",neck="Mirage Stole +2",left_ear="Regal Earring",right_ear="Digni. Earring",
        body=gear.artifact_body,left_ring="Kunaji Ring",
        back="Perimede Cape",legs=gear.empyrean_legs,feet=gear.relic_feet}

    -- Physical Added Effect Spells most notably "Stun" spells --

    sets.midcast['Blue Magic'].Stun = {main="Tizona",sub="Sakpata's Sword",ammo="Pemphredo Tathlum",
        head="Jhakri Coronal +2",neck="Mirage Stole +2",left_ear="Regal Earring",right_ear="Digni. Earring",
        body="Malignance Tabard",hands="Malignance Gloves",left_ring="Metamor. Ring +1",right_ring="Stikini Ring +1",
        back="Perimede Cape",waist="Luminary Sash",legs="Malignance Tights",feet="Malignance Boots"}

    sets.midcast['Blue Magic'].Stun.Resistant = {main="Tizona",sub="Sakpata's Sword",ammo="Pemphredo Tathlum",
        head="Jhakri Coronal +2",neck="Mirage Stole +2",left_ear="Regal Earring",right_ear="Digni. Earring",
        body="Malignance Tabard",hands="Malignance Gloves",left_ring="Metamor. Ring +1",right_ring="Stikini Ring +1",
        back="Perimede Cape",waist="Luminary Sash",legs="Malignance Tights",feet="Malignance Boots"}

    sets.midcast['Blue Magic'].Stun.Fodder = sets.midcast['Blue Magic'].Stun

    -- Other Specific Spells --

    -- MISSING: left_ear Tuisto Earring
    -- MISSING: hands Telchine Gloves
    -- MISSING: left_ring Gelatinous Ring +1
    -- MISSING: right_ring Meridian Ring
    -- MISSING: back Moonbeam Cape
    sets.midcast['Blue Magic'].UnlockedAoEHealing = {main="Bunzi's Rod",sub="Sakpata's Sword",ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Unmoving Collar +1",right_ear="Odnowa Earring +1",
        body="Nyame Mail",
        waist="Eschan Stone",legs="Nyame Flanchard",feet="Nyame Sollerets"}
                    
    -- MISSING: left_ear Tuisto Earring
    -- MISSING: hands Telchine Gloves
    -- MISSING: left_ring Gelatinous Ring +1
    -- MISSING: right_ring Meridian Ring
    -- MISSING: back Moonbeam Cape
    sets.midcast['Blue Magic'].AoEHealing = {main="Bunzi's Rod",sub="Sakpata's Sword",ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Unmoving Collar +1",right_ear="Odnowa Earring +1",
        body="Vrikodara Jupon",
        waist="Eschan Stone",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    -- MISSING: left_ear Tuisto Earring
    -- MISSING: hands Telchine Gloves
    -- MISSING: left_ring Gelatinous Ring +1
    -- MISSING: right_ring Meridian Ring
    -- MISSING: back Moonbeam Cape
    sets.midcast['Blue Magic'].Healing = {main="Bunzi's Rod",sub="Sakpata's Sword",ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Loricate Torque +1",right_ear="Odnowa Earring +1",
        body="Vrikodara Jupon",
        waist="Eschan Stone",legs="Gyve Trousers",feet="Nyame Sollerets"}
        
    -- MISSING: hands Telchine Gloves
    -- MISSING: right_ring Meridian Ring
    -- MISSING: back Moonbeam Cape
    sets.midcast['Blue Magic'].UnlockedHealing = {main="Bunzi's Rod",sub="Sakpata's Sword",ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Loricate Torque +1",left_ear="Regal Earring",right_ear="Genmei Earring",
        body="Nyame Mail",left_ring="Metamor. Ring +1",waist="Luminary Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    -- NOTE: duplicate ring detected; normalization skipped for this set
    -- MISSING: sub Iris
    -- MISSING: head Luhlaza Keffiyeh +1
    -- MISSING: left_ear Gifted Earring
    -- MISSING: hands Rawhide Gloves
    sets.midcast['Blue Magic'].SkillBasedBuff = {main="Iris",ammo="Mavi Tathlum",neck="Mirage Stole +2",right_ear="Digni. Earring",
        body=gear.artifact_body,left_ring="Stikini Ring +1",right_ring="Stikini Ring +1",
        back="Perimede Cape",waist="Witful Belt",legs=gear.empyrean_legs,feet=gear.relic_feet}

    -- NOTE: duplicate ring detected; normalization skipped for this set
    -- MISSING: head Luhlaza Keffiyeh +1
    -- MISSING: left_ear Gifted Earring
    -- MISSING: hands Rawhide Gloves
    sets.midcast['Blue Magic'].Buff = {main="Vampirism",sub="Vampirism",ammo="Mavi Tathlum",neck="Mirage Stole +2",right_ear="Digni. Earring",
        body=gear.artifact_body,left_ring="Stikini Ring +1",right_ring="Stikini Ring +1",
        back="Perimede Cape",waist="Witful Belt",legs=gear.empyrean_legs,feet=gear.relic_feet}

    sets.midcast['Blue Magic']['Battery Charge'] = set_combine(sets.midcast['Blue Magic'].Buff, {head="Amalric Coif +1",back="Grapevine Cape",waist="Gishdubar Sash"})

    -- MISSING: hands Rawhide Gloves
    sets.midcast['Blue Magic']['Carcharian Verve'] = set_combine(sets.midcast['Blue Magic'].Buff, {head="Amalric Coif +1",waist="Emphatikos Rope",legs="Shedir Seraweels"})

    -- Sets to return to when not performing an action.

    sets.latent_refresh = {waist="Fucho-no-obi"}
    sets.latent_refresh_grip = {sub="Oneiros Grip"}
    sets.DayIdle = {}
    sets.NightIdle = {}

    -- Gear for learning spells: +skill and AF hands.
    sets.Learning = {hands=gear.artifact_hands}

    -- Resting sets
    -- NOTE: duplicate ring detected; normalization skipped for this set
    sets.resting = {main="Colada",sub="Genmei Shield",ammo="Staunch Tathlum +1",
        head="Gleti's Mask",neck="Loricate Torque +1",left_ear="Etiolation Earring", right_ear="Ethereal Earring",
        body="Gleti's Cuirass",hands="Gleti's Gauntlets",left_ring="Stikini Ring +1",right_ring="Stikini Ring +1",
        back=gear.stp_jse_back,waist="Flume Belt +1",legs="Gleti's Breeches",feet="Gleti's Boots"}

    -- Idle sets
    -- NOTE: duplicate ring detected; normalization skipped for this set
    sets.idle = {main="Colada",sub="Genmei Shield",ammo="Staunch Tathlum +1",
        head="Gleti's Mask",neck="Loricate Torque +1",left_ear="Etiolation Earring", right_ear="Ethereal Earring",
        body="Gleti's Cuirass",hands="Gleti's Gauntlets",left_ring="Stikini Ring +1",right_ring="Stikini Ring +1",
        back=gear.stp_jse_back,waist="Flume Belt +1",legs="Gleti's Breeches",feet="Gleti's Boots"}

    sets.idle.Sphere = set_combine(sets.idle, {})

    sets.idle.PDT = {main="Sakpata's Sword",sub="Genmei Shield",ammo="Staunch Tathlum +1",
        head="Gleti's Mask",neck="Loricate Torque +1",left_ear="Etiolation Earring", right_ear="Ethereal Earring",
        body="Gleti's Cuirass",hands="Gleti's Gauntlets",left_ring="Defending Ring",right_ring="Purity Ring",
        back=gear.stp_jse_back,waist="Flume Belt +1",legs="Gleti's Breeches",feet="Gleti's Boots"}

    sets.idle.DTHippo = set_combine(sets.idle.PDT, {})

    -- Defense sets
    sets.defense.PDT = {main="Sakpata's Sword",sub="Genmei Shield",ammo="Staunch Tathlum +1",
        head="Gleti's Mask",neck="Loricate Torque +1",left_ear="Etiolation Earring",right_ear="Sanare Earring",
        body="Gleti's Cuirass",hands="Gleti's Gauntlets",left_ring="Defending Ring",right_ring="Purity Ring",
        back=gear.stp_jse_back,waist="Flume Belt +1",legs="Gleti's Breeches",feet="Gleti's Boots"}

    -- MISSING: neck Warder's Charm +1
    sets.defense.MDT = {main="Bolelabunga",sub="Genmei Shield",ammo="Staunch Tathlum +1",
        head="Gleti's Mask",left_ear="Etiolation Earring",right_ear="Sanare Earring",
        body="Gleti's Cuirass",hands="Gleti's Gauntlets",left_ring="Defending Ring",right_ring="Purity Ring",
        back=gear.stp_jse_back,waist="Carrier's Sash",legs="Gleti's Breeches",feet="Gleti's Boots"}

    -- MISSING: neck Warder's Charm +1
    sets.defense.MEVA = {main="Bolelabunga",sub="Genmei Shield",ammo="Staunch Tathlum +1",
        head="Jhakri Coronal +2",left_ear="Etiolation Earring",right_ear="Sanare Earring",
        body="Malignance Tabard",hands="Leyline Gloves",left_ring="Defending Ring",right_ring="Purity Ring",
        back=gear.nuke_jse_back,waist="Carrier's Sash",legs="Malignance Tights",feet="Malignance Boots"}

    sets.defense.NukeLock = sets.midcast['Blue Magic'].Magical

    sets.Kiting = {}

    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
    sets.MP = {waist="Flume Belt +1",left_ear="Etiolation Earring", right_ear="Ethereal Earring"}
    sets.MP_Knockback = {}
    sets.SuppaBrutal = {left_ear="Dedition Earring", right_ear="Brutal Earring"}
    sets.DWEarrings = {left_ear="Dedition Earring",right_ear="Eabani Earring"}
    sets.DWMax = {left_ear="Dedition Earring",right_ear="Eabani Earring",body="Adhemar Jacket +1",waist="Reiki Yotai",legs="Carmine Cuisses +1"}
    sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
    
    -- Weapons sets
    sets.weapons.Tizona = {main="Tizona",sub="Thibron"}    
    sets.weapons.MeleeClubs = {main="Maxentius",sub="Thibron"}
    sets.weapons.Naegbron = {main="Naegling",sub="Thibron"}
    -- MISSING: sub Iris
    sets.weapons.MaccWeapons = {main="Iris"}
    sets.weapons.Learn = {main="Extinction",sub="Feline Hagoita"}

    -- Engaged sets

    -- NOTE: duplicate ring detected; normalization skipped for this set
    sets.engaged = {ammo="Coiste Bodhar",
                head="Adhemar Bonnet +1",neck="Mirage Stole +2",left_ear="Dedition Earring",right_ear="Eabani Earring", -- Malignance Chapeau
                body="Malignance Tabard",hands="Malignance Gloves",left_ring="Chirich Ring +1",right_ring="Chirich Ring +1",
                back=gear.stp_jse_back,waist="Sailfi Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

    sets.engaged.AM = {ammo="Coiste Bodhar",
                head="Adhemar Bonnet +1",neck="Mirage Stole +2",left_ear="Dedition Earring",right_ear="Telos Earring",
                body="Adhemar Jacket +1",hands="Malignance Gloves",left_ring="Epona's Ring",right_ring="Chirich Ring +1",
                back=gear.stp_jse_back,waist="Kentarch Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

    -- NOTE: duplicate ring detected; normalization skipped for this set
    sets.engaged.Acc = {ammo="Crepuscular Pebble",
                head="Adhemar Bonnet +1",neck="Mirage Stole +2",left_ear="Dedition Earring",right_ear="Telos Earring",
                body="Malignance Tabard",hands="Malignance Gloves",left_ring="Chirich Ring +1",right_ring="Chirich Ring +1",
                back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

    sets.engaged.Acc.AM = {ammo="Falcon Eye",
                head="Adhemar Bonnet +1",neck="Mirage Stole +2",left_ear="Digni. Earring",right_ear="Telos Earring",
                body="Malignance Tabard",hands="Adhemar Wrist. +1",left_ring="Chirich Ring +1",right_ring="Ilabrat Ring",
                back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Malignance Boots"}

    sets.engaged.FullAcc = set_combine(sets.engaged.Acc, {})

    sets.engaged.FullAcc.AM = set_combine(sets.engaged.Acc.AM, {})

    sets.engaged.Fodder = {main="Tizona",sub="Thibron",ammo="Coiste Bodhar",
                head="Adhemar Bonnet +1",neck="Mirage Stole +2",left_ear="Dedition Earring",right_ear="Brutal Earring",
                body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",left_ring="Epona's Ring",right_ring="Petrov Ring",
                back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

    sets.engaged.Fodder.AM = {main="Tizona",sub="Thibron",ammo="Coiste Bodhar",
                head="Adhemar Bonnet +1",neck="Mirage Stole +2",left_ear="Dedition Earring",right_ear="Telos Earring",
                body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",left_ring="Epona's Ring",right_ring="Petrov Ring",
                back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

    sets.engaged.DT = set_combine(sets.engaged, {})

    sets.engaged.DT.AM = set_combine(sets.engaged.AM, {})

    sets.engaged.Acc.DT = set_combine(sets.engaged.Acc, {})

    sets.engaged.Acc.DT.AM = set_combine(sets.engaged.Acc.AM, {})

    sets.engaged.FullAcc.DT = set_combine(sets.engaged.FullAcc, {})

    sets.engaged.Fodder.DT = set_combine(sets.engaged.Fodder, {})

    sets.engaged.Fodder.DT.AM = set_combine(sets.engaged.Fodder.AM, {})

    sets.Self_Healing = {waist="Gishdubar Sash"}
    sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",right_ring="Kunaji Ring",waist="Gishdubar Sash"}
    sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}
    sets.MagicBurst = {body="Amalric Doublet +1",hands="Amalric Gages +1",legs=gear.artifact_legs,left_ring="Mujin Band",right_ring="Purity Ring"}
    sets.Phalanx_Received = {}
end

-- Select default macro book on initial load or subjob change.
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
        {Name='Erratic Flutter',    Buff='Haste',            SpellID=710,    When='Always'},
        {Name='Battery Charge',        Buff='Refresh',            SpellID=662,    When='Idle'},
        {Name='Refresh',            Buff='Refresh',            SpellID=109,    When='Idle'},
        {Name='Nat. Meditation',    Buff='Attack Boost',    SpellID=700,    When='Engaged'},        
    },
    
    AutoMighty = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
        {Name='Erratic Flutter',    Buff='Haste',            SpellID=710,    When='Always'},
        {Name='Battery Charge',        Buff='Refresh',            SpellID=662,    When='Idle'},
        {Name='Refresh',            Buff='Refresh',            SpellID=109,    When='Idle'},
        {Name='Nat. Meditation',    Buff='Attack Boost',    SpellID=700,    When='Engaged'},
        {Name='Mighty Guard',        Buff='Mighty Guard',    SpellID=750,    When='Combat'},
    },
    
    Default = {
        {Name='Erratic Flutter',    Buff='Haste',            SpellID=710,    Reapply=false},
        {Name='Battery Charge',        Buff='Refresh',            SpellID=662,    Reapply=false},
        {Name='Refresh',            Buff='Refresh',            SpellID=109,    Reapply=false},
        {Name='Phalanx',            Buff='Phalanx',            SpellID=106,    Reapply=false},
        {Name='Barrier Tusk',        Buff='Phalanx',            SpellID=685,    Reapply=false},
        {Name='Stoneskin',            Buff='Stoneskin',        SpellID=54,        Reapply=false},
        {Name='Occultation',        Buff='Blink',            SpellID=679,    Reapply=false},
        {Name='Blink',                Buff='Blink',            SpellID=53,        Reapply=false},
        {Name='Mighty Guard',        Buff='Mighty Guard',    SpellID=750,    Reapply=false},
        {Name='Nat. Meditation',    Buff='Attack Boost',    SpellID=700,    Reapply=false},
    },
    
    Cleave = {
        {Name='Erratic Flutter',    Buff='Haste',            SpellID=710,    Reapply=false},
        {Name='Battery Charge',        Buff='Refresh',            SpellID=662,    Reapply=false},
        {Name='Refresh',            Buff='Refresh',            SpellID=109,    Reapply=false},
        {Name='Phalanx',            Buff='Phalanx',            SpellID=106,    Reapply=false},
        {Name='Barrier Tusk',        Buff='Phalanx',            SpellID=685,    Reapply=false},
        {Name='Stoneskin',            Buff='Stoneskin',        SpellID=54,        Reapply=false},
        {Name='Occultation',        Buff='Blink',            SpellID=679,    Reapply=false},
        {Name='Blink',                Buff='Blink',            SpellID=53,        Reapply=false},
        {Name='Carcharian Verve',    Buff='Aquaveil',        SpellID=745,    Reapply=false},
        {Name='Memento Mori',        Buff='Magic Atk. Boost',SpellID=538,    Reapply=false},
    },
}

autows_list = {['Tizbron']='Expiacion',['Tizalmace']='Expiacion',['Almace']='Chant Du Cygne',['MeleeClubs']='Black Halo',
     ['HybridWeapons']='Sanguine Blade',['Naegbron']='Savage Blade',['Naegmace']='Savage Blade'}