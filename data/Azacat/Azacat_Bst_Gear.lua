function user_job_setup()
    state.OffenseMode:options('Normal','Acc')
    state.HybridMode:options('Normal','DT','PetTank','BothDD')
    state.WeaponskillMode:options('Match','Normal','Acc')
    state.CastingMode:options('Normal')
    state.IdleMode:options('Normal','Refresh')
    state.RestingMode:options('Normal')
    state.PhysicalDefenseMode:options('PetPDT','PDT')
    state.MagicalDefenseMode:options('PetMDT','MDT')
    state.ResistDefenseMode:options('PetMEVA','MEVA')
    state.Weapons:options('None','Default','DualWeapons')
    autows_list = {['Default']='Ruinator',['DualWeapons']='Ruinator'}

    -- Gear definitions from OLD_FILE
    gear.stp_jse_back = {name="Artio's Mantle",augments={'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Phys. dmg. taken-10%',}}
    gear.chr_jse_back = {name="Artio's Mantle",augments={'CHR+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'CHR+10', 'Weapon skill damage +10%', 'Phys. dmg. taken-10%',}}    

    gear.artifact_head = "Totemic Helm +1"
    gear.artifact_body = "Totemic Jackcoat +1"    
    gear.artifact_hands = "Totemic Gloves +1"
    gear.artifact_legs = "Totemic Trousers +1"
    gear.artifact_feet = "Totemic Gaiters +1"

    gear.relic_head = "Ankusa Helm +1"
    gear.relic_body = "Ankusa Jackcoat +1"    
    gear.relic_hands = "Ankusa Gloves +1"
    gear.relic_legs = "Ankusa Trousers +1"
    gear.relic_feet = "Ankusa Gaiters +1"

    gear.empyrean_head = "Nukumi Cabasset +1"
    gear.empyrean_body = "Nukumi Gausape +1"    
    gear.empyrean_hands = "Nukumi Manoplas +1"
    gear.empyrean_legs = "Nukumi Quijotes +1"
    gear.empyrean_feet = "Nukumi Ocreae +1"
    
    gear.PHYKumbha1 = {name="Kumbhakarna",augments={'Pet: Attack+20 Pet: Rng.Atk.+20', 'Pet: "Dbl.Atk."+4 Pet: Crit.hit rate +4', 'Pet: TP Bonus+180',}}
    gear.PHYKumbha2 = {name="Kumbhakarna",augments={'Pet: Accuracy+18 Pet: Rng. Acc.+18', 'Pet: TP Bonus+160',}}
    gear.PDTMABKumbha = {name="Kumbhakarna",augments={'Pet: "Mag.Atk.Bns."+19', 'Pet: Phys. dmg. taken -5%', 'Pet: TP Bonus+180',}}
    gear.MABKumbha = {name="Kumbhakarna",augments={'Pet: "Mag.Atk.Bns."+20', 'Pet: Phys. dmg. taken -4%', 'Pet: TP Bonus+200',}}

    -- Set up Jug Pet cycling and keybind Ctrl+F7
    -- INPUT PREFERRED JUG PETS HERE
    state.JugMode = M{['description']='Jug Mode','GenerousArthur','ScissorlegXerin','BlackbeardRandy','AttentiveIbuki','DroopyDortwin','WarlikePatrick','AcuexFamiliar'}
    send_command('bind !f7 gs c cycle JugMode')

    -- Set up Monster Correlation Modes and keybind Alt+F7
    state.CorrelationMode = M{['description']='Correlation Mode', 'Neutral', 'Favorable'}
    send_command('bind @!f7 gs c cycle CorrelationMode')

    -- Set up Pet Modes for Hybrid sets and keybind 'Windows Key'+F7
    state.PetMode = M{['description']='Pet Mode','Tank','DD'}
    send_command('bind @f9 gs c cycle PetMode')

    -- Set up Reward Modes and keybind Ctrl+Backspace
    state.RewardMode = M{['description']='Reward Mode', 'Theta', 'Zeta', 'Eta'}
    send_command('bind ^backspace gs c cycle RewardMode')

    send_command('bind @f8 gs c toggle AutoReadyMode')
    send_command('bind !` gs c ready default')

    --Example of how to change default ready moves.
    --ready_moves.default.WarlikePatrick = 'Tail Blow'


    --Ikenga_axe_bonus = 300  -- It is 300 at R25. Uncomment if you need to manually adjust because you are using below R25 or above

    select_default_macro_book()
end

-- BST gearsets
function init_gear_sets()
    -- PRECAST SETS
    sets.precast.JA['Killer Instinct'] = {head=gear.relic_head}
    sets.precast.JA['Bestial Loyalty'] = {body="Mirke Wardecors",hands=gear.relic_hands}
    sets.precast.JA['Call Beast'] = sets.precast.JA['Bestial Loyalty']
    sets.precast.JA.Familiar = {legs=gear.relic_legs}
    sets.precast.JA.Tame = {head=gear.artifact_head}
    sets.precast.JA.Spur = {back="Artio's Mantle",feet=gear.empyrean_feet}
    -- MISSING: main Skullrender
    sets.SpurAxe = {}
    -- MISSING: main Skullrender
    -- MISSING: sub Skullrender
    sets.SpurAxesDW = {}

    sets.precast.JA['Feral Howl'] = {range="Ullr",ammo=empty,
        head="Nyame Helm",neck="Bst. Collar +2",left_ear="Digni. Earring",
        body=gear.relic_body,hands="Nyame Gauntlets",left_ring="Stikini Ring +1",right_ring="Stikini Ring +1",
        back=gear.chr_jse_back,waist="Eschan Stone",legs=gear.relic_legs,feet=gear.relic_feet}

    -- MISSING: neck Aife's Medal
    -- MISSING: waist Engraved Belt
    sets.precast.JA.Reward = {
        head="Stout Bonnet",left_ear="Etiolation Earring",right_ear="Lifestorm Earring", --Pratik Earring
        body=gear.relic_body,hands="Malignance Gloves",left_ring="Stikini Ring +1",right_ring="Stikini Ring +1",
        back=gear.chr_jse_back,legs=gear.relic_legs,feet=gear.relic_feet}

    sets.precast.JA.Reward.DW = {}

    sets.precast.JA.Reward.Theta = set_combine(sets.precast.JA.Reward, {ammo="Pet Food Theta"})
    sets.precast.JA.Reward.Zeta = set_combine(sets.precast.JA.Reward, {ammo="Pet Food Zeta"})
    sets.precast.JA.Reward.Eta = set_combine(sets.precast.JA.Reward, {ammo="Pet Food Eta"})
    

    -- MISSING: right_ear Crep. Earring 
    sets.precast.JA.Charm = {
        head=gear.artifact_head,neck="Bst. Collar +2",left_ear="Digni. Earring",
        body=gear.relic_body,hands=gear.relic_hands,left_ring="Stikini Ring +1",right_ring="Stikini Ring +1",
        back=gear.chr_jse_back,waist="Eschan Stone",legs=gear.relic_legs,feet=gear.relic_feet}

    -- CURING WALTZ
    sets.precast.Waltz = {}

        -- HEALING WALTZ
    sets.precast.Waltz['Healing Waltz'] = {}

        -- STEPS
    sets.precast.Step = {}

        -- VIOLENT FLOURISH
    sets.precast.Flourish1 = {}
    sets.precast.Flourish1['Violent Flourish'] = {}

    -- MISSING: body Sacro Breastplate
    sets.precast.FC = {ammo="Impatiens",
        neck="Voltsurge Torque",right_ear="Loquac. Earring",
        hands="Leyline Gloves",left_ring="Kishar Ring",right_ring="Prolix Ring"}
        
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})
    -- MISSING: neck Magoraga Beads

        -- MIDCAST SETS
    sets.midcast.FastRecast = {ammo="Impatiens",
        neck="Voltsurge Torque",right_ear="Loquac. Earring",
        hands="Leyline Gloves",left_ring="Kishar Ring",right_ring="Prolix Ring"}
    -- MISSING: body Sacro Breastplate

    sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})
    -- MISSING: back Mujin Mantle

    sets.midcast.Cure = {}

    sets.midcast.Curaga = sets.midcast.Cure

    sets.Self_Healing = {hands="Buremte Gloves",right_ring="Kunaji Ring",waist="Gishdubar Sash"}
    sets.Cure_Received = {hands="Buremte Gloves",right_ring="Kunaji Ring",waist="Gishdubar Sash"}
    sets.Self_Refresh = {waist="Gishdubar Sash"}

    sets.midcast.Stoneskin = sets.midcast.FastRecast

    sets.midcast.Cursna = set_combine(sets.midcast.FastRecast, {neck="Debilis Medallion",left_ring="Haoma's Ring",right_ring="Menelaus's Ring"})

    sets.midcast.Protect = set_combine(sets.midcast.FastRecast, {right_ring="Sheltered Ring"})
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = set_combine(sets.midcast.FastRecast, {right_ring="Sheltered Ring"})
    sets.midcast.Shellra = sets.midcast.Shell

    sets.midcast['Enfeebling Magic'] = sets.midcast.FastRecast

    sets.midcast['Elemental Magic'] = sets.midcast.FastRecast

    sets.midcast.Helix = sets.midcast['Elemental Magic']
    sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic']

        -- WEAPONSKILLS
        -- Default weaponskill sets.
    sets.precast.WS = {
        head="Gleti's Mask",neck="Combatant's Torque",left_ear="Moonshade Earring",right_ear="Sherida Earring",
        body="Gleti's Cuirass",hands="Gleti's Gauntlets",left_ring="Ifrit Ring +1",right_ring="Ifrit Ring +1",
        waist="Fotia Belt",legs="Gleti's Breeches",feet="Gleti's boots"}
    -- MISSING: ammo Voluspa Tathlum
    -- MISSING: back Bleating Mantle

    sets.precast.WS.Acc = {
        head=gear.valorous_pet_head,neck="Combatant's Torque",left_ear="Brutal Earring",right_ear="Sherida Earring",
        body="Malignance Tabard",hands="Leyline Gloves",right_ring="Ilabrat Ring",
        legs="Malignance Tights",feet="Malignance Boots"}
    -- MISSING: ammo Voluspa Tathlum
    -- MISSING: left_ring Regal Ring
    -- MISSING: back Letalis Mantle
    -- MISSING: waist Olseni Belt
    -- MISSING: legs Meg. Chausses +2
    -- MISSING: feet Nukumi Ocreae +1

        -- Swap to these on Moonshade using WS if at 3000 TP
    sets.MaxTP = {left_ear="Brutal Earring",right_ear="Sherida Earring",}
    sets.AccMaxTP = {right_ear="Telos Earring"}
    -- MISSING: left_ear Mache Earring +1

                -- PET SIC & READY MOVES
    sets.midcast.Pet.WS = {main=gear.PHYKumbha1,sub=gear.PHYKumbha2,
        neck="Shulmanu Collar",left_ear="Enmerkar Earring",
        body=gear.taeon_pet_body,left_ring="Varar Ring +1",
        back="Artio's Mantle",waist="Incarnation Sash",legs=gear.valorous_physical_pet_legs}
    -- MISSING: ammo Voluspa Tathlum
    -- MISSING: head Totemic Helm +1
    -- MISSING: right_ear Domesticator's Earring
    -- MISSING: hands Nukumi Manoplas +1
    -- MISSING: right_ring C. Palug Ring
    -- MISSING: feet Totemic Gaiters +1

    sets.midcast.Pet.Acc = set_combine(sets.midcast.Pet.WS, {})
    -- MISSING: main Kerehcatl
    -- MISSING: sub Hunahpu
    -- MISSING: head Totemic Helm +1
    -- MISSING: hands Regimen Mittens
                
    sets.midcast.Pet.MagicReady = {
        head="Gleti's Mask",neck="Adad Amulet",left_ear="Enmerkar Earring",
        body="Gleti's Cuirass",hands="Gleti's Gauntlets",left_ring="Varar Ring +1",right_ring="Varar Ring +1",
        back=gear.chr_jse_back,waist="Klouskap Sash +1",legs="Gleti's Breeches",feet="Gleti's Boots"}
    -- MISSING: ammo Voluspa Tathlum
    -- MISSING: right_ear Domesticator's Earring
        
    sets.midcast.Pet.DebuffReady = {
        head="Gleti's Mask",neck="Adad Amulet",left_ear="Enmerkar Earring",
        body="Gleti's Cuirass",hands="Gleti's Gauntlets",left_ring="Varar Ring +1",right_ring="Varar Ring +1",
        back=gear.chr_jse_back,waist="Klouskap Sash +1",legs="Gleti's Breeches",feet="Gleti's Boots"}
    -- MISSING: ammo Voluspa Tathlum
    -- MISSING: right_ear Crep. Earring
        
    sets.midcast.Pet.PhysicalDebuffReady = {
        head=gear.valorous_pet_head,neck="Adad Amulet",left_ear="Enmerkar Earring",
        body=gear.valorous_pet_body,left_ring="Varar Ring +1",right_ring="Varar Ring +1",
        back="Artio's Mantle",waist="Klouskap Sash +1",legs=gear.valorous_magical_pet_legs,feet=gear.valorous_magical_pet_feet}
    -- MISSING: ammo Voluspa Tathlum
    -- MISSING: right_ear Domesticator's Earring
    -- MISSING: hands Nukumi Manoplas +1

    sets.midcast.Pet.ReadyRecast = {legs="Gleti's Breeches"}
    -- MISSING: main Charmer's Merlin
    sets.midcast.Pet.ReadyRecastDW = {legs="Gleti's Breeches"}
    -- MISSING: sub Charmer's Merlin
    sets.midcast.Pet.Neutral = {}
    -- MISSING: head Totemic Helm +1
    sets.midcast.Pet.Favorable = {}
    -- MISSING: head Nukumi Cabasset
    sets.midcast.Pet.TPBonus = {}
    -- MISSING: hands Nukumi Manoplas +1

    -- RESTING
    sets.resting = {}

    sets.idle = {ammo="Staunch Tathlum +1",
        head="Gleti's Mask",neck="Loricate Torque +1",left_ear="Eabani Earring",right_ear="Etiolation Earring",
        body="Gleti's Cuirass",hands="Gleti's Gauntlets",left_ring="Defending Ring",right_ring="Karieyh Ring",
        back=gear.stp_jse_back,waist="Flume Belt +1",legs="Gleti's Breeches",feet="Gleti's Boots"}
        
    sets.idle.Refresh = {sub=gear.PDTMABKumbha,ammo="Staunch Tathlum +1",
        head="Jumalik Helm",neck="Loricate Torque +1",left_ear="Sanare Earring",right_ear="Genmei Earring",
        left_ring="Defending Ring",waist="Flume Belt +1"}
    -- MISSING: main Izizoeksi
    -- MISSING: body Jumalik Mail
    -- MISSING: hands Macabre Gaunt. +1
    -- MISSING: right_ring C. Palug Ring
    -- MISSING: back Solemnity Cape
    -- MISSING: legs Tali'ah Sera. +2
    -- MISSING: feet Skd. Jambeaux +1
        
    sets.idle.Reraise = set_combine(sets.idle, {})
    -- MISSING: head Twilight Helm
    -- MISSING: body Twilight Mail

    sets.idle.Pet = {sub=gear.PDTMABKumbha,
        neck="Loricate Torque +1",left_ear="Enmerkar Earring",right_ear="Handler's Earring +1",
        left_ring="Defending Ring",
        back="Artio's Mantle"}
    -- MISSING: main Izizoeksi
    -- MISSING: ammo Voluspa Tathlum
    -- MISSING: head Anwig Salade
    -- MISSING: body Tot. Jackcoat +3
    -- MISSING: hands Ankusa Gloves +1
    -- MISSING: right_ring C. Palug Ring
    -- MISSING: waist Isa Belt
    -- MISSING: legs Tali'ah Sera. +2
    -- MISSING: feet Ankusa Gaiters +3
        
    sets.idle.Pet.DW = {sub=gear.PDTMABKumbha}
    -- MISSING: main Izizoeksi

    sets.idle.Pet.Engaged = {sub=gear.PDTMABKumbha,
        neck="Shulmanu Collar",left_ear="Enmerkar Earring",right_ear="Handler's Earring +1",hands="Gleti's Gauntlets",left_ring="Defending Ring",
        back="Artio's Mantle"}
    -- MISSING: main Izizoeksi
    -- MISSING: ammo Voluspa Tathlum
    -- MISSING: head Anwig Salade
    -- MISSING: body Tot. Jackcoat +3
    -- MISSING: right_ring C. Palug Ring
    -- MISSING: waist Isa Belt
    -- MISSING: legs Tali'ah Sera. +2
    -- MISSING: feet Ankusa Gaiters +3

    sets.idle.Pet.Engaged.DW = {sub=gear.PDTMABKumbha,
        neck="Shulmanu Collar",left_ear="Enmerkar Earring",right_ear="Handler's Earring +1",left_ring="Defending Ring",
        back="Artio's Mantle"}
    -- MISSING: main Izizoeksi
    -- MISSING: ammo Voluspa Tathlum
    -- MISSING: head Anwig Salade
    -- MISSING: body Tot. Jackcoat +3
    -- MISSING: hands Ankusa Gloves +1
    -- MISSING: right_ring C. Palug Ring
    -- MISSING: waist Isa Belt
    -- MISSING: legs Tali'ah Sera. +2
    -- MISSING: feet Ankusa Gaiters +3

    -- DEFENSE SETS
    sets.defense.PDT = {ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Loricate Torque +1",left_ear="Sanare Earring",right_ear="Handler's Earring +1",
        left_ring="Defending Ring",waist="Flume Belt +1"}
    -- MISSING: body Jumalik Mail
    -- MISSING: hands Macabre Gaunt. +1
    -- MISSING: right_ring C. Palug Ring
    -- MISSING: back Moonlight Cape
    -- MISSING: legs Tali'ah Sera. +2
    -- MISSING: feet Nukumi Ocreae +1

    sets.defense.PetPDT = {
        neck="Loricate Torque +1",left_ear="Enmerkar Earring",right_ear="Handler's Earring +1",
        left_ring="Defending Ring"}
    -- MISSING: ammo Voluspa Tathlum
    -- MISSING: head Anwig Salade
    -- MISSING: body Tot. Jackcoat +3
    -- MISSING: hands Ankusa Gloves +1
    -- MISSING: right_ring C. Palug Ring
    -- MISSING: back Pastoralist's Mantle
    -- MISSING: waist Isa Belt
    -- MISSING: legs Tali'ah Sera. +2
    -- MISSING: feet Ankusa Gaiters +3

    sets.defense.PetMDT = {
        neck="Loricate Torque +1",left_ear="Enmerkar Earring",right_ear="Handler's Earring +1",
        left_ring="Defending Ring"}
    -- MISSING: ammo Voluspa Tathlum
    -- MISSING: head Anwig Salade
    -- MISSING: body Tot. Jackcoat +3
    -- MISSING: hands Ankusa Gloves +1
    -- MISSING: right_ring C. Palug Ring
    -- MISSING: back Pastoralist's Mantle
    -- MISSING: waist Isa Belt
    -- MISSING: legs Tali'ah Sera. +2
    -- MISSING: feet Ankusa Gaiters +3

    sets.defense.PetMEVA = sets.defense.PetMDT

    sets.defense.PKiller = set_combine(sets.defense.PDT, {})
    -- MISSING: body Nukumi Gausape +1
    sets.defense.Reraise = set_combine(sets.defense.PDT, {})
    -- MISSING: head Twilight Helm
    -- MISSING: body Twilight Mail

    sets.defense.MDT = {ammo="Staunch Tathlum +1",
        head="Nyame Helm",left_ear="Sanare Earring",right_ear="Etiolation Earring",
        left_ring="Defending Ring"}
    -- MISSING: neck Warder's Charm +1
    -- MISSING: body Jumalik Mail
    -- MISSING: hands Macabre Gaunt. +1
    -- MISSING: right_ring Shadow Ring
    -- MISSING: back Engulfer Cape +1
    -- MISSING: waist Engraved Belt
    -- MISSING: legs Tali'ah Sera. +2
    -- MISSING: feet Nukumi Ocreae +1

    sets.defense.MKiller = set_combine(sets.defense.MDT, {})
    -- MISSING: body Nukumi Gausape +1

    sets.defense.MEVA = {
        hands="Leyline Gloves",right_ring="Purity Ring"}
    -- MISSING: head Gavialis Helm
    -- MISSING: neck Warder's Charm +1
    -- MISSING: left_ear Sanare Earring
    -- MISSING: right_ear Etiolation Earring
    -- MISSING: body Jumalik Mail
    -- MISSING: left_ring Vengeful Ring
    -- MISSING: back Toro Cape
    -- MISSING: waist Engraved Belt
    -- MISSING: legs Flamma Dirs +2
    -- MISSING: feet Valorous Greaves

    sets.Kiting = {}
    sets.DayIdle = {}
    sets.NightIdle = {}

    -- MELEE (SINGLE-WIELD) SETS
    sets.engaged = {ammo="Ginsen",
        head=gear.taeon_head_tp,neck="Anu Torque",left_ear="Eabani Earring",right_ear="Sherida Earring",
        body="Malignance Tabard",hands="Malignance Gloves",left_ring="Chirich Ring +1",right_ring="Chirich Ring +1",
        back=gear.stp_jse_back,waist="Kentarch Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

    sets.engaged.Acc = {ammo="Falcon Eye",
        neck="Combatant's Torque",left_ear="Brutal Earring",
        body="Malignance Tabard",hands="Malignance Gloves",right_ring="Epona's Ring",
        legs="Malignance Tights",feet="Malignance Boots"}
    -- MISSING: head Malignance Chapeau
    -- MISSING: left_ear Mache Earring +1
    -- MISSING: left_ring Ramuh Ring +1
    -- MISSING: back Letalis Mantle
    -- MISSING: waist Olseni Belt

    -- MELEE (SINGLE-WIELD) HYBRID SETS
    sets.engaged.DT = {ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Loricate Torque +1",left_ear="Brutal Earring",right_ear="Sherida Earring",
        body="Jumalik Mail",hands="Buremte Gloves",left_ring="Defending Ring",waist="Flume Belt +1"}
    -- MISSING: right_ring Dark Ring
    -- MISSING: back Moonlight Cape
    -- MISSING: legs Meg. Chausses +2
    -- MISSING: feet Valorous Greaves

    sets.engaged.Acc.DT = {ammo="Falcon Eye",
        head=gear.valorous_wsd_head,neck="Loricate Torque +1",left_ear="Brutal Earring",right_ear="Sherida Earring",
        body="Jumalik Mail",hands="Buremte Gloves",left_ring="Defending Ring",waist="Flume Belt +1"}
    -- MISSING: right_ring Dark Ring
    -- MISSING: back Moonlight Cape
    -- MISSING: legs Meg. Chausses +2
    -- MISSING: feet Valorous Greaves

    -- MELEE (DUAL-WIELD) SETS FOR DNC AND NIN SUBJOB
    sets.engaged.DW = {ammo="Ginsen",
        head=gear.taeon_head_tp,neck="Anu Torque",left_ear="Eabani Earring",right_ear="Dedition Earring",
        body="Malignance Tabard",hands="Malignance Gloves",left_ring="Chirich Ring +1",right_ring="Chirich Ring +1",
        back=gear.stp_jse_back,waist="Kentarch Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

    sets.engaged.DW.DT = set_combine(sets.engaged.DT, {})
    -- MISSING: left_ear Dudgeon Earring
    -- MISSING: right_ear Heartseeker Earring

    sets.engaged.DW.Acc = {ammo="Falcon Eye",
        neck="Combatant's Torque",left_ear="Brutal Earring",
        body="Malignance Tabard",hands="Leyline Gloves",left_ring="Petrov Ring",right_ring="Epona's Ring",
        waist="Grunfeld Rope"}
    -- MISSING: head Meghanada Visor +2
    -- MISSING: left_ear Mache Earring +1
    -- MISSING: back Letalis Mantle
    -- MISSING: legs Flamma Dirs +2
    -- MISSING: feet Valorous Greaves

    sets.engaged.DW.Acc.DT = set_combine(sets.engaged.Acc.DT, {})
    -- MISSING: left_ear Dudgeon Earring
    -- MISSING: right_ear Heartseeker Earring

    -- GEARSETS FOR MASTER ENGAGED (SINGLE-WIELD) & PET ENGAGED
    sets.engaged.BothDD = set_combine(sets.engaged,{})
    sets.engaged.BothDD.Acc = set_combine(sets.engaged.Acc, {})

    -- GEARSETS FOR MASTER ENGAGED (SINGLE-WIELD) & PET TANKING
    sets.engaged.PetTank = set_combine(sets.engaged,{})
    sets.engaged.PetTank.Acc = set_combine(sets.engaged.Acc, {})

    -- GEARSETS FOR MASTER ENGAGED (DUAL-WIELD) & PET ENGAGED
    sets.engaged.DW.BothDD = set_combine(sets.engaged.DW,{})
    sets.engaged.DW.BothDD.Acc = set_combine(sets.engaged.DW.Acc, {})

    -- GEARSETS FOR MASTER ENGAGED (DUAL-WIELD) & PET TANKING
    sets.engaged.DW.PetTank = set_combine(sets.engaged.DW,{})
    sets.engaged.DW.PetTank.Acc = set_combine(sets.engaged.DW.Acc, {})

    sets.buff['Killer Instinct'] = {body="Nukumi Gausape +1"}
    sets.buff.Doom = set_combine(sets.buff.Doom, {})
    sets.buff.Sleep = {}
    -- MISSING: head Frenzy Sallet
    sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
    
    -- Weapons sets
    sets.weapons.Default = {sub=gear.PDTMABKumbha}
    -- MISSING: main Izizoeksi
    sets.weapons.DualWeapons = {}
    -- MISSING: main Izizoeksi
    -- MISSING: sub Hunahpu

-------------------------------------------------------------------------------------------------------------------
-- Complete Lvl 76-99 Jug Pet Precast List +Funguar +Courier +Amigo
-------------------------------------------------------------------------------------------------------------------

    sets.precast.JA['Bestial Loyalty'].FunguarFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Seedbed Soil"})
    sets.precast.JA['Bestial Loyalty'].CourierCarrie = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Fish Oil Broth"})
    sets.precast.JA['Bestial Loyalty'].AmigoSabotender = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Sun Water"})
    sets.precast.JA['Bestial Loyalty'].NurseryNazuna = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="D. Herbal Broth"})
    sets.precast.JA['Bestial Loyalty'].CraftyClyvonne = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Cng. Brain Broth"})
    sets.precast.JA['Bestial Loyalty'].PrestoJulio = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="C. Grass. Broth"})
    sets.precast.JA['Bestial Loyalty'].SwiftSieghard = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Mlw. Bird Broth"})
    sets.precast.JA['Bestial Loyalty'].MailbusterCetas = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Gob. Bug Broth"})
    sets.precast.JA['Bestial Loyalty'].AudaciousAnna = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="B. Carrion Broth"})
    sets.precast.JA['Bestial Loyalty'].TurbidToloi = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Auroral Broth"})
    sets.precast.JA['Bestial Loyalty'].LuckyLulush = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="L. Carrot Broth"})
    sets.precast.JA['Bestial Loyalty'].DipperYuly = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Wool Grease"})
    sets.precast.JA['Bestial Loyalty'].FlowerpotMerle = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Vermihumus"})
    sets.precast.JA['Bestial Loyalty'].DapperMac = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Briny Broth"})
    sets.precast.JA['Bestial Loyalty'].DiscreetLouise = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Deepbed Soil"})
    sets.precast.JA['Bestial Loyalty'].FatsoFargann = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="C. Plasma Broth"})
    sets.precast.JA['Bestial Loyalty'].FaithfulFalcorr = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Lucky Broth"})
    sets.precast.JA['Bestial Loyalty'].BugeyedBroncha = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Svg. Mole Broth"})
    sets.precast.JA['Bestial Loyalty'].BloodclawShasra = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Rzr. Brain Broth"})
    sets.precast.JA['Bestial Loyalty'].GorefangHobs = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="B. Carrion Broth"})
    sets.precast.JA['Bestial Loyalty'].GooeyGerard = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Cl. Wheat Broth"})
    sets.precast.JA['Bestial Loyalty'].CrudeRaphie = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Shadowy Broth"})

    -------------------------------------------------------------------------------------------------------------------
    -- Complete iLvl Jug Pet Precast List
    -------------------------------------------------------------------------------------------------------------------

    sets.precast.JA['Bestial Loyalty'].DroopyDortwin = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Swirling Broth"})
    sets.precast.JA['Bestial Loyalty'].PonderingPeter = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Vis. Broth"})
    sets.precast.JA['Bestial Loyalty'].SunburstMalfik = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Shimmering Broth"})
    sets.precast.JA['Bestial Loyalty'].AgedAngus = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Ferm. Broth"})
    sets.precast.JA['Bestial Loyalty'].WarlikePatrick = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Livid Broth"})
    sets.precast.JA['Bestial Loyalty'].ScissorlegXerin = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Spicy Broth"})
    sets.precast.JA['Bestial Loyalty'].BouncingBertha = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Bubbly Broth"})
    sets.precast.JA['Bestial Loyalty'].RhymingShizuna = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Lyrical Broth"})
    sets.precast.JA['Bestial Loyalty'].AttentiveIbuki = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Salubrious Broth"})
    sets.precast.JA['Bestial Loyalty'].SwoopingZhivago = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Windy Greens"})
    sets.precast.JA['Bestial Loyalty'].AmiableRoche = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Airy Broth"})
    sets.precast.JA['Bestial Loyalty'].HeraldHenry = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Trans. Broth"})
    sets.precast.JA['Bestial Loyalty'].BrainyWaluis = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Crumbly Soil"})
    sets.precast.JA['Bestial Loyalty'].HeadbreakerKen = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Blackwater Broth"})
    sets.precast.JA['Bestial Loyalty'].SuspiciousAlice = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Furious Broth"})
    sets.precast.JA['Bestial Loyalty'].AnklebiterJedd = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Crackling Broth"})
    sets.precast.JA['Bestial Loyalty'].FleetReinhard = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Rapid Broth"})
    sets.precast.JA['Bestial Loyalty'].CursedAnnabelle = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Creepy Broth"})
    sets.precast.JA['Bestial Loyalty'].SurgingStorm = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Insipid Broth"})
    sets.precast.JA['Bestial Loyalty'].SubmergedIyo = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Deepwater Broth"})
    sets.precast.JA['Bestial Loyalty'].RedolentCandi = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Electrified Broth"})
    sets.precast.JA['Bestial Loyalty'].AlluringHoney = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Bug-Ridden Broth"})
    sets.precast.JA['Bestial Loyalty'].CaringKiyomaro = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Fizzy Broth"})
    sets.precast.JA['Bestial Loyalty'].VivaciousVickie = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Tant. Broth"})
    sets.precast.JA['Bestial Loyalty'].HurlerPercival = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Pale Sap"})
    sets.precast.JA['Bestial Loyalty'].BlackbeardRandy = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Meaty Broth"})
    sets.precast.JA['Bestial Loyalty'].GenerousArthur = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Dire Broth"})
    sets.precast.JA['Bestial Loyalty'].ThreestarLynn = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Muddy Broth"})
    sets.precast.JA['Bestial Loyalty'].MosquitoFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Wetlands Broth"})
    sets.precast.JA['Bestial Loyalty']['Left-HandedYoko'] = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Heavenly Broth"})
    sets.precast.JA['Bestial Loyalty'].BraveHeroGlenn = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Wispy Broth"})
    sets.precast.JA['Bestial Loyalty'].SharpwitHermes = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Saline Broth"})
    sets.precast.JA['Bestial Loyalty'].ColibriFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Sugary Broth"})
    sets.precast.JA['Bestial Loyalty'].ChoralLeera = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Glazed Broth"})
    sets.precast.JA['Bestial Loyalty'].SpiderFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Sticky Webbing"})
    sets.precast.JA['Bestial Loyalty'].GussyHachirobe = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Slimy Webbing"})
    sets.precast.JA['Bestial Loyalty'].AcuexFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Poisonous Broth"})
    sets.precast.JA['Bestial Loyalty'].FluffyBredo = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Venomous Broth"})
    sets.precast.JA['Bestial Loyalty'].WeevilFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Pristine Sap"})
    sets.precast.JA['Bestial Loyalty'].StalwartAngelina = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="T. Pristine Sap"})
    sets.precast.JA['Bestial Loyalty'].SweetCaroline = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Aged Humus"})
    sets.precast.JA['Bestial Loyalty']['P.CrabFamiliar'] = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Rancid Broth"})
    sets.precast.JA['Bestial Loyalty'].JovialEdwin = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Pungent Broth"})
    sets.precast.JA['Bestial Loyalty']['Y.BeetleFamiliar'] = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Zestful Sap"})
    sets.precast.JA['Bestial Loyalty'].EnergizedSefina = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Gassy Sap"})
    sets.precast.JA['Bestial Loyalty'].LynxFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Frizzante Broth"})
    sets.precast.JA['Bestial Loyalty'].VivaciousGaston = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Spumante Broth"})
    sets.precast.JA['Bestial Loyalty']['Hip.Familiar'] = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Turpid Broth"})
    sets.precast.JA['Bestial Loyalty'].DaringRoland = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Feculent Broth"})
    sets.precast.JA['Bestial Loyalty'].SlimeFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Decaying Broth"})
    sets.precast.JA['Bestial Loyalty'].SultryPatrice = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Putrescent Broth"})
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(6, 16)
    elseif player.sub_job == 'NIN' then
        set_macro_page(4, 16)
    elseif player.sub_job == 'THF' then
        set_macro_page(6, 16)
    elseif player.sub_job == 'RUN' then
        set_macro_page(6, 16)
    else
        set_macro_page(6, 16)
    end
end
