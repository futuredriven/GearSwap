-- =====================================================================
-- CURSOR UPDATE RULES (DO NOT DELETE)
-- 1) Do not create or rename sets; only edit existing template sets.
-- 3) If a guide recommends unowned gear, add it to the set’s WISHLIST
--    block; do not replace equipped items with unowned items.
-- 4) Keep unique rings/earrings consistent:
--    - Each accessory item name must always use the same left/right slot.
-- 5) Do not edit below any protected marker (e.g. “DO NOT EDIT BELOW…”).
-- =====================================================================

function user_job_setup()

    state.OffenseMode:options('Normal','Acc','FullAcc')
    state.HybridMode:options('Tank','Tank_HP','Normal','DTLite')
    state.WeaponskillMode:options('Match','Normal','Acc','FullAcc')
    state.CastingMode:options('SIRD','Normal')
    state.PhysicalDefenseMode:options('PDT_HP','PDT')
    state.MagicalDefenseMode:options('MDT_HP','MDT')
    state.ResistDefenseMode:options('MEVA','MEVA_HP')
    state.IdleMode:options('Tank','KiteTank') --,'Normal','Sphere'
    state.Weapons:options('None','Aettir','Lionheart','Epeolatry')
    
    state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','MP'}

    -- Reforged Gear
    gear.artifact_head = "Rune. Bandeau +3"
    gear.artifact_body = "Runeist's Coat +3"
    gear.artifact_hands = "Runeist's Mitons +3"
    gear.artifact_legs = "Rune. Trousers +3"
    gear.artifact_feet = "Runeist's Bottes +2"

    gear.relic_head = "Futhark Bandeau +2"
    gear.relic_body = "Futhark Coat +2"
    gear.relic_hands = "Futhark Mitons +1"
    gear.relic_legs = "Futhark Trousers +3"
    gear.relic_feet = "Futhark Boots +1"

    gear.empyrean_head = "Erilaz Galea +2"
    gear.empyrean_body = "Erilaz Surcoat +2"
    gear.empyrean_legs = "Eri. Leg Guards +2"
    gear.empyrean_feet = "Erilaz Greaves +2"

    -- JSE CAPES
    gear.enmity_jse_back = {name="Ogma's cape",augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}}
    gear.da_jse_back = {name="Ogma's cape",augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}
    gear.fc_jse_back = {name="Ogma's cape",augments={'Accuracy+1 Attack+1','"Fast Cast"+10',}}
    gear.stp_jse_back = {name="Ogma's cape",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
    gear.ws_dex_jse_back = {name="Ogma's cape",augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}

    -- Additional local binds
    send_command('bind !` gs c SubJobEnmity')
    send_command('bind @` gs c cycle RuneElement')
    send_command('bind ^` gs c RuneElement')
    send_command('bind @pause gs c toggle AutoRuneMode')
    send_command('bind ^delete input /ja "Provoke" <stnpc>')
    send_command('bind !delete input /ma "Cure IV" <stal>')
    send_command('bind @delete input /ma "Flash" <stnpc>')
    send_command('bind ^\\\\ input /ma "Protect IV" <t>')
    send_command('bind @\\\\ input /ma "Shell V" <t>')
    send_command('bind !\\\\ input /ma "Crusade" <me>')
    send_command('bind ^backspace input /ja "Lunge" <t>')
    send_command('bind @backspace input /ja "Gambit" <t>')
    send_command('bind !backspace input /ja "Rayke" <t>')
    send_command('bind @f8 gs c toggle AutoTankMode')
    send_command('bind @f10 gs c toggle TankAutoDefense')
    send_command('bind ^@!` gs c cycle SkillchainMode')

    select_default_macro_book()
end

function init_gear_sets()

    -- WISHLIST (Guide Upgrades - not owned)
    -- ammo: MISSING Aqreqaq Bomblet (guide: Enmity+)
    -- body: MISSING Adamantite Armor (guide: Enmity+/DT+)
    -- waist: MISSING Trance Belt (guide: Enmity+)
    sets.Enmity = {ammo="Sapience Orb",
         head="Halitus Helm",neck="Moonlight Necklace",ear1="Trux Earring",ear2="Cryptic Earring",
         body="Emet Harness +1",hands="Kurys Gloves",ring1="Eihwaz Ring",ring2="Supershear Ring",
         back=gear.enmity_jse_back,waist="Goading Belt",legs=gear.empyrean_legs,feet=gear.empyrean_feet}

    sets.Enmity.SIRD = {ammo="Staunch Tathlum +1",
        head="Halitus Helm",neck="Moonlight Necklace",ear1="Magnetic Earring",ear2="Halasz Earring",
        body="Nyame Mail",hands="Rawhide Gloves",ring1="Defending Ring",ring2="Moonlight Ring",
        back=gear.enmity_jse_back,waist="Goading Belt",legs="Carmine Cuisses +1",feet=gear.empyrean_feet}

    sets.Enmity.DT = {ammo="Sapience Orb",
        head="Halitus Helm",neck="Unmoving Collar +1",ear1="Trux Earring",ear2="Tuisto Earring",
        body="Emet Harness +1",hands="Kurys Gloves",ring1="Defending Ring",ring2="Moonlight Ring",
        back="Evasionist's Cape",waist="Flume Belt +1",legs=gear.empyrean_legs,feet=gear.empyrean_feet}

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Item sets.

    -- Precast sets to enhance JAs
    sets.precast.JA['Vallation'] = set_combine(sets.Enmity,{body=gear.artifact_body,legs=gear.relic_legs})
    sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
    sets.precast.JA['Pflug'] = set_combine(sets.Enmity,{feet=gear.artifact_feet})
    sets.precast.JA['Battuta'] = set_combine(sets.Enmity,{head=gear.relic_head})
    sets.precast.JA['Liement'] = set_combine(sets.Enmity,{body=gear.relic_body})
    sets.precast.JA['Gambit'] = set_combine(sets.Enmity,{hands=gear.artifact_hands})
    sets.precast.JA['Rayke'] = set_combine(sets.Enmity,{feet=gear.relic_feet})
    sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity,{body=gear.relic_body})
    sets.precast.JA['Swordplay'] = set_combine(sets.Enmity,{hands=gear.relic_hands})
    sets.precast.JA['Embolden'] = set_combine(sets.Enmity,{})
    sets.precast.JA['One for All'] = set_combine(sets.Enmity,{})
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Last Resort'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    sets.precast.JA['Vallation'].DT = set_combine(sets.Enmity.DT,{body=gear.artifact_body,legs=gear.relic_legs})
    sets.precast.JA['Valiance'].DT = sets.precast.JA['Vallation'].DT
    sets.precast.JA['Pflug'].DT = set_combine(sets.Enmity.DT,{feet=gear.artifact_feet})
    sets.precast.JA['Battuta'].DT = set_combine(sets.Enmity.DT,{head=gear.relic_head})
    sets.precast.JA['Liement'].DT = set_combine(sets.Enmity.DT,{body=gear.relic_body})
    sets.precast.JA['Gambit'].DT = set_combine(sets.Enmity.DT,{hands=gear.artifact_hands})
    sets.precast.JA['Rayke'].DT = set_combine(sets.Enmity.DT,{feet=gear.relic_feet})
    sets.precast.JA['Elemental Sforzo'].DT = set_combine(sets.Enmity.DT,{body=gear.relic_body})
    sets.precast.JA['Swordplay'].DT = set_combine(sets.Enmity.DT,{hands=gear.relic_hands})
    sets.precast.JA['Embolden'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['One for All'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['Last Resort'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['Animated Flourish'].DT = set_combine(sets.Enmity.DT, {})

    -- WISHLIST (Guide Upgrades - not owned)
    -- body: MISSING Agwu's robe
	-- hands: MISSING Agwu's Gages
    -- legs: MISSING Agwu's Slops
	-- feet: MISSING Agwu's Pigaches	
    sets.precast.JA['Lunge'] = {ammo="Seeth. Bomblet +1",
        head=gear.herculean_nuke_head,neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Samnuha Coat",hands="Leyline Gloves",ring1="Fenrir Ring +1",ring2="Fenrir Ring +1",
        back="Toro Cape",waist="Salire Belt",legs="Herculean Trousers",feet="Herculean Boots"}

    sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']

    -- Gear for specific elemental nukes.
    sets.element.Dark = {}

    -- Pulse sets, different stats for different rune modes, stat aligned.
    -- WISHLIST (Guide Upgrades - not owned)
    -- ear2: MISSING Saxnot Earring
    -- ring2: MISSING Stikini Ring +1
    sets.precast.JA['Vivacious Pulse'] = {head=gear.empyrean_head,neck="Incanter's Torque",ear1="Beatific Earring",ear2="Divine Earring",ring1="Stikini Ring +1",ring2="Stikini Ring",legs=gear.artifact_legs}
    sets.precast.JA['Vivacious Pulse']['Ignis'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
    sets.precast.JA['Vivacious Pulse']['Gelus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
    sets.precast.JA['Vivacious Pulse']['Flabra'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
    sets.precast.JA['Vivacious Pulse']['Tellus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
    sets.precast.JA['Vivacious Pulse']['Sulpor'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
    sets.precast.JA['Vivacious Pulse']['Unda'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
    sets.precast.JA['Vivacious Pulse']['Lux'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
    sets.precast.JA['Vivacious Pulse']['Tenebrae'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})


    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Yamarang",
        head="Carmine Mask +1",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",
        body="Passion Jacket",hands=gear.artifact_hands,ring1="Defending Ring",
        waist="Chaac Belt",legs=gear.artifact_legs}

    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    sets.precast.Step = {}

    sets.precast.JA['Violent Flourish'] = {}

    -- Fast cast sets for spells
    -- WISHLIST (Guide Upgrades - not owned)
    -- ammo: MISSING Sapience Orb 
    -- legs: MISSING Agwu's Slops  
    sets.precast.FC = {ammo="Impatiens",
            head=gear.artifact_head,neck="Orunmila's Torque",ear1="Etiolation Earring",ear2="Loquac. Earring",
            body=gear.empyrean_body,hands="Leyline Gloves",ring1="Kishar Ring",ring2="Moonlight Ring",
            back=gear.fc_jse_back,waist="Goading Belt",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

    sets.precast.FC.Inspiration = {}

    sets.precast.FC.DT = {ammo="Impatiens",
        head=gear.artifact_head,neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Loquac. Earring",
        body=gear.empyrean_body,hands="Leyline Gloves",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back=gear.enmity_jse_back,waist="Goading Belt",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash", legs=gear.relic_legs})
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})
    sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

    -- Weaponskill sets
    -- WISHLIST (Guide Upgrades - not owned)
    -- ear2: MISSING Odr Earring
    -- ring1: MISSING Ilabrat Ring     
    sets.precast.WS = {ammo="Knobkierrie",
            head="Nyame Helm",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
            body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epona's Ring",ring2="Regal Ring",
            back=gear.da_jse_back,waist="Kentarch Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}
    sets.precast.WS.SomeAcc = {ammo="Seeth. Bomblet +1"}
    sets.precast.WS.Acc = {ammo="Yamarang"}
    sets.precast.WS.HighAcc = {ammo="Yamarang",ear1="Telos Earring",ear2="Sherida Earring"}
     sets.precast.WS.FullAcc = {ammo="Yamarang",neck="Sanctity Necklace",ear1="Telos Earring",ear2="Mache Earring +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",back=gear.stp_jse_back}

     -- WISHLIST (Guide Upgrades - not owned)
    -- head: MISSING Blistering Sallet +1    
    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS,{
        head="Adhemar Bonnet +1",body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",
        legs="Samnuha Tights",feet=gear.herculean_ta_acc_feet})
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc,{})
    sets.precast.WS['Resolution'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
    sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})

    sets.precast.WS['Dimidiation'] = set_combine(sets.precast.WS,{})
    sets.precast.WS['Dimidiation'].Acc = set_combine(sets.precast.WS.Acc,{})
    sets.precast.WS['Dimidiation'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
    sets.precast.WS['Dimidiation'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})

    sets.precast.WS['Ground Strike'] = set_combine(sets.precast.WS,{})
    sets.precast.WS['Ground Strike'].Acc = set_combine(sets.precast.WS.Acc,{})
    sets.precast.WS['Ground Strike'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
    sets.precast.WS['Ground Strike'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})

    sets.precast.WS['Herculean Slash'] = set_combine(sets.precast.JA['Lunge'], {})
    sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.JA['Lunge'], {})

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    -- WISHLIST (Guide Upgrades - not owned)
    -- ammo: MISSING Sapience Orb 
    -- legs: MISSING Agwu's Slops  
    sets.midcast.FastRecast = {ammo="Staunch Tathlum +1",
            head=gear.artifact_head,neck="Orunmila's Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
            body=gear.empyrean_body,hands="Leyline Gloves",ring1="Kishar Ring",ring2="Moonlight Ring",
            back="Evasionist's Cape",waist="Flume Belt +1",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

    sets.midcast.FastRecast.DT = {ammo="Staunch Tathlum +1",
        head=gear.artifact_head,neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Loquac. Earring",
        body=gear.artifact_body,hands="Leyline Gloves",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back="Evasionist's Cape",waist="Goading Belt",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

    sets.midcast.FastRecast.SIRD = {ammo="Staunch Tathlum +1",
        head="Halitus Helm",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Emet Harness +1",hands="Kurys Gloves",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back="Evasionist's Cape",waist="Flume Belt +1",legs=gear.empyrean_legs,feet=gear.empyrean_feet}

    -- WISHLIST (Guide Upgrades - not owned)
    -- ear2: MISSING Mimir Earring 
    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast,{head="Carmine Mask +1",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Loquac. Earring",body="Manasa Chasuble",hands=gear.artifact_hands,ring1="Stikini Ring +1",ring2="Stikini Ring",back="Merciful Cape",waist="Olympus Sash",legs="Carmine Cuisses +1"})

    sets.midcast['Enhancing Magic'].SIRD = set_combine(sets.midcast.FastRecast.SIRD,{})

    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{ammo="Staunch Tathlum +1",head=gear.relic_head,ear1="Andoaa Earring",body=gear.taeon_phalanx_body,hands=gear.taeon_phalanx_hands,ring1="Gelatinous Ring +1",legs=gear.taeon_phalanx_legs,feet=gear.taeon_phalanx_feet})

    sets.midcast['Phalanx'].SIRD = set_combine(sets.midcast.FastRecast.SIRD,{head=gear.relic_head,back="Evasionist's Cape",})

    sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'],{head=gear.artifact_head,legs=gear.relic_legs})
    sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'],{head=gear.empyrean_head})
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {ear2="Earthcry Earring",waist="Siegel Sash"})
    sets.midcast.Flash = set_combine(sets.Enmity, {})
    sets.midcast.Flash.DT = set_combine(sets.Enmity.DT, {})
    sets.midcast.Foil = set_combine(sets.Enmity, {})
    sets.midcast.Foil.DT = set_combine(sets.Enmity.DT, {})
    sets.midcast.Stun = set_combine(sets.Enmity, {})
    sets.midcast.Stun.DT = set_combine(sets.Enmity.DT, {})
    sets.midcast.Jettatura = set_combine(sets.Enmity, {})
    sets.midcast.Jettatura.DT = set_combine(sets.Enmity.DT, {})
    sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
    sets.midcast['Blue Magic'].DT = set_combine(sets.Enmity.DT, {})
    sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})

    sets.midcast.Cure = {ammo="Staunch Tathlum +1",
        head="Carmine Mask +1",neck="Sacro Gorget",ear1="Mendi. Earring",ear2="Roundel Earring",
        body="Manasa Chasuble",hands="Buremte Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring",
        back="Tempered Cape +1",waist="Luminary Sash",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

    sets.midcast['Wild Carrot'] = set_combine(sets.midcast.Cure, {})

    sets.Self_Healing = {hands="Buremte Gloves",ring2="Kunaji Ring"}
    sets.Cure_Received = {hands="Buremte Gloves",ring2="Kunaji Ring"}
    sets.Self_Refresh = {}
    sets.Phalanx_Received = {body=gear.taeon_phalanx_body,hands=gear.taeon_phalanx_hands,legs=gear.taeon_phalanx_legs,feet=gear.taeon_phalanx_feet}

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    sets.resting = {}

    sets.idle = {ammo="Homiliary",
        head="Rawhide Mask",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Tuisto Earring",
        body=gear.artifact_body,hands="Turms Mittens +1",ring1="Stikini Ring +1",ring2="Defending Ring",
        back="Evasionist's Cape",waist="Flume Belt +1",legs=gear.artifact_legs,feet=gear.empyrean_feet}

    sets.idle.Sphere = set_combine(sets.idle,{body=gear.artifact_body})

    sets.idle.Tank = set_combine(sets.idle,{ring1="Gelatinous Ring +1"})

    sets.idle.KiteTank = {ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

    sets.Kiting = {legs="Carmine Cuisses +1"}

    sets.latent_refresh = {waist="Fucho-no-obi"}
    sets.latent_refresh_grip = {} --sub="Oneiros Grip"
    sets.DayIdle = {}
    sets.NightIdle = {}

    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {}
    sets.MP = {ear2="Tuisto Earring",body=gear.empyrean_body,waist="Flume Belt +1"}
    sets.TreasureHunter = set_combine(sets.TreasureHunter, {})

    -- Weapons sets
    sets.weapons.Aettir = {main="Aettir",sub="Utu Grip"}
    sets.weapons.Lionheart = {main="Lionheart",sub="Utu Grip"}
    sets.weapons.Epeolatry = {main="Epeolatry",sub="Utu Grip"}

    -- Defense Sets

    sets.defense.PDT = {ammo="Staunch Tathlum +1",
        head=gear.relic_head,neck="Futhark Torque +2",ear1="Genmei Earring",ear2="Tuisto Earring",
        body=gear.relic_body,hands=gear.artifact_hands,ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back=gear.enmity_jse_back,waist="Flume Belt +1",legs=gear.empyrean_legs,feet=gear.empyrean_feet}
    sets.defense.PDT_HP = {ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body=gear.artifact_body,hands="Nyame Gauntlets",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}
    sets.defense.MDT = {ammo="Yamarang",
        head="Turms Cap +1",neck="Futhark Torque +2",ear1="Genmei Earring",ear2="Odnowa Earring +1",
        body=gear.artifact_body,hands="Turms Mittens +1",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back=gear.enmity_jse_back,waist="Engraved Belt",legs=gear.empyrean_legs,feet=gear.empyrean_feet}
    sets.defense.MDT_HP = {ammo="Yamarang",
        head="Nyame Helm",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Engraved Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
    -- WISHLIST (Guide Upgrades - not owned)
    -- sub: MISSING Irenic Strap +1 (guide: MEVA)
    -- ring2: MISSING Shadow Ring (guide: null magic)
    -- legs: MISSING Agwu's Slops (guide: MEVA)
    sets.defense.MEVA = {ammo="Yamarang",
        head="Nyame Helm",neck="Warder's Charm +1",ear1="Eabani Earring",ear2="Hearty Earring",
        body=gear.artifact_body,hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Purity Ring",
        back=gear.enmity_jse_back,waist="Engraved Belt",legs=gear.artifact_legs,feet="Nyame Sollerets"}
    sets.defense.MEVA_HP = {ammo="Yamarang",
        head="Nyame Helm",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Engraved Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    -- Swap to these on Moonshade using WS if at 3000 TP
    sets.MaxTP = {ear1="Brutal Earring"}
    sets.AccMaxTP = {ear1="Telos Earring"}

    --------------------------------------
    -- Engaged sets
    --------------------------------------

    sets.engaged = {ammo="Ginsen",
            head="Adhemar Bonnet +1",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
            body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Niqmaddu Ring",
            back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_acc_feet}
    sets.engaged.Acc = {ammo="Seeth. Bomblet +1",
            head="Adhemar Bonnet +1",neck="Anu Torque",ear1="Cessance Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Ilabrat Ring",
            back=gear.stp_jse_back,waist="Grunfeld Rope",legs="Meg. Chausses +2",feet=gear.herculean_ta_acc_feet}

    sets.engaged.FullAcc = {ammo="Yamarang",
            head="Carmine Mask +1",neck="Lissome Necklace",ear1="Telos Earring",ear2="Mache Earring +1",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
            back=gear.stp_jse_back,waist="Grunfeld Rope",legs="Carmine Cuisses +1",feet=gear.herculean_ta_acc_feet}

    sets.engaged.DTLite = {ammo="Ginsen",
            head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Epona's Ring",
            back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Meg. Chausses +2",feet=gear.herculean_ta_acc_feet}
    sets.engaged.Acc.DTLite = {ammo="Seeth. Bomblet +1",
            head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Ilabrat Ring",
            back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Meg. Chausses +2",feet=gear.herculean_ta_acc_feet}
    sets.engaged.FullAcc.DTLite = {ammo="Yamarang",
            head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Mache Earring +1",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Defending Ring",ring2="Ramuh Ring +1",
            back=gear.stp_jse_back,waist="Grunfeld Rope",legs="Meg. Chausses +2",feet=gear.herculean_ta_acc_feet}

    sets.engaged.Tank = {ammo="Staunch Tathlum +1",
            head="Turms Cap +1",neck="Futhark Torque +2",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
            body=gear.relic_body,hands="Turms Mittens +1",ring1="Defending Ring",ring2="Gelatinous Ring +1",
            back=gear.enmity_jse_back,waist="Flume Belt +1",legs=gear.empyrean_legs,feet="Turms Leggings +1"}
    sets.engaged.Tank_HP = {ammo="Staunch Tathlum +1",
            head="Nyame Helm",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
            body="Nyame Mail",hands="Nyame Gauntlets",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
            back="Moonlight Cape",waist="Flume Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.engaged.Acc.Tank = sets.engaged.Tank
    sets.engaged.FullAcc.Tank = sets.engaged.Tank
    sets.engaged.Acc.Tank_HP = sets.engaged.Tank_HP
    sets.engaged.FullAcc.Tank_HP = sets.engaged.Tank_HP

    --------------------------------------
    -- Custom buff sets
    --------------------------------------
    sets.buff.Doom = set_combine(sets.buff.Doom, {})
    sets.buff.Sleep = {}
    sets.buff.Battuta = {hands="Turms Mittens +1"}
    sets.buff.Embolden = {back="Evasionist's Cape"}

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 1)
end

function user_job_lockstyle()
    windower.chat.input('/lockstyleset 001')
end