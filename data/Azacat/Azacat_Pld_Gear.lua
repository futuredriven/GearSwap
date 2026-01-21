function user_job_setup()

    -- Options: Override default values	
	state.OffenseMode:options('Normal','Tank','Block')
    state.HybridMode:options('Normal')
    state.WeaponskillMode:options('Match','Normal')
    state.CastingMode:options('Normal','SIRD')
	state.Passive:options('None','AbsorbMP')
    state.PhysicalDefenseMode:options('PDT')
    state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal','Refresh','Block')
	state.Weapons:options('None','ExcaliburSrivatsa','SequenceSrivatsa','NaeglingBlurred')
	
    state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','MP'}

	-- JSE Capes
	-- gear.fastcast_jse_back = {name="Rudianos's Mantle",augments={'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10',}}
	gear.enmity_jse_back = {name="Rudianos's Mantle",augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}}
	gear.tp_jse_back = {name="Rudianos's Mantle",augments={'HP+60','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Occ. inc. resist. to stat. ailments+10',}}
	gear.block_jse_back = {name="Rudianos's Mantle",augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Chance of successful block +5',}}	

	-- Augmented Gear
	gear.enmity_souveran_hands = {name="Souv. Handsch. +1",augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}
	gear.shield_souveran_hands = {name="Souv. Handsch. +1",augments={'HP+65','Shield skill +15','Phys. dmg. taken -4',}}
	gear.enmity_eschite_feet = {name="Souv. Handsch. +1",augments={'HP+80','Enmity+7','Phys. dmg. taken -4',}}
	gear.sird_eschite_feet = {name="Souv. Handsch. +1",augments={'Mag. Evasion+15','Spell interruption rate down +15%','Enmity+7',}}	
	
	-- Reforged Gear
	gear.artifact_head = {name="Rev. Coronet +1"}
	gear.artifact_body = {name="Rev. Surcoat +1"}	
	gear.artifact_hands = {name="Rev. Gauntlets +1"}
	gear.artifact_legs = {name="Rev. Breeches +1"}
	gear.artifact_feet = {name="Rev. Leggings +2"}

	gear.relic_head = {name="Cab. Coronet +1"}
	gear.relic_body = {name="Cab. Surcoat +1"}	
	gear.relic_hands = {name="Cab. Gauntlets +1"}
	gear.relic_legs = {name="Cab. Breeches +1"}
	gear.relic_feet = {name="Cab. Leggings +1"}

	gear.empyrean_head = {name="Chev. Armet +2"}
	gear.empyrean_body = {name="Chev. Cuirass +1"}	
	gear.empyrean_hands = {name="Chev. Gauntlets +1"}
	gear.empyrean_legs = {name="Chev. Cuisses +2"}
	gear.empyrean_feet = {name="Chev. Sabatons +1"}

	-- Additional local binds
	send_command('bind !` gs c SubJobEnmity')
	send_command('bind ^backspace input /ja "Shield Bash" <t>')
	send_command('bind @backspace input /ja "Cover" <stpt>')
	send_command('bind !backspace input /ja "Sentinel" <me>')
	send_command('bind @= input /ja "Chivalry" <me>')
	send_command('bind != input /ja "Palisade" <me>')
	send_command('bind ^delete input /ja "Provoke" <stnpc>')
	send_command('bind !delete input /ma "Cure IV" <stal>')
	send_command('bind @delete input /ma "Flash" <stnpc>')
    send_command('bind !f11 gs c cycle ExtraDefenseMode')
	send_command('bind @` gs c cycle RuneElement')
	send_command('bind ^pause gs c toggle AutoRuneMode')
	send_command('bind !q gs c set IdleMode PDT')
	send_command('bind @f8 gs c toggle AutoTankMode')
	send_command('bind @f10 gs c toggle TankAutoDefense')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	
    select_default_macro_book()
    update_defense_mode()
end

function init_gear_sets()
	
	--------------------------------------
	-- Precast sets
	--------------------------------------
	
    sets.Enmity = {ammo="Sapience Orb",
        head="Loess Barbuta +1",neck="Moonbeam Necklace",ear1="Cryptic Earring",ear2="Trux Earring",
        body="Souv. Cuirass +1",hands=gear.enmity_souveran_hands,ring1="Apeile Ring +1",ring2="Apeile Ring",
        back=gear.enmity_jse_back,waist="Creed Baudrier",legs="Souv. Diechlings +1",feet=gear.enmity_eschite_feet}
		
    sets.Enmity.SIRD = {ammo="Staunch Tathlum +1",
		head="Souv. Barbuta +1",neck="Moonbeam Necklace",ear1="Cryptic Earring",ear2="Trux Earring",
		body="Souv. Cuirass +1",hands=gear.enmity_souveran_hands,ring1="Apeile Ring +1",ring2="Moonlight Ring",
		back=gear.enmity_jse_back,waist="Audumba Sash",legs="Founder's Hose",feet=gear.sird_eschite_feet}
		
    sets.Enmity.DT = {ammo="Staunch Tathlum +1",
        head="Loess Barbuta +1",neck="Moonbeam Necklac",ear1="Odnowa Earring +1",ear2="Trux Earring",
        body="Sakpata's Plate",hands=gear.enmity_souveran_hands,ring1="Moonlight Ring",ring2="Moonlight Ring",
        back=gear.enmity_jse_back,waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
    -- Precast sets to enhance JAs
    sets.precast.JA['Invincible'] = set_combine(sets.Enmity,{legs=gear.relic_legs})
    sets.precast.JA['Holy Circle'] = set_combine(sets.Enmity,{feet=gear.artifact_feet})
    sets.precast.JA['Sentinel'] = set_combine(sets.Enmity,{feet=gear.relic_feet})
    sets.precast.JA['Rampart'] = set_combine(sets.Enmity,{head=gear.relic_head})
    sets.precast.JA['Fealty'] = set_combine(sets.Enmity,{body=gear.relic_body})
    sets.precast.JA['Divine Emblem'] = set_combine(sets.Enmity,{feet=gear.empyrean_feet})
    sets.precast.JA['Cover'] = set_combine(sets.Enmity, {head=gear.artifact_head,body=gear.relic_body})
	
    sets.precast.JA['Invincible'].DT = set_combine(sets.Enmity.DT,{legs=gear.relic_legs})
    sets.precast.JA['Holy Circle'].DT = set_combine(sets.Enmity.DT,{feet=gear.artifact_feet})
    sets.precast.JA['Sentinel'].DT = set_combine(sets.Enmity.DT,{feet=gear.relic_feet})
    sets.precast.JA['Rampart'].DT = set_combine(sets.Enmity.DT,{head=gear.relic_head})
    sets.precast.JA['Fealty'].DT = set_combine(sets.Enmity.DT,{body=gear.relic_body})
    sets.precast.JA['Divine Emblem'].DT = set_combine(sets.Enmity.DT,{feet=gear.empyrean_feet})
    sets.precast.JA['Cover'].DT = set_combine(sets.Enmity.DT, {head=gear.artifact_head,body=gear.relic_body})
	
    -- add mnd for Chivalry
    sets.precast.JA['Chivalry'] = {ammo="Paeapua",
		head=gear.artifact_head,neck="Unmoving Collar +1", -- ear1="Nourish. Earring",ear2="Nourish. Earring +1",
		body=gear.artifact_body,hands=gear.relic_hands,ring1="Stikini Ring +1",ring2="Moonlight Ring", -- ring2="Rufescent Ring",
		back=gear.enmity_jse_back,waist="Luminary Sash",legs=gear.relic_legs,feet="Carmine Greaves +1"}
		
    sets.precast.JA['Chivalry'].DT = {ammo="Paeapua",
		head=gear.artifact_head,neck="Unmoving Collar +1",ear1="Odnowa Earring +1", -- ear2="Tuisto Earring",
		body=gear.artifact_body,hands=gear.relic_hands,ring1="Moonlight Ring",ring2="Moonlight Ring",
		back=gear.enmity_jse_back,waist="Luminary Sash",legs=gear.relic_legs,feet="Carmine Greaves +1"}

	sets.precast.JA['Shield Bash'] = set_combine(sets.Enmity, {hands=gear.relic_hands})		
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Palisade'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Intervene'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	
	sets.precast.JA['Shield Bash'].DT = set_combine(sets.Enmity.DT, {hands=gear.relic_hands})		
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Palisade'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Intervene'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    
    sets.precast.Step = {}
		
	sets.precast.JA['Violent Flourish'] = {}
		
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    -- Fast cast sets for spells
    
    sets.precast.FC = {ammo="Sapience Orb",
		head="Carmine Mask +1",ear1="Enchntr. Earring +1",ear2="Loquac. Earring", -- neck="Voltsurge Torque",
		body=gear.artifact_body,hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
		back=gear.fastcast_jse_back,waist="Creed Baudrier",feet="Carmine Greaves +1"} -- legs="Enif Cosciales"
		
    sets.precast.FC.DT = {ammo="Sapience Orb",
        head="Souv. Schaller +1",ear1="Odnowa Earring +1", -- neck="Voltsurge Torque", ear2="Tuisto Earring"
        body=gear.artifact_body,hands="Souv. Handsch. +1",ring1="Moonlight Ring",ring2="Moonlight Ring",
        back=gear.fastcast_jse_back,waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	sets.precast.FC['Enhancing Magic'].DT = set_combine(sets.precast.FC.DT, {waist="Siegel Sash"})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {}) -- neck="Diemer Gorget",ear1="Nourish. Earring",ear2="Nourish. Earring +1",body="Jumalik Mail"
  
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {range=empty,ammo="Crepuscular Pebble",
		head="Nyame Helm",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body="Nyame Mail",hands="Malignance Gloves",ring1="Rufescent Ring",ring2="Karieyh Ring",
		back=gear.wsd_jse_back,waist="Fotia Belt",legs="Nyame Flanchard",feet="Leth. Houseaux +2"}
		
    sets.precast.WS.DT = {ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Telos Earring", -- ear2="Tuisto Earring"
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Moonlight Ring",ring2="Moonlight Ring",
        back=gear.enmity_jse_back,waist="Creed Baudrier",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {})

	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {})

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",ring1="Rufescent Ring",ring2="Karieyh Ring"})
	
	sets.precast.WS['Flat Blade'] = {ammo="Ginsen",
        head="Flam. Zucchetto +1",neck="Erra Pendant",ear1="Gwati Earring",ear2="Digni. Earring",
        body="Flamma Korazin +1",hands="Flam. Manopolas +1",ring1="Defending Ring",ring2="Stikini Ring +1",
        back="Ground. Mantle +1",waist="Grunfeld Rope",legs="Flamma Dirs +1",feet="Flam. Gambieras +1"}

    sets.precast.WS['Sanguine Blade'] = {}

    sets.precast.WS['Atonement'] = {ammo="Sapience Orb",
        head="Loess Barbuta +1",neck="Moonbeam Necklace",ear1="Trux Earring",ear2="Moonshade Earring",
        body="Souv. Cuirass +1",hands=gear.enmity_souveran_hands,ring1="Apeile Ring +1",ring2="Apeile Ring",
        back=gear.enmity_jse_back,waist="Fotia Belt",legs="Souv. Diechlings +1",feet="Eschite Greaves"}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Telos Earring",ear2="Brutal Earring",}
	sets.AccMaxTP = {}


	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.midcast.FastRecast = {ammo="Sapience Orb",
		head="Carmine Mask +1",ear1="Enchntr. Earring +1",ear2="Loquac. Earring", -- neck="Voltsurge Torque",
		body=gear.artifact_body,hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
		back=gear.fastcast_jse_back,waist="Creed Baudrier",feet="Carmine Greaves +1"} -- legs="Enif Cosciales"
		
	sets.midcast.FastRecast.DT = {ammo="Sapience Orb",
        head="Souv. Schaller +1",ear1="Odnowa Earring +1", -- neck="Voltsurge Torque", ear2="Tuisto Earring"
        body=gear.artifact_body,hands="Souv. Handsch. +1",ring1="Moonlight Ring",ring2="Moonlight Ring",
        back=gear.fastcast_jse_back,waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}

    sets.midcast.Flash = set_combine(sets.Enmity, {})
	sets.midcast.Flash.SIRD = set_combine(sets.Enmity.SIRD, {})
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast.Stun.SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast.Cocoon = set_combine(sets.Enmity.SIRD, {})

    sets.midcast.Cure = {ammo="Staunch Tathlum +1", -- main="Deacon Sword",sub="Sacro Bulwark",
		head="Loess Barbuta +1", -- neck="Sacro Gorget",ear1="Nourish. Earring",ear2="Nourish. Earring +1",
		ring1="Defending Ring",ring2="Moonlight Ring", -- body="Jumalik Mail",hands="Macabre Gaunt. +1",
		back=gear.enmity_jse_back,waist="Creed Baudrier",legs="Carmine Cuisses +1"} --feet="Odyssean Greaves"
		
    sets.midcast.Cure.SIRD = {ammo="Staunch Tathlum +1",
		head="Souveran Schaller +1",neck="Moonlight Necklace", --ear1="Nourish. Earring",ear2="Nourish. Earring +1",
		ring1="Defending Ring",ring2="Moonlight Ring", -- body="Jumalik Mail",hands="Macabre Gaunt. +1",
		back=gear.enmity_jse_back,waist="Audumbla Sash",legs="Founder's Hose",feet=gear.sird_eschite_feet}
		
    sets.midcast.Cure.DT = {ammo="Staunch Tathlum +1", -- main="Deacon Sword",sub="Sacro Bulwark",
        head="Souv. Schaller +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1", -- ear2="Tuisto Earring",
        body=gear.artifact_body,hands="Souv. Handsch. +1",ring1="Moonlight Ring",ring2="Moonlight Ring",
        back=gear.enmity_jse_back,waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
    sets.midcast.Reprisal = {ammo="Staunch Tathlum +1", -- main="Colada",sub="Priwen",
		head="Loess Barbuta +1",neck="Unmoving Collar +1",ear1="Odnowa Earring +1", -- ear2="Tuisto Earring",
        body=gear.artifact_body,hands="Souv. Handsch. +1",ring1="Moonlight Ring",ring2="Moonlight Ring",
        back=gear.enmity_jse_back,waist="Creed Baudrier",legs="Arke Cosc. +1",feet="Souveran Schuhs +1"}

	sets.Self_Healing = {ammo="Staunch Tathlum +1", -- main="Deacon Sword",sub="Sacro Bulwark",
		head="Souv. Schaller +1", -- neck="Sacro Gorget",ear1="Nourish. Earring",ear2="Nourish. Earring +1",
		body="Souv. Cuirass +1",hands="Macabre Gaunt. +1",ring1="Moonlight Ring",ring2="Moonlight Ring",
		back=gear.enmity_jse_back,waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
	sets.Self_Healing.SIRD = {ammo="Staunch Tathlum +1",
		head="Souveran Schaller +1",neck="Moonlight Necklace", --ear1="Nourish. Earring",ear2="Nourish. Earring +1",
		ring1="Defending Ring",ring2="Moonlight Ring", -- body="Jumalik Mail",hands="Macabre Gaunt. +1",
		back=gear.enmity_jse_back,waist="Audumbla Sash",legs="Founder's Hose",feet=gear.sird_eschite_feet}
		
	sets.Self_Healing.DT = {ammo="Staunch Tathlum +1", -- main="Deacon Sword",sub="Sacro Bulwark",
        head="Souv. Schaller +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1", -- ,ear2="Tuisto Earring"
        body=gear.artifact_body,hands="Souv. Handsch. +1",ring1="Moonlight Ring",ring2="Moonlight Ring",
        back=gear.enmity_jse_back,waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}

	sets.Cure_Received = {hands="Souv. Handsch. +1",feet="Souveran Schuhs +1"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}

    sets.midcast['Enhancing Magic'] = {ammo="Sapience Orb",
		head="Carmine Mask +1",neck="Incanter's Torque",ear1="Odnowa Earring +1",ear2="Andoaa Earring", -- ear1="Mimir Earring",
		body="Shab. Cuirass +1",ring1="Moonlight Ring",ring2="Moonlight Ring",hands="Regal Gauntlets",
		waist="Creed Baudrier",legs="Carmine Cuisses +1"}
		
    sets.midcast['Enhancing Magic'].SIRD = {ammo="Staunch Tathlum +1",
		head="Souv. Schaller +1",neck="Moonlight Necklace",ear1="Odnowa Earring +1",ear2="Andoaa Earring", -- ,ear1="Mimir Earring",ear2="Tuisto Earring"
		body="Shab. Cuirass +1",hands="Souv. Handsch. +1",ring1="Moonlight Ring",ring2="Moonlight Ring",
		waist="Audumbla Sash",legs="Founder's Hose",feet="Eschite greaves"}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	
	sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {hands="Souv. Handsch. +1",legs="Sakpata's Cuisses",feet="Souveran Schuhs +1"}) -- back="Weard Mantle",
	sets.midcast.Phalanx.SIRD = set_combine(sets.midcast['Enhancing Magic'].SIRD, {hands="Souv. Handsch. +1",feet="Souveran Schuhs +1"}) -- back="Weard Mantle",
	sets.midcast.Phalanx.DT = set_combine(sets.midcast.Phalanx.SIRD, {})	
	sets.Phalanx_Received = {hands="Souv. Handsch. +1",legs="Sakpata's Cuisses",feet="Souveran Schuhs +1"} -- back="Weard Mantle",
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

    sets.resting = {ammo="Homiliary",
		head="Souv. Schaller +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Souv. Cuirass +1",hands="Souv. Handsch. +1",ring1="Moonlight Ring",ring2="Stikini Ring +1",
		back=gear.enmity_jse_back,waist="Fucho-no-obi",legs="Souv. Diechlings +1",feet=gear.relic_feet}

    -- Idle sets
	sets.idle = {main="Sakpata's sword",sub="Srivatsa",ammo="Staunch Tathlum +1",
		head=gear.empyrean_head,neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Ethereal Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Moonlight Ring",ring2="Moonlight Ring",
		back=gear.enmity_jse_back,waist="Flume Belt +1",legs=gear.empyrean_legs,feet="Sakpata's Leggings"}
		
    sets.idle.Block = {main="Sakpata's sword",sub="Ochain",ammo="Staunch Tathlum +1",
		head=gear.empyrean_head,neck="Combatant's Torque",ear1="Thureous Earring",ear2="Foresti Earring",
		body="Sakpata's Plate",hands=gear.shield_souveran_hands,ring1="Moonlight Ring",ring2="Moonlight Ring",
		back=gear.block_jse_back,waist="Carrier's Sash",legs=gear.empyrean_legs,feet=gear.artifact_feet}
		
    sets.idle.Refresh = {main="Sakpata's sword",sub="Srivatsa",ammo="Homiliary",
		head="Sakpata's Helm",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Ethereal Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.enmity_jse_back,waist="Flume Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {}
	sets.latent_regen = {ring1="Apeile Ring +1",ring2="Apeile Ring"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	--------------------------------------
    -- Defense sets
    --------------------------------------
    
    -- Extra defense sets.  Apply these on top of melee or defense sets.
	sets.Knockback = {}
    sets.MP = {head="Chev. Armet +1",neck="Coatl Gorget +1",ear2="Ethereal Earring",waist="Flume Belt +1",feet=gear.artifact_feet}
	sets.passive.AbsorbMP = {head="Chev. Armet +1",neck="Coatl Gorget +1",ear2="Ethereal Earring",waist="Flume Belt +1",feet=gear.artifact_feet}
    sets.MP_Knockback = {}
    sets.Twilight = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.ExcaliburSrivatsa = {main="Excalibur",sub="Srivatsa"}
	sets.weapons.SequenceSrivatsa = {main="Sequence",sub="Srivatsa"}
	sets.weapons.NaeglingBlurred = {main="Naegling",sub="Blurred Shield +1"}
	sets.weapons.SakpataSrivatsa = {main="Sakpata's sword",sub="Srivatsa"}
	sets.weapons.SakpataOchain = {main="Sakpata's sword",sub="Ochain"}
	sets.weapons.SakpataAegis = {main="Sakpata's sword",sub="Aegis"}
    
    sets.defense.Block = {main="Sakpata's sword",sub="Ochain",ammo="Staunch Tathlum +1",
		head=gear.empyrean_head,neck="Combatant's Torque",ear1="Thureous Earring",ear2="Foresti Earring",
		body="Sakpata's Plate",hands=gear.shield_souveran_hands,ring1="Moonlight Ring",ring2="Moonlight Ring",
		back=gear.block_jse_back,waist="Carrier's Sash",legs=gear.empyrean_legs,feet=gear.artifact_feet}
		
	sets.defense.PDT = {main="Sakpata's sword",sub="Srivatsa",ammo="Staunch Tathlum +1",
		head=gear.empyrean_head,neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Ethereal Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Moonlight Ring",ring2="Warden's Ring",
		back=gear.enmity_jse_back,waist="Flume Belt +1",legs=gear.empyrean_legs,feet=gear.artifact_feet}
		
	sets.defense.MDT = {main="Sakpata's sword",sub="Aegis",ammo="Staunch Tathlum +1",
		head="Sakpata's Helm",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Archon Ring",ring2="Moonlight Ring",
		back=gear.enmity_jse_back,waist="Carrier's Sash",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}

	sets.defense.MEVA = {main="Sakpata's sword",sub="Aegis",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Purity Ring",ring2="Moonlight Ring",
		back=gear.enmity_jse_back,waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	--------------------------------------
	-- Engaged sets
	--------------------------------------
    
	sets.engaged = {main="Sakpata's sword",sub="Srivatsa",ammo="Ginsen",
		head="Sakpata's Helm",neck="Combatant's Torque",ear1="Odnowa Earring +1",ear2="Telos Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Moonlight Ring",ring2="Moonlight Ring",
		back=gear.tp_jse_back,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}

    sets.engaged.DW = {}

    sets.engaged.DW.Acc = {}

	sets.engaged.Tank = {main="Sakpata's sword",sub="Srivatsa",ammo="Staunch Tathlum +1",
		head=gear.empyrean_head,neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Ethereal Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Moonlight Ring",ring2="Moonlight Ring",
		back=gear.enmity_jse_back,waist="Sailfi Belt +1",legs=gear.empyrean_legs,feet="Sakpata's Leggings"}

	sets.engaged.Block = {main="Sakpata's sword",sub="Ochain",ammo="Staunch Tathlum +1",
		head=gear.empyrean_head,neck="Combatant's Torque",ear1="Thureous Earring",ear2="Foresti Earring",
		body="Sakpata's Plate",hands=gear.shield_souveran_hands,ring1="Moonlight Ring",ring2="Moonlight Ring",
		back=gear.block_jse_back,waist="Carrier's Sash",legs=gear.empyrean_legs,feet=gear.artifact_feet}
		
	sets.engaged.NoShellTank = {main="Sakpata's sword",sub="Aegis",ammo="Staunch Tathlum +1",
		head="Sakpata's Helm",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Archon Ring",ring2="Moonlight Ring",
		back=gear.enmity_jse_back,waist="Carrier's Sash",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
		
    sets.engaged.Reraise = set_combine(sets.engaged.Tank, sets.Reraise)
		
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {neck="Vim Torque"}
    sets.buff.Cover = {body=gear.relic_body}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'BLU' then
        set_macro_page(5, 9)
    elseif player.sub_job == 'DNC' then
        set_macro_page(1, 9)
    else
        set_macro_page(3, 9) --War/Etc
    end
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 003')
end