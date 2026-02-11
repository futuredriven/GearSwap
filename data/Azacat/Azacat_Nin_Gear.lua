-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
	state.OffenseMode:options('Normal')
	state.HybridMode:options('Normal','DT')
	state.RangedMode:options('Normal','Acc')
	state.WeaponskillMode:options('Match','Proc')
	state.CastingMode:options('Normal','Proc','Resistant')
	state.IdleMode:options('Normal','Sphere')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Savage','Evisceration','ProcDagger','ProcSword','ProcGreatSword','ProcScythe','ProcPolearm','ProcGreatKatana','ProcKatana','ProcClub','ProcStaff')

	state.WeaponSets:options('Default','Proc')

	weapon_sets = {
		['Default'] = {'Savage','Evisceration',},
		['Proc'] = {'ProcDagger','ProcSword','ProcGreatSword','ProcScythe','ProcPolearm','ProcGreatKatana','ProcKatana','ProcClub','ProcStaff'},
	}

	autows_list = {['Savage']='Savage Blade',['Evisceration']='Evisceration',['ProcDagger']='Cyclone',['ProcSword']='Red Lotus Blade',['ProcGreatSword']='Freezebite',['ProcScythe']='Shadow of Death',['ProcPolearm']='Raiden Thrust',['ProcGreatKatana']='Tachi: Koki',['ProcKatana']='Blade: Ei',['ProcClub']='Seraph Strike',['ProcStaff']='Earth Crusher',}

	send_command('bind ^` input /ja "Innin" <me>')
	send_command('bind !` input /ja "Yonin" <me>')
	send_command('bind @` gs c cycle Stance')

	utsusemi_cancel_delay = .3
	utsusemi_ni_cancel_delay = .06

	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Weapons sets
	sets.weapons.Savage = {}
	sets.weapons.Evisceration = {}
	sets.weapons.ProcDagger = {}
	sets.weapons.ProcSword = {}
	sets.weapons.ProcGreatSword = {}
	sets.weapons.ProcScythe = {}
	sets.weapons.ProcPolearm = {}
	sets.weapons.ProcKatana = {}
	sets.weapons.ProcGreatKatana = {}
	sets.weapons.ProcClub = {}
	sets.weapons.ProcStaff = {}

	--------------------------------------
	-- Precast sets
	--------------------------------------

	sets.Enmity = {}

	-- Precast sets to enhance JAs
	sets.precast.JA['Mijin Gakure'] = {} --legs="Mochizuki Hakama",--main="Nagi"
	sets.precast.JA['Futae'] = {}
	sets.precast.JA['Sange'] = {} --body="Mochizuki Chainmail"
	sets.precast.JA['Provoke'] = sets.Enmity
	sets.precast.JA['Warcry'] = sets.Enmity

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Set for acc on steps, since Yonin drops acc a fair bit
	sets.precast.Step = {}

	sets.precast.JA['Violent Flourish'] = {}

	-- Fast cast sets for spells

	sets.precast.FC = {}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})

	-- Snapshot for ranged
	sets.precast.RA = {}
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {}

	sets.precast.WS.Proc = {}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}

	--------------------------------------
	-- Midcast sets
	--------------------------------------

	sets.midcast.FastRecast = {}

	sets.midcast.ElementalNinjutsu = {}

	sets.midcast.ElementalNinjutsu.Proc = sets.midcast.FastRecast

	sets.midcast.ElementalNinjutsu.Resistant = set_combine(sets.midcast.ElementalNinjutsu, {})

	sets.MagicBurst = {}

	sets.midcast.NinjutsuDebuff = {}

	sets.midcast.NinjutsuBuff = set_combine(sets.midcast.FastRecast, {})

	sets.midcast.Utsusemi = set_combine(sets.midcast.NinjutsuBuff, {})

	sets.midcast.RA = {}

	sets.midcast.RA.Acc = {}

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Resting sets
	sets.resting = {}

	-- Idle sets
	sets.idle = {}

	sets.idle.Sphere = set_combine(sets.idle, {body="Mekosu. Harness"})

	sets.defense.PDT = {}

	sets.defense.MDT = {}

	sets.defense.MEVA = {}


	sets.Kiting = {}
	sets.DuskKiting = {}
	sets.DuskIdle = {}
	sets.DayIdle = {}
	sets.NightIdle = {}


	--------------------------------------
	-- Engaged sets
	--------------------------------------

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
	sets.engaged = {}

	sets.engaged.DT = {}

	--------------------------------------
	-- Custom buff sets
	--------------------------------------

	sets.buff.Migawari = {} --body="Hattori Ningi +1"
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Futae = {}
	sets.buff.Yonin = {} --legs="Hattori Hakama +1"
	sets.buff.Innin = {} --head="Hattori Zukin +1"

	-- Extra Melee sets.  Apply these on top of melee sets.
	sets.Knockback = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Skillchain = {}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'WAR' then
		set_macro_page(1, 17)
	elseif player.sub_job == 'RNG' then
		set_macro_page(1, 12)
	elseif player.sub_job == 'RDM' then
		set_macro_page(1, 12)
	else
		set_macro_page(1, 12)
	end
end
