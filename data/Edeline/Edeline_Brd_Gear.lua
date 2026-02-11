function user_job_setup()
	-- Options: Override default values
	state.OffenseMode:options('Normal','Acc')
	state.HybridMode:options('Normal','DT')
	state.CastingMode:options('Normal','Resistant','AoE')
	state.IdleMode:options('Normal','NoRefresh','DT')
	state.Weapons:options('None','Naegling','Aeneas','DualWeapons','DualNaegling','DualTauret','DualAeolian')

	gear.melee_jse_back = {name="Intarabus's Cape",augments={'Accuracy+20 Attack+20'}}
	gear.magic_jse_back = {name="Intarabus's Cape",augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}}

	info.ExtraSongInstrument = 'Blurred Harp +1'
	-- How many extra songs we can keep from Daurdabla/Terpander
	info.ExtraSongs = 1
	
	-- Set this to false if you don't want to use custom timers.
	state.UseCustomTimers = M(false, 'Use Custom Timers')
	
	-- Additional local binds
	send_command('bind ^` gs c cycle ExtraSongsMode')
	send_command('bind !` input /ma "Chocobo Mazurka" <me>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !f7 gs c cycle CarnMode')

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Weapons sets
	sets.weapons.Aeneas = {}
	sets.weapons.DualWeapons = {}
	sets.weapons.DualNaegling = {}
	sets.weapons.Naegling = {}
	sets.weapons.DualTauret = {}
	sets.weapons.DualAeolian = {}

	sets.buff.Sublimation = {}
	sets.buff.DTSublimation = {}
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {}
		
	sets.precast.FC.DT = {}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {feet="Vanya Clogs"})

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})
	
	sets.precast.FC.BardSong = {}

	sets.precast.FC.SongDebuff = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC.SongDebuff.Resistant = set_combine(sets.precast.FC.BardSong,{range="Blurred Harp +1"})
	sets.precast.FC.Lullaby = {}
	sets.precast.FC.Lullaby.Resistant = {}
	sets.precast.FC['Horde Lullaby'] = {}
	sets.precast.FC['Horde Lullaby'].Resistant = {}
	sets.precast.FC['Horde Lullaby'].AoE = {}
	sets.precast.FC['Horde Lullaby II'] = {}
	sets.precast.FC['Horde Lullaby II'].Resistant = {}
	sets.precast.FC['Horde Lullaby II'].AoE = {}
		
	sets.precast.FC.Mazurka = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})

	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
	sets.precast.DaurdablaDummy = sets.precast.FC.Daurdabla
		
	-- Precast sets to enhance JAs
	
	sets.precast.JA.Nightingale = {}
	sets.precast.JA.Troubadour = {}
	sets.precast.JA['Soul Voice'] = {}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {}
		
	sets.precast.WS.Acc = {}
		
	sets.precast.WS['Savage Blade'] = {}
		
	sets.precast.WS['Aeolian Edge'] = {}
		
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = {}

	-- Gear to enhance certain classes of songs
	sets.midcast.Ballad = {}
	sets.midcast.Lullaby = {}
	sets.midcast.Lullaby.Resistant = {}
	sets.midcast['Horde Lullaby'] = {}
	sets.midcast['Horde Lullaby'].Resistant = {}
	sets.midcast['Horde Lullaby'].AoE = {}
	sets.midcast['Horde Lullaby II'] = {}
	sets.midcast['Horde Lullaby II'].Resistant = {}
	sets.midcast['Horde Lullaby II'].AoE = {}
	sets.midcast.Madrigal = {}
	sets.midcast.Paeon = {}
	sets.midcast.March = {}
	sets.midcast['Honor March'] = set_combine(sets.midcast.March,{range="Marsyas"})
	sets.midcast.Minuet = {}
	sets.midcast.Minne = {}
	sets.midcast.Threnody = {}
	sets.midcast.Carol = {}
	sets.midcast["Sentinel's Scherzo"] = {}
	sets.midcast['Magic Finale'] = {}
	sets.midcast.Mazurka = {}
	
	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = {}
		
	sets.midcast.SongEffect.DW = {} --Only weapons in this set. This set is overlayed onto  SongEffect

	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {}
		
	sets.midcast.SongDebuff.DW = {} --Only weapons in this set. This set is overlayed onto  SongDebuff

	-- For song debuffs (accuracy primary, duration secondary)
	sets.midcast.SongDebuff.Resistant = {}

	-- Song-specific recast reduction
	sets.midcast.SongRecast = {}

	-- Cast spell with normal gear, except using Daurdabla instead
	sets.midcast.Daurdabla = {}

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
	sets.midcast.DaurdablaDummy = set_combine(sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

	-- Other general spells and classes.
	sets.midcast.Cure = {}
		
	sets.midcast.Curaga = sets.midcast.Cure
		
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}
		
	sets.midcast['Enhancing Magic'] = {}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
		
	sets.midcast['Elemental Magic'] = {}
		
	sets.midcast['Elemental Magic'].Resistant = {}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",hands="Hieros Mittens",
		back="Oretan. Cape +1",ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt",feet="Vanya Clogs"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,sub="Clemency Grip"})

	-- Resting sets
	sets.resting = {}
	
	sets.idle = {}
		
	sets.idle.NoRefresh = {}

	sets.idle.DT = {}
	
	-- Defense sets

	sets.defense.PDT = {}

	sets.defense.MDT = {}

	sets.Kiting = {}
	sets.latent_refresh = {}
	sets.latent_refresh_grip = {}
	sets.TPEat = {}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.engaged = {}
	sets.engaged.DT = {}
	sets.engaged.Acc = {}
	sets.engaged.DW = {}
	sets.engaged.DW.DT = {}
	sets.engaged.DW.Acc = {}
	sets.engaged.DW.Acc.DT = {}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(10, 10)
end

autows_list = {['Naegling']='Savage Blade',['Aeneas']="Rudra's Storm",['DualWeapons']="Rudra's Storm",['DualNaegling']='Savage Blade',['DualTauret']='Evisceration',
	 ['DualAeolian']='Aeolian Edge'}
