-- =====================================================================
-- CURSOR UPDATE RULES (DO NOT DELETE)
-- 1) Do not create or rename sets; only edit existing template sets.
-- 3) If a guide recommends unowned gear, add it to the set's WISHLIST
--    block; do not replace equipped items with unowned items.
-- 4) Keep unique rings/earrings consistent:
--    - Each accessory item name must always use the same left/right slot.
-- 5) Do not edit below any protected marker (e.g. "DO NOT EDIT BELOW…").
-- =====================================================================

function user_job_setup()
    -- Options: Override default values
    state.OffenseMode:options('Normal','Acc')
    state.HybridMode:options('Normal','DT')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Match','Normal','Proc')
    state.IdleMode:options('Normal','Refresh')
    state.PhysicalDefenseMode:options('PDT')
    state.MagicalDefenseMode:options('MDT')
    state.ResistDefenseMode:options('MEVA')
    state.Weapons:options('Savage','Aeneas','Aeolian','ProcWeapons','Evisceration','Throwing','SwordThrowing','Bow')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','Suppa','DWMax','Parry'}
    state.AmbushMode = M(false, 'Ambush Mode')

	-- JSE CAPES    
    gear.stp_jse_back = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
    gear.wsd_jse_back = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}

    -- Additional local binds
    send_command('bind ^` input /ja "Flee" <me>')
    send_command('bind !` input /ra <t>')
    send_command('bind @` gs c cycle SkillchainMode')
    send_command('bind @f10 gs c toggle AmbushMode')
    send_command('bind ^backspace input /item "Thief\'s Tools" <t>')
    send_command('bind !backspace input /ja "Hide" <me>')
    send_command('bind ^\\ input /ja "Despoil" <t>')
    send_command('bind !\\ input /ja "Mug" <me>')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Special sets (required by rules)
    --------------------------------------

    -- WISHLIST
    -- feet: Skulk. Poulaines +3
    sets.TreasureHunter = {hands="Pill. Armlets +1",waist="Chaac Belt",feet="Skulk. Poulaines +1"}
    sets.Kiting = {}

    sets.buff.Doom = set_combine(sets.buff.Doom, {})
    sets.buff.Sleep = {}
    
    sets.buff['Sneak Attack'] = {}
    sets.buff['Trick Attack'] = {hands="Pill. Armlets +1"}

    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
    sets.Suppa = {}
    sets.DWEarrings = {}
    sets.DWMax = {}
    sets.Ambush = {}
    
	-- Weapons sets
	sets.weapons.Aeneas = {main="Aeneas",sub="Gleti's Knife"}
	--sets.weapons.Aeolian = {main="Malevolence",sub="Malevolence"}
	--sets.weapons.Savage = {main="Naegling",sub="Gleti's Knife"}
	--sets.weapons.ProcWeapons = {main="Blurred Knife +1",sub="Atoyac"}
	--sets.weapons.Evisceration = {main="Tauret",sub="Gleti's Knife"}
	sets.weapons.Throwing = {main="Aeneas",sub="Gleti's Knife",range="Raider's Bmrng.",ammo=empty}
	--sets.weapons.SwordThrowing = {main="Naegling",sub="Gleti's Knife",range="Raider's Bmrng.",ammo=empty}
	--sets.weapons.Bow = {main="Aeneas",sub="Kustawi +1",range="Kaja Bow",ammo="Chapuli Arrow"}

    sets.precast.Step = {ammo="Yamarang",
        head="Adhemar Bonnet +1",neck="Erudit. Necklace",left_ear="Cessance Earring",right_ear="Mache Earring +1",
        body="Pillager's Vest +1",hands="Adhemar Wrist. +1",left_ring="Ramuh Ring +1",right_ring="Ramuh Ring +1",
        back=gear.stp_jse_back,waist="Olseni Belt",legs="Samnuha Tights",feet="Nyame Sollerets"}
        
    sets.precast.JA['Violent Flourish'] = {ammo="Yamarang",
        head="Adhemar Bonnet +1",neck="Erudit. Necklace",left_ear="Cessance Earring",right_ear="Mache Earring +1",
        body="Pillager's Vest +1",hands="Adhemar Wrist. +1",left_ring="Ramuh Ring +1",right_ring="Ramuh Ring +1",
        back=gear.stp_jse_back,waist="Olseni Belt",legs="Samnuha Tights",feet="Nyame Sollerets"}
        
    sets.precast.JA['Animated Flourish'] = sets.TreasureHunter
    sets.precast.JA.Provoke = sets.TreasureHunter

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    -- WISHLIST
    -- head: Skulker's Bonnet +3
    sets.precast.JA['Collaborator'] = {} -- "Skulker's Bonnet"
    sets.precast.JA['Accomplice'] = {} -- "Skulker's Bonnet"
    -- WISHLIST
    -- feet: Pill. Poulaines +3
    sets.precast.JA['Flee'] = {feet="Nyame Sollerets"}
    sets.precast.JA['Hide'] = {body="Pillager's Vest +1"}
    -- WISHLIST
    -- body: Skulker's Vest +3
    sets.precast.JA['Conspirator'] = {} -- body="Skulker's Vest"
    sets.precast.JA['Steal'] = {feet="Nyame Sollerets"}
    sets.precast.JA['Mug'] = {}
    -- WISHLIST
    -- feet: Skulk. Poulaines +3
    -- legs: Skulk. Culottes +3
    sets.precast.JA['Despoil'] = {} -- legs="Skulker's Culottes",feet="Skulk. Poulaines +1"
    -- WISHLIST
    -- hands: Plun. Armlets +3
    sets.precast.JA['Perfect Dodge'] = {hands="Pill. Armlets +1"}
    -- WISHLIST
    -- legs: Plun. Culottes +3
    sets.precast.JA['Feint'] = {} -- {legs="Assassin's Culottes +2"}

    sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
    sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']

    -- Waltz set (chr and vit)
    -- WISHLIST
    -- head: Mummu Bonnet +2
    sets.precast.Waltz = {ammo="Yamarang",
        neck="Unmoving Collar +1",left_ear="Enchntr. Earring +1",right_ear="Handler's Earring +1",
        body="Passion Jacket",hands="Adhemar Wrist. +1",left_ring="Defending Ring",right_ring="Valseur's Ring",
        back="Moonbeam Cape",waist="Chaac Belt",legs="Samnuha Tights",feet="Nyame Sollerets"}

    -- WISHLIST
    -- left_ring: Asklepian Ring
    sets.Self_Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}


    -- Fast cast sets for spells
    -- WISHLIST
    -- left_ring: Lebeche Ring
    sets.precast.FC = {ammo="Impatiens",
        head=gear.herculean_fc_head,neck="Erudit. Necklace",left_ear="Enchntr. Earring +1",right_ear="Loquac. Earring",
        body="Dread Jupon",hands="Leyline Gloves",right_ring="Prolix Ring"}

    -- WISHLIST
    -- neck: Magoraga Beads
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {body="Passion Jacket"})


    -- Ranged snapshot gear
    sets.precast.RA = {}


    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    -- WISHLIST
    -- body: Skulker's Vest +3
    -- head: Pill. Bonnet +4
    -- legs: Plun. Culottes +4
    -- right_ear: Odr Earring
    sets.precast.WS = {ammo="Coiste Bodhar",
        head="Pill. Bonnet +1",neck="Caro Necklace",left_ear="Moonshade Earring",right_ear="Sherida Earring",
        body=gear.herculean_ws_body,hands="Meg. Gloves +2",left_ring="Ilabrat Ring",right_ring="Regal Ring",
        back=gear.wsd_jse_back,waist="Sailfi Belt +1",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"}
        
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {neck="Combatant's Torque",left_ear="Mache Earring +1",body="Meg. Cuirie +2",waist="Olseni Belt",legs="Meg. Chausses +2"})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    -- WISHLIST
    -- body: Skulker's Vest +3
    -- head: Pill. Bonnet +4
    -- legs: Plun. Culottes +4
    sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {
        hands="Nyame Gauntlets",
        feet="Nyame Sollerets"})
    sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS.Acc, {body="Meg. Cuirie +2"})
    sets.precast.WS["Rudra's Storm"].SA = set_combine(sets.precast.WS["Rudra's Storm"], {ammo="Yetshila +1",body="Meg. Cuirie +2",legs="Pill. Culottes +1"})
    sets.precast.WS["Rudra's Storm"].TA = set_combine(sets.precast.WS["Rudra's Storm"], {ammo="Yetshila +1",body="Meg. Cuirie +2",hands="Pill. Armlets +1",legs="Pill. Culottes +1"})
    sets.precast.WS["Rudra's Storm"].SATA = set_combine(sets.precast.WS["Rudra's Storm"], {ammo="Yetshila +1",body="Meg. Cuirie +2",hands="Pill. Armlets +1",legs="Pill. Culottes +1"})
    
    -- WISHLIST
    -- body: Plunderer's Vest +3
    -- feet: Gleti's Boots
    -- head: Blistering Sallet +1
    -- head: Mummu Bonnet +2
    -- left_ring: Begrudging Ring
    -- legs: Gleti's Breeches
    -- legs: Skulk. Culottes +3
    -- right_ear: Odr Earring
    sets.precast.WS["Evisceration"] = set_combine(sets.precast.WS, {ammo="Yetshila +1",head="Adhemar Bonnet +1",neck="Fotia Gorget",hands="Mummu Wrists +2",waist="Fotia Belt",legs="Pill. Culottes +1",feet="Mummu Gamash. +2"}) -- body="Abnoba Kaftan",
    sets.precast.WS["Evisceration"].Acc = set_combine(sets.precast.WS.Acc, {ammo="Yetshila +1",neck="Fotia Gorget",hands="Mummu Wrists +2",waist="Fotia Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}) -- body="Sayadio's Kaftan",

    sets.precast.WS.Proc = {}
        
    sets.precast.WS['Last Stand'] = sets.precast.WS
    sets.precast.WS['Empyreal Arrow'] = sets.precast.WS['Last Stand']
        
    -- WISHLIST
    -- ammo: Ghastly Tathlum +1
    -- left_ring: Shiva Ring +1
    sets.precast.WS['Aeolian Edge'] = {ammo="Seeth. Bomblet +1",
        head="Nyame Helm",neck="Sanctity Necklace",left_ear="Moonshade Earring",right_ear="Friomisi Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",right_ring="Dingir Ring",
        back=gear.wsd_jse_back,waist="Chaac Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
    sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)

    -- Swap to these on Moonshade using WS if at 3000 TP
    sets.MaxTP = {left_ear="Ishvara Earring",right_ear="Sherida Earring"}
    sets.AccMaxTP = {left_ear="Mache Earring +1",right_ear="Sherida Earring"}

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    -- WISHLIST
    -- left_ring: Lebeche Ring
    sets.midcast.FastRecast = {ammo="Impatiens",
        head=gear.herculean_fc_head,neck="Erudit. Necklace",left_ear="Enchntr. Earring +1",right_ear="Loquac. Earring",
        body="Dread Jupon",hands="Leyline Gloves",right_ring="Prolix Ring"}

    -- Specific spells
    sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})

    sets.midcast.Dia = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
    sets.midcast.Diaga = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
    sets.midcast['Dia II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
    sets.midcast.Bio = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
    sets.midcast['Bio II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)

    -- Ranged gear

    sets.midcast.RA = {}

    sets.midcast.RA.Acc = {}

    --------------------------------------
    -- Idle/resting/defense sets
    --------------------------------------

    -- Resting sets
    sets.resting = {}

    sets.HPDown = {ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Loricate Torque +1",left_ear="Etiolation Earring",right_ear="Genmei Earring",
        body=empty,hands=empty,left_ring="Kunaji Ring",right_ring="Gelatinous Ring +1",
        back="Moonbeam Cape",waist="Olseni Belt",legs=empty,feet=empty}
    
    sets.HPMax = {ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Loricate Torque +1",left_ear="Etiolation Earring",right_ear="Odnowa Earring +1",
        body="Nyame Mail",hands="Nyame Gauntlets",left_ring="Kunaji Ring",right_ring="Gelatinous Ring +1",
        back="Moonbeam Cape",waist="Reiki Yotai",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    -- WISHLIST
    -- body: Gleti's Cuirass
    -- feet: Gleti's Boots
    -- hands: Gleti's Gauntlets
    -- hands: Malignance Gloves
    -- head: Gleti's Mask
    -- legs: Gleti's Breeches
    sets.idle = {ammo="Staunch Tathlum +1",
        head="Adhemar Bonnet +1",neck="Loricate Torque +1",left_ear="Etiolation Earring",right_ear="Odnowa Earring +1",
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1",left_ring="Defending Ring",right_ring="Gelatinous Ring +1",
        back=gear.stp_jse_back,waist="Reiki Yotai",legs="Meg. Chausses +2",feet="Nyame Sollerets"}
        
    sets.idle.Refresh = {ammo="Staunch Tathlum +1",
        head="Adhemar Bonnet +1",neck="Loricate Torque +1",left_ear="Etiolation Earring",right_ear="Sanare Earring",
        body="Nyame Mail",left_ring="Stikini Ring +1",right_ring="Stikini Ring +1",
        back="Moonbeam Cape",waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
        
    sets.idle.Sphere = set_combine(sets.idle, {})

    sets.idle.Weak = set_combine(sets.idle, {})

    -- Defense sets

    sets.defense.PDT = {ammo="Staunch Tathlum +1",
        head="Adhemar Bonnet +1",neck="Loricate Torque +1",left_ear="Etiolation Earring",right_ear="Odnowa Earring +1",
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1",left_ring="Defending Ring",right_ring="Gelatinous Ring +1",
        back=gear.stp_jse_back,waist="Reiki Yotai",legs="Meg. Chausses +2",feet="Nyame Sollerets"}

    -- WISHLIST
    -- hands: Malignance Gloves
    -- right_ring: Shadow Ring
    sets.defense.MDT = {ammo="Staunch Tathlum +1",
        head="Adhemar Bonnet +1",neck="Loricate Torque +1",left_ear="Etiolation Earring",right_ear="Odnowa Earring +1",
        body="Meg. Cuirie +2",left_ring="Defending Ring",
        back=gear.stp_jse_back,waist="Engraved Belt",legs="Meg. Chausses +2",feet="Nyame Sollerets"}
        
    sets.defense.MEVA = {ammo="Staunch Tathlum +1",
        head=gear.herculean_fc_head,neck="Warder's Charm +1",left_ear="Etiolation Earring",right_ear="Odnowa Earring +1",
        body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",left_ring="Vengeful Ring",right_ring="Purity Ring",
        back=gear.stp_jse_back,waist="Engraved Belt",legs="Meg. Chausses +2",feet="Nyame Sollerets"}


    --------------------------------------
    -- Melee sets  
    --------------------------------------

    -- Normal melee group
    -- WISHLIST
    -- body: Malignance Tabard
    -- feet: Skulk. Poulaines +3
    -- hands: Malignance Gloves
    -- head: Skulker's Bonnet +3
    -- left_ear: Skulk. Earring +1
    -- legs: Gleti's Breeches
    -- neck: Asn. Gorget +2
    sets.engaged = {ammo="Ginsen",
        head="Adhemar Bonnet +1",neck="Erudit. Necklace",left_ear="Dedition Earring",right_ear="Sherida Earring",
        body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",left_ring="Gere Ring",right_ring="Moonlight Ring",
        back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Nyame Sollerets"}
        
    sets.engaged.Acc = {ammo="Yamarang",
        head="Pill. Bonnet +1",neck="Combatant's Torque",left_ear="Telos Earring",right_ear="Sherida Earring",
        body="Pillager's Vest +1",hands="Adhemar Wrist. +1",left_ring="Ilabrat Ring",right_ring="Chirich Ring +1",
        back=gear.stp_jse_back,waist="Olseni Belt",legs="Pill. Culottes +1",feet=gear.herculean_ta_acc_feet}
    

    -- WISHLIST
    -- ammo: Aurgelmir Orb +1
    -- body: Malignance Tabard
    -- feet: Skulk. Poulaines +3
    -- hands: Malignance Gloves
    -- head: Skulker's Bonnet +3
    -- legs: Gleti's Breeches
    sets.engaged.DT = {
        head="Adhemar Bonnet +1",neck="Loricate Torque +1",left_ear="Telos Earring",right_ear="Sherida Earring",
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1",left_ring="Defending Ring",right_ring="Moonlight Ring",
        back=gear.stp_jse_back,waist="Reiki Yotai",legs="Meg. Chausses +2",feet="Nyame Sollerets"}

    -- WISHLIST
    -- body: Malignance Tabard
    -- feet: Skulk. Poulaines +3
    -- hands: Malignance Gloves
    -- head: Skulker's Bonnet +3
    -- legs: Gleti's Breeches
    -- right_ear: Odr Earring
    sets.engaged.Acc.DT = {ammo="Staunch Tathlum +1",
        head="Adhemar Bonnet +1",neck="Loricate Torque +1",left_ear="Telos Earring",
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1",left_ring="Defending Ring",right_ring="Moonlight Ring",
        back=gear.stp_jse_back,waist="Reiki Yotai",legs="Meg. Chausses +2",feet="Nyame Sollerets"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(1, 4)
    elseif player.sub_job == 'WAR' then
        set_macro_page(1, 4)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 4)
    else
        set_macro_page(1, 4)
    end
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 002')
end

autows_list = {['Aeneas']="Rudra's Storm",['Aeolian']='Aeolian Edge',['Savage']='Savage Blade',['Throwing']="Rudra's Storm",['SwordThrowing']='Savage Blade',['Evisceration']='Evisceration',['ProcWeapons']='Wasp Sting',['Bow']='Empyreal Arrow'}
