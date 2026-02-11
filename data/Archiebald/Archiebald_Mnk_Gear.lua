function user_job_setup()
	-- Options: Override default values
	state.OffenseMode:options('Normal','Acc','FullAcc')
	state.WeaponskillMode:options('Match','Normal','Acc','FullAcc')
	state.HybridMode:options('Normal', 'PDT')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Godhands','Staff','Barehanded')

	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None'}

	update_melee_groups()

	-- Reforged Gear
	gear.artifact_body = "Anch. Cyclas +2"
	gear.artifact_feet = "Anch. Gaiters +3"
	gear.relic_head = "Hes. Crown"
	gear.relic_body = "Hes. Cyclas"
	gear.relic_hands = "Hes. Gloves +3"
	gear.relic_legs = "Hes. Hose +3"
	gear.relic_feet = "Hes. Gaiters +3"
	gear.empyrean_head = "Bhikku Crown +2"
	gear.empyrean_body = "Bhikku Cyclas +2"
	gear.empyrean_legs = "Bhikku Hose +2"
	gear.tp_jse_back = { name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Magic dmg. taken-10%',}}
	gear.fc_jse_back = { name="Segomo's Mantle", augments={'HP+60','HP+20','"Fast Cast"+10',}}
	gear.ws_jse_back = { name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10','Damage taken-5%',}}
	gear.tp_engaged_jse_back = { name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Magic dmg. taken-10%',}}

	-- Additional local binds
	send_command('bind ^` input /ja "Boost" <me>')
	send_command('bind !` input /ja "Perfect Counter" <me>')
	send_command('bind ^backspace input /ja "Mantra" <me>')
	send_command('bind @` gs c cycle SkillchainMode')

	select_default_macro_book()
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Precast Sets

	-- Precast sets to enhance JAs on use
	sets.precast.JA['Hundred Fists'] = {legs=gear.relic_legs}
	sets.precast.JA['Boost'] = {} --hands="Anchorite's Gloves +1"
	sets.precast.JA['Boost'].OutOfCombat = {} --hands="Anchorite's Gloves +1", Remove Haste and Add Slow Gear.
	sets.precast.JA['Dodge'] = {feet=gear.artifact_feet}
	sets.precast.JA['Focus'] = {head=gear.empyrean_head}
	sets.precast.JA['Counterstance'] = {} --feet="Hesychast's Gaiters +1"
	sets.precast.JA['Footwork'] = {feet=gear.artifact_feet}
	sets.precast.JA['Formless Strikes'] = {body=gear.relic_body}
	sets.precast.JA['Mantra'] = {feet=gear.relic_feet}
	sets.precast.JA['Chi Blast'] = {head=gear.relic_head}

	sets.precast.JA['Chakra'] = {
		body=gear.artifact_body,hands=gear.relic_hands,
		legs={ name="Nyame Flanchard", augments={'Path: B',}},feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck={ name="Unmoving Collar +1", augments={'Path: A',}},waist="Engraved Belt",
		ear1="Handler's Earring +1",ear2="Tuisto Earring",ring1="Regal Ring",ring2={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back=gear.tp_jse_back,
	}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head="Malignance Chapeau",neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},ear1="Mache Earring +1",ear2="Telos Earring",
		body={ name="Mpaca's Doublet", augments={'Path: A',}},hands=gear.relic_hands,ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back=gear.tp_jse_back,waist="Olseni Belt",legs="Mummu Kecks +2",feet="Malignance Boots"}

	sets.precast.Flourish1 = {ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head="Malignance Chapeau",neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},ear1="Mache Earring +1",ear2="Telos Earring",
		body={ name="Mpaca's Doublet", augments={'Path: A',}},hands=gear.relic_hands,ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back=gear.tp_jse_back,waist="Olseni Belt",legs="Mummu Kecks +2",feet="Malignance Boots"}

	-- Fast cast sets for spells
	sets.precast.FC = {
		ammo="Sapience Orb",
		head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+21','"Fast Cast"+6',}},body={ name="Taeon Tabard", augments={'"Fast Cast"+5','HP+47',}},
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs={ name="Herculean Trousers", augments={'Mag. Acc.+17','"Fast Cast"+6','STR+9',}},feet={ name="Herculean Boots", augments={'"Fast Cast"+6',}},
		neck="Orunmila's Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",ring1="Prolix Ring",ring2="Rahab Ring",
		back=gear.fc_jse_back,
	}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck={ name="Bathy Choker +1", augments={'Path: A',}},body="Passion Jacket"})

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},neck="Fotia Gorget",ear1="Sherida Earring",ear2={ name="Schere Earring", augments={'Path: A',}},
		body="Mpaca's Doublet",hands={ name="Ryuo Tekko +1", augments={'STR+12','DEX+12','Accuracy+20',}},ring1="Gere Ring",ring2="Niqmaddu Ring",
		back=gear.ws_jse_back,waist="Moonbow Belt +1",legs={ name="Mpaca's Hose", augments={'Path: A',}},feet="Herculean Boots"}
	sets.precast.WSAcc = {}
	sets.precast.WSFullAcc = {}
	sets.precast.WS.Acc = set_combine(sets.precast.WS, sets.precast.WSAcc)
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, sets.precast.WSFullAcc)

	-- Specific weaponskill sets.
	sets.precast.WS['Shell Crusher']   = set_combine(sets.precast.WS, {waist="Grunfeld Rope"})
	sets.precast.WS['Raging Fists']    = {head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",feet="Herculean Boots"}
	sets.precast.WS['Howling Fist']    = {head="Mpaca's Cap",hands="Herculean Gloves",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Schere Earring",feet="Herculean Boots"}
	sets.precast.WS['Asuran Fists']    = set_combine(sets.precast.WS, {})
	sets.precast.WS["Ascetic's Fury"]  = set_combine(sets.precast.WS, {})
	sets.precast.WS["Victory Smite"]   = {head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},body=gear.empyrean_body,hands={ name="Ryuo Tekko +1", augments={'STR+12','DEX+12','Accuracy+20',}},legs={ name="Mpaca's Hose", augments={'Path: A',}},feet="Herculean Boots",neck="Fotia Gorget",ear2={ name="Schere Earring", augments={'Path: A',}}}
	sets.precast.WS['Shijin Spiral']   = {back=gear.tp_jse_back}
	sets.precast.WS['Dragon Kick']     = {ammo="Crepuscular Pebble",head="Mpaca's Cap",body="Mpaca's Doublet",hands={ name="Ryuo Tekko +1", augments={'STR+12','DEX+12','Accuracy+20',}},legs=gear.relic_legs,feet=gear.artifact_feet,neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},waist="Moonbow Belt +1",ear1="Sherida Earring",ear2={ name="Schere Earring", augments={'Path: A',}},ring1="Gere Ring",back=gear.ws_jse_back}
	sets.precast.WS['Tornado Kick']    = set_combine(sets.precast.WS['Dragon Kick'], {})
	sets.precast.WS['Spinning Attack'] = set_combine(sets.precast.WS, {})

	sets.precast.WS["Raging Fists"].Acc = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSAcc)
	sets.precast.WS["Howling Fist"].Acc = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSAcc)
	sets.precast.WS["Asuran Fists"].Acc = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSAcc)
	sets.precast.WS["Ascetic's Fury"].Acc = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSAcc, {head="Mummu Bonnet +1",body="Mummu Jacket +2",hands={ name="Ryuo Tekko +1", augments={'STR+12','DEX+12','Accuracy+20',}},ring2="Chirich Ring +1",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS["Victory Smite"].Acc = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSAcc, {head="Mummu Bonnet +1",ear2="Moonshade Earring",body="Mummu Jacket +2",hands={ name="Ryuo Tekko +1", augments={'STR+12','DEX+12','Accuracy+20',}},ring2="Chirich Ring +1",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS["Shijin Spiral"].Acc = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSAcc)
	sets.precast.WS["Dragon Kick"].Acc = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSAcc)
	sets.precast.WS["Tornado Kick"].Acc = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSAcc)

	sets.precast.WS["Raging Fists"].FullAcc = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSFullAcc)
	sets.precast.WS["Howling Fist"].FullAcc = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSFullAcc)
	sets.precast.WS["Asuran Fists"].FullAcc = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSFullAcc)
	sets.precast.WS["Ascetic's Fury"].FullAcc = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSFullAcc, {head="Mummu Bonnet +1",body="Mummu Jacket +2",hands={ name="Ryuo Tekko +1", augments={'STR+12','DEX+12','Accuracy+20',}},legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS["Victory Smite"].FullAcc = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSFullAcc, {head="Mummu Bonnet +1",body="Mummu Jacket +2",hands={ name="Ryuo Tekko +1", augments={'STR+12','DEX+12','Accuracy+20',}},legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS["Shijin Spiral"].FullAcc = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSFullAcc)
	sets.precast.WS["Dragon Kick"].FullAcc = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSFullAcc)
	sets.precast.WS["Tornado Kick"].FullAcc = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSFullAcc)

	sets.precast.WS['Cataclysm'] = {neck="Baetyl Pendant",ear1="Friomisi Earring",hands={ name="Ryuo Tekko +1", augments={'STR+12','DEX+12','Accuracy+20',}},ring1="Gere Ring",back="Toro Cape"}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Sherida Earring",ear2="Brutal Earring",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}

	-- Midcast Sets
	sets.midcast.FastRecast = sets.precast.FC

	-- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back=gear.fc_jse_back})

	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = set_combine(sets.idle, {})

	-- Idle sets
	sets.idle = {ammo="Staunch Tathlum +1",
		hands={ name="Mpaca's Gloves", augments={'Path: A',}},legs={ name="Mpaca's Hose", augments={'Path: A',}},feet={ name="Mpaca's Boots", augments={'Path: A',}},
		neck={ name="Bathy Choker +1", augments={'Path: A',}},ear1="Infused Earring",ear2={ name="Odnowa Earring +1", augments={'Path: A',}},
		ring1="Chirich Ring +1",ring2="Karieyh Ring",back=gear.tp_jse_back}

	-- Defense sets
	sets.defense.PDT = {ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck={ name="Warder's Charm +1", augments={'Path: A',}},ear1="Tuisto Earring",ear2={ name="Odnowa Earring +1", augments={'Path: A',}},
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back=gear.tp_jse_back,waist="Engraved Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.defense.MDT = sets.defense.PDT

	sets.defense.MEVA = {ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back=gear.tp_jse_back,waist="Engraved Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.Kiting = {feet="Malignance Boots"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee sets
	sets.engaged = {ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},ear1="Sherida Earring",ear2="Telos Earring",
		body=gear.empyrean_body,hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},ring1="Gere Ring",ring2="Niqmaddu Ring",
		back=gear.tp_engaged_jse_back,waist="Moonbow Belt +1",legs=gear.relic_legs,feet=gear.artifact_feet}
	sets.engaged.Acc = {ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},ear1="Mache Earring +1",ear2="Mache Earring +1",
		body=gear.empyrean_body,hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.tp_engaged_jse_back,waist="Moonbow Belt +1",legs=gear.relic_legs,feet=gear.artifact_feet}
	sets.engaged.FullAcc = set_combine(sets.engaged.Acc, {})

	-- Defensive melee hybrid sets
	sets.engaged.PDT = {ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head=gear.empyrean_head,neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},ear1="Sherida Earring",ear2={ name="Schere Earring", augments={'Path: A',}},
		body={ name="Mpaca's Doublet", augments={'Path: A',}},hands={ name="Mpaca's Gloves", augments={'Path: A',}},ring1="Gere Ring",ring2="Niqmaddu Ring",
		back=gear.tp_engaged_jse_back,waist="Moonbow Belt +1",legs=gear.empyrean_legs,feet={ name="Mpaca's Boots", augments={'Path: A',}}}
	sets.engaged.Acc.PDT = set_combine(sets.engaged.PDT, {})
	sets.engaged.FullAcc.PDT = set_combine(sets.engaged.PDT, {})

	-- Hundred Fists/Impetus melee set mods

	sets.engaged.HF = set_combine(sets.engaged, {})
	sets.engaged.Acc.HF = set_combine(sets.engaged.Acc, {})
	sets.engaged.FullAcc.HF = set_combine(sets.engaged.FullAcc, {})

	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff.Impetus = {body=gear.empyrean_body}
	sets.buff.Footwork = {feet=gear.artifact_feet}
	sets.buff.Boost = {} --waist="Ask Sash"

	sets.FootworkWS = {feet=gear.artifact_feet}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.Knockback = {}
	sets.TreasureHunter = {ammo="Per. Lucky Egg",waist="Chaac Belt"}
	sets.Skillchain = {legs={ name="Mpaca's Hose", augments={'Path: A',}}}

	-- Weapons sets
	sets.weapons.Godhands = {main="Godhands"}
	sets.weapons.Barehanded = {main=empty}
	sets.weapons.Staff = {main="Malignance Pole"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(5, 20)
	elseif player.sub_job == 'NIN' then
		set_macro_page(4, 20)
	elseif player.sub_job == 'THF' then
		set_macro_page(6, 20)
	elseif player.sub_job == 'RUN' then
		set_macro_page(7, 20)
	else
		set_macro_page(6, 20)
	end
end