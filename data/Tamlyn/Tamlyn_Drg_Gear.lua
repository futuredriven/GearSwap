-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    -- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
    state.ResistDefenseMode:options('MEVA')
    state.IdleMode:options('Normal', 'PDT','Refresh','Reraise')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Weapons:options('Gungnir','Trishula','Shining','Proc')
    state.Passive = M{['description'] = 'Passive Mode','None','MP','Twilight'}

    -- Reforged Gear
    gear.artifact_head = "Ptero. Armet +1"
    gear.artifact_body = "Ptero. Mail +2"
    gear.artifact_hands = "Ptero. Fin. G. +2"
    gear.artifact_legs = "Ptero. Brais +2"

    gear.relic_head = "Vishap Armet +2"
    gear.relic_body = "Vishap Mail +2"
    gear.relic_hands = "Vis. Fng. Gaunt. +2"
    gear.relic_legs = "Vishap Brais +3"

    gear.stp_jse_back = {name="Brigantia's Mantle", augments={'STR+20', 'Accuracy+20 Attack+20', 'STR+10', '"Store TP"+10', 'Damage taken-5%',}}
    gear.acc_jse_back = {name="Brigantia's Mantle", augments={'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Damage taken-5%',}}
    gear.dex_ws_jse_back = {name="Brigantia's Mantle", augments={'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', 'Weapon skill damage +10%', 'Damage taken-5%',}}
    gear.str_stp_jse_back = {name="Brigantia's Mantle", augments={'STR+20', 'Accuracy+20 Attack+20', 'STR+10', '"Store TP"+10', 'Damage taken-5%',}}
    gear.str_da_jse_back = {name="Brigantia's Mantle", augments={'STR+20', 'Accuracy+20 Attack+20', 'STR+10', '"Dbl.Atk."+10', 'Damage taken-5%',}}
    gear.str_ws_jse_back = {name="Brigantia's Mantle", augments={'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%', 'Damage taken-5%',}}

    select_default_macro_book()

    -- Additional local binds
    send_command('bind ^` input /ja "Hasso" <me>')
    send_command('bind !` input /ja "Seigan" <me>')
    send_command('bind ^f11 gs c cycle MagicalDefenseMode')
    send_command('bind !f7 gs c toggle AutoJumpMode')
    send_command('bind @` gs c cycle SkillchainMode')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets
    -- Precast sets to enhance JAs
    sets.precast.JA.Angon = {ammo="Angon",hands=gear.artifact_hands}
    sets.precast.JA.Jump = {ammo="Ginsen",
        head="Flam. Zucchetto +2",neck="Lissome Necklace",ear1="Sherida Earring",ear2="Telos Earring",
        body=gear.artifact_body,hands=gear.relic_hands,ring1="Petrov Ring",ring2="Niqmaddu Ring",
        back=gear.stp_jse_back,waist="Ioskeha Belt +1",legs=gear.artifact_legs,feet="Ostro Greaves"}
    sets.precast.JA['Ancient Circle'] = {}
    sets.precast.JA['High Jump'] = {ammo="Ginsen",
        head="Flam. Zucchetto +2",neck="Lissome Necklace",ear1="Sherida Earring",ear2="Telos Earring",
        body=gear.artifact_body,hands=gear.relic_hands,ring1="Petrov Ring",ring2="Niqmaddu Ring",
        back=gear.stp_jse_back,waist="Ioskeha Belt +1",legs=gear.relic_legs,feet="Ostro Greaves"}
    sets.precast.JA['Soul Jump'] = {ammo="Ginsen",
        head="Flam. Zucchetto +2",neck="Lissome Necklace",ear1="Sherida Earring",ear2="Telos Earring",
        body=gear.artifact_body,hands=gear.relic_hands,ring1="Petrov Ring",ring2="Niqmaddu Ring",
        back=gear.stp_jse_back,waist="Ioskeha Belt +1",legs=gear.artifact_legs,feet="Ostro Greaves"}
    sets.precast.JA['Spirit Jump'] = {ammo="Ginsen",
        head="Flam. Zucchetto +2",neck="Lissome Necklace",ear1="Sherida Earring",ear2="Telos Earring",
        body=gear.relic_body,hands=gear.relic_hands,ring1="Petrov Ring",ring2="Niqmaddu Ring",
        back=gear.stp_jse_back,waist="Ioskeha Belt +1",legs=gear.artifact_legs,feet="Ostro Greaves"}
    sets.precast.JA['Super Jump'] = {}
    sets.precast.JA['Spirit Link'] = {head=gear.relic_head}
    sets.precast.JA['Call Wyvern'] = {body=gear.artifact_body}
    sets.precast.JA['Deep Breathing'] = {head=gear.artifact_head}
    sets.precast.JA['Spirit Surge'] = {body=gear.artifact_body}
    sets.precast.JA['Steady Wing'] = {}

    -- Breath sets
    sets.precast.JA['Restoring Breath'] = {back="Brigantia's Mantle"}
    sets.precast.JA['Smiting Breath'] = {back="Brigantia's Mantle"}
    sets.HealingBreath = {back="Brigantia's Mantle"}

    -- Fast cast sets for spells

    sets.precast.FC = {ammo="Impatiens",
        head="Carmine Mask +1",neck="Voltsurge Torque",ear2="Loquac. Earring",
        ring1="Lebeche Ring",ring2="Prolix Ring",
        waist="Flume Belt"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}

    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    sets.midcast.Cure = {}

    sets.Self_Healing = {}
    sets.Cure_Received = {}
    sets.Self_Refresh = {}

    -- Midcast Sets
    sets.midcast.FastRecast = {ammo="Staunch Tathlum",
        head="Carmine Mask +1",neck="Voltsurge Torque",ear2="Loquac. Earring",
        ring1="Lebeche Ring",ring2="Prolix Ring",
        waist="Flume Belt"}

    -- Put HP+ gear and the AF head to make healing breath trigger more easily with this set.
    sets.midcast.HB_Trigger = set_combine(sets.midcast.FastRecast, {head=gear.relic_head})

    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined

    sets.precast.WS = {ammo="Knobkierrie",
        head="Flam. Zucchetto +2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
        body="Sulevia's Plate. +2",hands="Sulev. Gauntlets +2",ring1="Karieyh Ring",ring2="Niqmaddu Ring",
        back=gear.str_ws_jse_back,waist="Fotia Belt",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}

    sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {neck="Shulmanu Collar"})
    sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {neck="Shulmanu Collar"})
    sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Stardiver'] = set_combine(sets.precast.WS, {back=gear.str_da_jse_back})
    sets.precast.WS['Stardiver'].SomeAcc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Stardiver'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Stardiver'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Drakesbane'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Drakesbane'].SomeAcc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Drakesbane'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Drakesbane'].Fodder = set_combine(sets.precast.WS.Fodder, {})


    -- Sets to return to when not performing an action.

    -- Resting sets
    sets.resting = {}

    -- Idle sets
    sets.idle = {ammo="Staunch Tathlum",
        head="Sulevia's Mask +2",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Sherida Earring",
        body="Dagon Breast.",hands="Sulev. Gauntlets +2",ring1="Defending Ring",ring2="Niqmaddu Ring",
        back="Shadow Mantle",waist="Flume Belt",legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"}

    -- MISSING: feet Amm Greaves
    sets.idle.Refresh = {ammo="Staunch Tathlum",
        head="Jumalik Helm",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Sherida Earring",
        body="Jumalik Mail",hands="Sulev. Gauntlets +2",ring1="Defending Ring",ring2="Niqmaddu Ring",
        back="Shadow Mantle",waist="Flume Belt",legs="Sulev. Cuisses +2"}

    sets.idle.Weak = set_combine(sets.idle, {})

    sets.idle.Reraise = set_combine(sets.idle, {})

    -- Defense sets
    -- MISSING: ring2 Moonlight Ring
    sets.defense.PDT = {ammo="Staunch Tathlum",
        head="Jumalik Helm",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Sherida Earring",
        body="Sulevia's Platemail +2",hands="Sulev. Gauntlets +2",ring1="Defending Ring",
        back="Shadow Mantle",waist="Flume Belt",legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"}
    -- MISSING: head Twilight Helm
    -- MISSING: body Twilight Mail
    sets.defense.PDTReraise = set_combine(sets.defense.PDT, {})

    -- MISSING: ring2 Moonlight Ring
    sets.defense.MDT = {ammo="Staunch Tathlum",
        head="Jumalik Helm",neck="Warder's Charm +1",ear1="Genmei Earring",ear2="Sherida Earring",
        body="Sulevia's Platemail +2",hands="Sulev. Gauntlets +2",ring1="Defending Ring",
        back="Shadow Mantle",waist="Flume Belt",legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"}
    -- MISSING: head Twilight Helm
    -- MISSING: body Twilight Mail
    sets.defense.MDTReraise = set_combine(sets.defense.MDT, {})

    -- MISSING: ring2 Moonlight Ring
    sets.defense.MEVA = {ammo="Staunch Tathlum",
        head="Jumalik Helm",neck="Warder's Charm +1",ear1="Genmei Earring",ear2="Sherida Earring",
        body="Sulevia's Platemail +2",hands="Sulev. Gauntlets +2",ring1="Defending Ring",
        back="Shadow Mantle",waist="Flume Belt",legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"}

    sets.Kiting = {}
    sets.Reraise = {}
    sets.buff.Doom = set_combine(sets.buff.Doom, {})
    sets.buff.Sleep = {}

    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.passive.MP = {ear2="Sherida Earring",waist="Flume Belt"}
    sets.passive.Twilight = {}
    sets.TreasureHunter = set_combine(sets.TreasureHunter, {})

	-- Weapons sets
	sets.weapons.Gungnir = {main="Gungnir",sub="Utu Grip"}
	sets.weapons.Trishula = {main="Trishula",sub="Utu Grip"}
	sets.weapons.Shining = {main="Shining One",sub="Utu Grip"}
	sets.weapons.Proc = {main="Quint Spear",sub="Utu Grip"}	

    -- Swap to these on Moonshade using WS if at 3000 TP
    -- MISSING: ear1 Lugra Earring +1
    sets.MaxTP = {ear2="Sherida Earring",}
    sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
    sets.AccDayMaxTPWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
    sets.DayMaxTPWSEars = {ear1="Brutal Earring",ear2="Sherida Earring",}
    sets.AccDayWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
    sets.DayWSEars = {ear1="Moonshade Earring",ear2="Sherida Earring",}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group

    sets.engaged = {ammo="Ginsen",
        head="Flam. Zucchetto +2",neck="Shulmanu Collar",ear1="Brutal Earring",ear2="Sherida Earring",
        body="Dagon Breast.",hands="Acro Gauntlets",ring1="Petrov Ring",ring2="Niqmaddu Ring",
        back=gear.stp_jse_back,waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.SomeAcc = {ammo="Ginsen",
        head="Flam. Zucchetto +2",neck="Shulmanu Collar",ear1="Brutal Earring",ear2="Sherida Earring",
        body="Dagon Breast.",hands="Acro Gauntlets",ring1="Petrov Ring",ring2="Niqmaddu Ring",
        back=gear.stp_jse_back,waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.Acc = {ammo="Ginsen",
        head="Flam. Zucchetto +2",neck="Shulmanu Collar",ear1="Digni. Earring",ear2="Telos Earring",
        body="Dagon Breast.",hands="Acro Gauntlets",ring1="Ramuh Ring +1",ring2="Niqmaddu Ring",
        back=gear.stp_jse_back,waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    -- NOTE: duplicate ring/ear detected; will validate in Task 2
    sets.engaged.FullAcc = {ammo="Ginsen",
        head="Flam. Zucchetto +2",neck="Shulmanu Collar",ear1="Mache Earring +1",ear2="Telos Earring",
        body="Dagon Breast.",hands="Acro Gauntlets",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.stp_jse_back,waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    -- MISSING: neck Ganesha's Mala
    sets.engaged.Fodder = {ammo="Ginsen",
        head="Flam. Zucchetto +2",ear1="Brutal Earring",ear2="Sherida Earring",
        body="Dagon Breast.",hands="Acro Gauntlets",ring1="Petrov Ring",ring2="Niqmaddu Ring",
        back=gear.stp_jse_back,waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}

    sets.engaged.AM = {}
    sets.engaged.AM.SomeAcc = {}
    sets.engaged.AM.Acc = {}
    sets.engaged.AM.FullAcc = {}
    sets.engaged.AM.Fodder = {}

    sets.engaged.PDT = {}
    sets.engaged.SomeAcc.PDT = {}
    sets.engaged.Acc.PDT = {}
    sets.engaged.FullAcc.PDT = {}
    sets.engaged.Fodder.PDT = {}

    sets.engaged.AM.PDT = {}
    sets.engaged.AM.SomeAcc.PDT = {}
    sets.engaged.AM.Acc.PDT = {}
    sets.engaged.AM.FullAcc.PDT = {}
    sets.engaged.AM.Fodder.PDT = {}

    --[[ Melee sets for in Adoulin, which has an extra 2% Haste from Ionis.

    sets.engaged.Adoulin = {}
    sets.engaged.Adoulin.SomeAcc = {}
    sets.engaged.Adoulin.Acc = {}
    sets.engaged.Adoulin.FullAcc = {}
    sets.engaged.Adoulin.Fodder = {}

    sets.engaged.Adoulin.AM = {}
    sets.engaged.Adoulin.AM.SomeAcc = {}
    sets.engaged.Adoulin.AM.Acc = {}
    sets.engaged.Adoulin.AM.FullAcc = {}
    sets.engaged.Adoulin.AM.Fodder = {}

    sets.engaged.Adoulin.PDT = {}
    sets.engaged.Adoulin.SomeAcc.PDT = {}
    sets.engaged.Adoulin.Acc.PDT = {}
    sets.engaged.Adoulin.FullAcc.PDT = {}
    sets.engaged.Adoulin.Fodder.PDT = {}

    sets.engaged.Adoulin.AM.PDT = {}
    sets.engaged.Adoulin.AM.SomeAcc.PDT = {}
    sets.engaged.Adoulin.AM.Acc.PDT = {}
    sets.engaged.Adoulin.AM.FullAcc.PDT = {}
    sets.engaged.Adoulin.AM.Fodder.PDT = {}
    ]]

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(5, 13)
    elseif player.sub_job == 'SAM' then
        set_macro_page(3, 13)
    elseif player.sub_job == 'BLU' then
        set_macro_page(2, 13)
    else
        set_macro_page(5, 13)
    end
end