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
    sets.Enmity = {main="Epeolatry",sub="Utu Grip",ammo="Staunch Tathlum +1",
         head="Halitus Helm",neck="Unmoving Collar +1",left_ear="Odnowa Earring +1",right_ear="Cryptic Earring",
         body="Emet Harness +1",hands="Kurys Gloves",left_ring="Eihwaz Ring",right_ring="Supershear Ring",
         back=gear.enmity_jse_back,waist="Goading Belt",legs="Eri. Leg Guards +2",feet="Erilaz Greaves +2"}

    sets.Enmity.SIRD = {main="Epeolatry",sub="Utu Grip",ammo="Staunch Tathlum +1",
        head="Halitus Helm",neck="Unmoving Collar +1",left_ear="Genmei Earring",right_ear="Halasz Earring",
        body="Emet Harness +1",hands="Kurys Gloves",left_ring="Defending Ring",right_ring="Moonlight Ring",
        back=gear.enmity_jse_back,waist="Goading Belt",legs="Carmine Cuisses +1",feet="Karasutengu"}

    sets.Enmity.DT = {main="Epeolatry",sub="Utu Grip",ammo="Staunch Tathlum +1",
        head="Halitus Helm",neck="Unmoving Collar +1",left_ear="Odnowa Earring +1",right_ear="Tuisto Earring",
        body="Emet Harness +1",hands="Kurys Gloves",left_ring="Gelatinous Ring +1",right_ring="Moonlight Ring",
        back="Evasionist's Cape",waist="Flume Belt +1",legs="Eri. Leg Guards +2",feet="Erilaz Greaves +2"}

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Item sets.

    -- Precast sets to enhance JAs
    sets.precast.JA['Vallation'] = set_combine(sets.Enmity,{body="Runeist's Coat +3",legs="Futhark Trousers +3"})
    sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
    sets.precast.JA['Pflug'] = set_combine(sets.Enmity,{feet="Runeist's Bottes +2"})
    sets.precast.JA['Battuta'] = set_combine(sets.Enmity,{head="Futhark Bandeau +2"})
    sets.precast.JA['Liement'] = set_combine(sets.Enmity,{body="Futhark Coat +2"})
    sets.precast.JA['Gambit'] = set_combine(sets.Enmity,{hands="Runeist's Mitons +3"})
    sets.precast.JA['Rayke'] = set_combine(sets.Enmity,{feet="Futhark Boots +1"})
    sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity,{body="Futhark Coat +2"})
    sets.precast.JA['Swordplay'] = set_combine(sets.Enmity,{hands="Futhark Mitons +1"})
    sets.precast.JA['Embolden'] = set_combine(sets.Enmity,{})
    sets.precast.JA['One for All'] = set_combine(sets.Enmity,{})
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Last Resort'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    sets.precast.JA['Vallation'].DT = set_combine(sets.Enmity.DT,{body="Runeist's Coat +3", legs="Futhark Trousers +3"})
    sets.precast.JA['Valiance'].DT = sets.precast.JA['Vallation'].DT
    sets.precast.JA['Pflug'].DT = set_combine(sets.Enmity.DT,{feet="Runeist's Bottes +2"})
    sets.precast.JA['Battuta'].DT = set_combine(sets.Enmity.DT,{head="Futhark Bandeau +2"})
    sets.precast.JA['Liement'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +2"})
    sets.precast.JA['Gambit'].DT = set_combine(sets.Enmity.DT,{hands="Runeist's Mitons +3"})
    sets.precast.JA['Rayke'].DT = set_combine(sets.Enmity.DT,{feet="Futhark Boots +1"})
    sets.precast.JA['Elemental Sforzo'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +2"})
    sets.precast.JA['Swordplay'].DT = set_combine(sets.Enmity.DT,{hands="Futhark Mitons +1"})
    sets.precast.JA['Embolden'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['One for All'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['Last Resort'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['Animated Flourish'].DT = set_combine(sets.Enmity.DT, {})

    sets.precast.JA['Lunge'] = {ammo="Seeth. Bomblet +1",
        head=gear.herculean_nuke_head,neck="Sanctity Necklace",left_ear="Friomisi Earring",right_ear="Hecate's Earring",
        body="Samnuha Coat",hands="Leyline Gloves",left_ring="Fenrir Ring +1",right_ring="Fenrir Ring +1",
        back="Toro Cape",waist="Salire Belt",legs="Herculean Trousers",feet="Herculean Boots"}

    sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']

    -- Gear for specific elemental nukes.
    sets.element.Dark = {}

    -- Pulse sets, different stats for different rune modes, stat aligned.
    sets.precast.JA['Vivacious Pulse'] = {head="Erilaz Galea +2",neck="Incanter's Torque",left_ear="Beatific Earring",right_ear="Divine Earring",left_ring="Stikini Ring +1",right_ring="Stikini Ring",legs="Rune. Trousers +3"}
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
        head="Carmine Mask +1",neck="Unmoving Collar +1",left_ear="Enchntr. Earring +1",
        body="Passion Jacket",hands="Runeist's Mitons +3",left_ring="Defending Ring",
        waist="Chaac Belt",legs="Rune. Trousers +3"}

    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    sets.precast.Step = {}

    sets.precast.JA['Violent Flourish'] = {}

    -- Fast cast sets for spells
    sets.precast.FC = {ammo="Impatiens",
            head="Rune. Bandeau +3",neck="Orunmila's Torque",left_ear="Etiolation Earring",right_ear="Loquac. Earring",
            body="Dread Jupon",hands="Leyline Gloves",left_ring="Kishar Ring",right_ring="Moonlight Ring",
            back=gear.fc_jse_back,waist="Goading Belt",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

    sets.precast.FC.Inspiration = {}

    sets.precast.FC.DT = {ammo="Impatiens",
        head="Rune. Bandeau +3",neck="Unmoving Collar +1",left_ear="Odnowa Earring +1",right_ear="Loquac. Earring",
        body="Runeist's Coat +3",hands="Leyline Gloves",left_ring="Gelatinous Ring +1",right_ring="Moonlight Ring",
        back="Evasionist's Cape",waist="Goading Belt",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash", legs="Futhark Trousers +3"})
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})
    sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

    -- Weaponskill sets
    sets.precast.WS = {ammo="Knobkierrie",
            head="Lustratio Cap +1",neck="Fotia Gorget",left_ear="Moonshade Earring",right_ear="Sherida Earring",
            body="Adhemar Jacket +1",hands=gear.herculean_ws_str_hands,left_ring="Epona's Ring",right_ring="Niqmaddu Ring",
            back=gear.da_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet="Lustra. Leggings +1"}
    sets.precast.WS.SomeAcc = {ammo="Seeth. Bomblet +1",
            head="Adhemar Bonnet +1",neck="Fotia Gorget",left_ear="Moonshade Earring",right_ear="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",left_ring="Epona's Ring",right_ring="Niqmaddu Ring",
            back=gear.da_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet=gear.herculean_ta_acc_feet}
    sets.precast.WS.Acc = {ammo="Yamarang",
            head="Adhemar Bonnet +1",neck="Fotia Gorget",left_ear="Moonshade Earring",right_ear="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",left_ring="Epona's Ring",right_ring="Niqmaddu Ring",
            back=gear.da_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet=gear.herculean_ta_acc_feet}
    sets.precast.WS.HighAcc = {ammo="Yamarang",
            head="Meghanada Visor +2",neck="Fotia Gorget",left_ear="Telos Earring",right_ear="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",left_ring="Epona's Ring",right_ring="Niqmaddu Ring",
            back=gear.da_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet=gear.herculean_ta_acc_feet}
    -- NOTE: duplicate unique ring detected; left/right normalization skipped for this set
    sets.precast.WS.FullAcc = {ammo="Yamarang",
            head="Carmine Mask +1",neck="Sanctity Necklace",left_ear="Telos Earring",right_ear="Mache Earring +1",
            body="Meg. Cuirie +2",hands="Meg. Gloves +2",left_ring="Ramuh Ring +1",right_ring="Ramuh Ring +1",
            back=gear.stp_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet=gear.herculean_ta_acc_feet}

    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS,{})
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

    sets.midcast.FastRecast = {ammo="Staunch Tathlum +1",
            head="Carmine Mask +1",neck="Orunmila's Torque",left_ear="Enchntr. Earring +1",right_ear="Loquac. Earring",
            body="Dread Jupon",hands="Leyline Gloves",left_ring="Kishar Ring",right_ring="Moonlight Ring",
            back="Evasionist's Cape",waist="Flume Belt +1",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

    sets.midcast.FastRecast.DT = {ammo="Staunch Tathlum +1",
        head="Rune. Bandeau +3",neck="Unmoving Collar +1",left_ear="Odnowa Earring +1",right_ear="Loquac. Earring",
        body="Runeist's Coat +3",hands="Leyline Gloves",left_ring="Gelatinous Ring +1",right_ring="Moonlight Ring",
        back="Evasionist's Cape",waist="Goading Belt",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

    sets.midcast.FastRecast.SIRD = {ammo="Staunch Tathlum +1",
        head="Halitus Helm",neck="Unmoving Collar +1",left_ear="Odnowa Earring +1",right_ear="Tuisto Earring",
        body="Emet Harness +1",hands="Kurys Gloves",left_ring="Gelatinous Ring +1",right_ring="Moonlight Ring",
        back="Evasionist's Cape",waist="Flume Belt +1",legs="Eri. Leg Guards +2",feet="Erilaz Greaves +2"}

    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast,{head="Carmine Mask +1",neck="Incanter's Torque",left_ear="Andoaa Earring",right_ear="Loquac. Earring",body="Manasa Chasuble",hands="Runeist's Mitons +3",left_ring="Stikini Ring +1",right_ring="Stikini Ring",back="Merciful Cape",waist="Olympus Sash",legs="Carmine Cuisses +1"})

    sets.midcast['Enhancing Magic'].SIRD = set_combine(sets.midcast.FastRecast.SIRD,{})

    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{ammo="Staunch Tathlum +1",head="Futhark Bandeau +2",left_ear="Odnowa Earring +1",body=gear.taeon_phalanx_body,hands=gear.taeon_phalanx_hands,left_ring="Gelatinous Ring +1",legs=gear.taeon_phalanx_legs,feet=gear.taeon_phalanx_feet})

    sets.midcast['Phalanx'].SIRD = set_combine(sets.midcast.FastRecast.SIRD,{head="Futhark Bandeau +2",back="Evasionist's Cape",})

    sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'],{head="Rune. Bandeau +3",legs="Futhark Trousers +3"})
    sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'],{head="Erilaz Galea +2"})
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {right_ear="Earthcry Earring",waist="Siegel Sash"})
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
        head="Carmine Mask +1",neck="Sacro Gorget",left_ear="Mendi. Earring",right_ear="Roundel Earring",
        body="Manasa Chasuble",hands="Buremte Gloves",left_ring="Stikini Ring +1",right_ring="Stikini Ring",
        back="Tempered Cape +1",waist="Luminary Sash",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

    sets.midcast['Wild Carrot'] = set_combine(sets.midcast.Cure, {})

    sets.Self_Healing = {hands="Buremte Gloves",right_ring="Kunaji Ring"}
    sets.Cure_Received = {hands="Buremte Gloves",right_ring="Kunaji Ring"}
    sets.Self_Refresh = {}
    sets.Phalanx_Received = {body=gear.taeon_phalanx_body,hands=gear.taeon_phalanx_hands,legs=gear.taeon_phalanx_legs,feet=gear.taeon_phalanx_feet}

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {right_ring="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {right_ring="Sheltered Ring"})

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    sets.resting = {}

    sets.idle = {ammo="Homiliary",
        head="Rawhide Mask",neck="Loricate Torque +1",left_ear="Genmei Earring",right_ear="Tuisto Earring",
        body="Runeist's Coat +3",hands="Turms Mittens +1",left_ring="Stikini Ring +1",right_ring="Defending Ring",
        back="Evasionist's Cape",waist="Flume Belt +1",legs="Rune. Trousers +3",feet="Erilaz Greaves +2"}

    sets.idle.Sphere = set_combine(sets.idle,{body="Runeist's Coat +3"})

    sets.idle.Tank = set_combine(sets.idle,{left_ring="Gelatinous Ring +1"})

    sets.idle.KiteTank = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Loricate Torque +1",left_ear="Odnowa Earring +1",right_ear="Tuisto Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",left_ring="Defending Ring",right_ring="Moonlight Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

    sets.Kiting = {legs="Carmine Cuisses +1"}

    sets.latent_refresh = {waist="Fucho-no-obi"}
    sets.latent_refresh_grip = {} --sub="Oneiros Grip"
    sets.DayIdle = {}
    sets.NightIdle = {}

    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {}
    sets.MP = {right_ear="Tuisto Earring",body="Erilaz Surcoat +2",waist="Flume Belt +1"}
    sets.TreasureHunter = set_combine(sets.TreasureHunter, {})

    -- Weapons sets
    sets.weapons.Aettir = {main="Aettir",sub="Utu Grip"}
    sets.weapons.Lionheart = {main="Lionheart",sub="Utu Grip"}
    sets.weapons.Epeolatry = {main="Epeolatry",sub="Utu Grip"}

    -- Defense Sets

    sets.defense.PDT = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum +1",
        head="Fu. Bandeau +2",neck="Futhark Torque +2",left_ear="Genmei Earring",right_ear="Tuisto Earring",
        body="Futhark Coat +2",hands="Runeist's Mitons +3",left_ring="Gelatinous Ring +1",right_ring="Moonlight Ring",
        back=gear.enmity_jse_back,waist="Flume Belt +1",legs="Eri. Leg Guards +2",feet="Erilaz Greaves +2"}
    sets.defense.PDT_HP = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Unmoving Collar +1",left_ear="Odnowa Earring +1",right_ear="Tuisto Earring",
        body="Runeist's Coat +3",hands="Nyame Gauntlets",left_ring="Gelatinous Ring +1",right_ring="Moonlight Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}
    sets.defense.MDT = {main="Aettir",sub="Utu Grip",ammo="Yamarang",
        head="Turms Cap +1",neck="Futhark Torque +2",left_ear="Genmei Earring",right_ear="Odnowa Earring +1",
        body="Runeist's Coat +3",hands="Turms Mittens +1",left_ring="Defending Ring",right_ring="Gelatinous Ring +1",
        back=gear.enmity_jse_back,waist="Engraved Belt",legs="Eri. Leg Guards +2",feet="Erilaz Greaves +2"}
    sets.defense.MDT_HP = {main="Aettir",sub="Utu Grip",ammo="Yamarang",
        head="Nyame Helm",neck="Warder's Charm +1",left_ear="Odnowa Earring +1",right_ear="Tuisto Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",left_ring="Gelatinous Ring +1",right_ring="Moonlight Ring",
        back="Moonlight Cape",waist="Engraved Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
    -- WISHLIST (Guide Upgrades - not owned)
    -- sub: MISSING Irenic Strap +1 (guide: MEVA)
    -- ring2: MISSING Shadow Ring (guide: null magic)
    -- legs: MISSING Agwu's Slops (guide: MEVA)
    sets.defense.MEVA = {main="Aettir",sub="Utu Grip",ammo="Yamarang",
        head="Turms Cap +1",neck="Warder's Charm +1",left_ear="Eabani Earring",right_ear="Hearty Earring",
        body="Runeist's Coat +3",hands="Turms Mittens +1",left_ring="Defending Ring",right_ring="Purity Ring",
        back=gear.enmity_jse_back,waist="Engraved Belt",legs="Rune. Trousers +3",feet="Erilaz Greaves +2"}
    sets.defense.MEVA_HP = {main="Aettir",sub="Utu Grip",ammo="Yamarang",
        head="Nyame Helm",neck="Warder's Charm +1",left_ear="Odnowa Earring +1",right_ear="Tuisto Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",left_ring="Gelatinous Ring +1",right_ring="Moonlight Ring",
        back="Moonlight Cape",waist="Engraved Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    -- Swap to these on Moonshade using WS if at 3000 TP
    sets.MaxTP = {left_ear="Brutal Earring"}
    sets.AccMaxTP = {left_ear="Telos Earring"}

    --------------------------------------
    -- Engaged sets
    --------------------------------------

    sets.engaged = {main="Lionheart",sub="Utu Grip",ammo="Ginsen",
            head="Adhemar Bonnet +1",neck="Anu Torque",left_ear="Brutal Earring",right_ear="Sherida Earring",
            body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",left_ring="Epona's Ring",right_ring="Niqmaddu Ring",
            back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_acc_feet}
    sets.engaged.Acc = {main="Lionheart",sub="Utu Grip",ammo="Seeth. Bomblet +1",
            head="Adhemar Bonnet +1",neck="Anu Torque",left_ear="Cessance Earring",right_ear="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Adhemar Wrist. +1",left_ring="Epona's Ring",right_ring="Ilabrat Ring",
            back=gear.stp_jse_back,waist="Grunfeld Rope",legs="Meg. Chausses +2",feet=gear.herculean_ta_acc_feet}

    sets.engaged.FullAcc = {main="Lionheart",sub="Utu Grip",ammo="Yamarang",
            head="Carmine Mask +1",neck="Lissome Necklace",left_ear="Telos Earring",right_ear="Mache Earring +1",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",left_ring="Ramuh Ring +1",right_ring="Ramuh Ring +1",
            back=gear.stp_jse_back,waist="Grunfeld Rope",legs="Carmine Cuisses +1",feet=gear.herculean_ta_acc_feet}

    sets.engaged.DTLite = {main="Lionheart",sub="Utu Grip",ammo="Ginsen",
            head="Aya. Zucchetto +2",neck="Loricate Torque +1",left_ear="Brutal Earring",right_ear="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Nyame Gauntlets",left_ring="Defending Ring",right_ring="Epona's Ring",
            back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Meg. Chausses +2",feet=gear.herculean_ta_acc_feet}
    sets.engaged.Acc.DTLite = {main="Lionheart",sub="Utu Grip",ammo="Seeth. Bomblet +1",
            head="Aya. Zucchetto +2",neck="Loricate Torque +1",left_ear="Cessance Earring",right_ear="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Nyame Gauntlets",left_ring="Defending Ring",right_ring="Ilabrat Ring",
            back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Meg. Chausses +2",feet=gear.herculean_ta_acc_feet}
    sets.engaged.FullAcc.DTLite = {main="Lionheart",sub="Utu Grip",ammo="Yamarang",
            head="Aya. Zucchetto +2",neck="Loricate Torque +1",left_ear="Telos Earring",right_ear="Mache Earring +1",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",left_ring="Defending Ring",right_ring="Ramuh Ring +1",
            back=gear.stp_jse_back,waist="Grunfeld Rope",legs="Meg. Chausses +2",feet=gear.herculean_ta_acc_feet}

    sets.engaged.Tank = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum +1",
            head="Turms Cap +1",neck="Futhark Torque +2",left_ear="Odnowa Earring +1",right_ear="Tuisto Earring",
            body="Futhark Coat +2",hands="Turms Mittens +1",left_ring="Defending Ring",right_ring="Gelatinous Ring +1",
            back=gear.enmity_jse_back,waist="Flume Belt +1",legs="Eri. Leg Guards +2",feet="Turms Leggings +1"}
    sets.engaged.Tank_HP = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum +1",
            head="Nyame Helm",neck="Unmoving Collar +1",left_ear="Odnowa Earring +1",right_ear="Tuisto Earring",
            body="Nyame Mail",hands="Nyame Gauntlets",left_ring="Gelatinous Ring +1",right_ring="Moonlight Ring",
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
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(4, 19)
    elseif player.sub_job == 'RDM' then
        set_macro_page(5, 19)
    elseif player.sub_job == 'SCH' then
        set_macro_page(5, 19)
    elseif player.sub_job == 'BLU' then
        set_macro_page(6, 19)
    elseif player.sub_job == 'WAR' then
        set_macro_page(7, 19)
    elseif player.sub_job == 'SAM' then
        set_macro_page(8, 19)
    elseif player.sub_job == 'DRK' then
        set_macro_page(9, 19)
    elseif player.sub_job == 'NIN' then
        set_macro_page(10, 19)
    else
        set_macro_page(5, 19)
    end
end

function user_job_lockstyle()
    windower.chat.input('/lockstyleset 001')
end