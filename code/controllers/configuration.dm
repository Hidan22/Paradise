/datum/configuration
	var/server_name = null				// server name (for world name / status)
	var/server_tag_line = null			// server tagline (for showing on hub entry)
	var/server_extra_features = null		// server-specific extra features (for hub entry)
	var/server_suffix = 0				// generate numeric suffix based on server port

	var/minimum_client_build = 1421		// Build 1421 due to the middle mouse button exploit

	var/minimum_byondacc_age = 0

	var/nudge_script_path = "nudge.py"  // where the nudge.py script is located

	var/twitch_censor = FALSE
	var/list/twich_censor_list = list()
	var/list/topic_filtering_whitelist = list()

	var/log_ooc = 0						// log OOC channel
	var/log_access = 0					// log login/logout
	var/log_say = 0						// log client say
	var/log_admin = 0					// log admin actions
	var/log_debug = 1					// log debug output
	var/log_game = 0					// log game events
	var/log_vote = 0					// log voting
	var/log_whisper = 0					// log client whisper
	var/log_emote = 0					// log emotes
	var/log_attack = 0					// log attack messages
	var/log_conversion = 0				// log conversion mob
	var/log_adminchat = 0				// log admin chat messages
	var/log_adminwarn = 0				// log warnings admins get about bomb construction and such
	var/log_pda = 0						// log pda messages
	var/log_world_output = 0			// log world.log << messages
	var/log_runtimes = 0                // logs world.log to a file
	var/disable_root_log = 0			// disable writing world.log to log panel / root logger of DreamDaemon
	var/log_hrefs = 0					// logs all links clicked in-game. Could be used for debugging and tracking down exploits
	var/log_timers_on_bucket_reset = 0  // logs all timers in buckets on automatic bucket reset (Useful for timer debugging)
	var/sql_enabled = 0					// for sql switching
	var/allow_admin_ooccolor = 0		// Allows admins with relevant permissions to have their own ooc colour
	var/pregame_timestart = 240			// Time it takes for the server to start the game
	var/allow_vote_restart = 0 			// allow votes to restart
	var/allow_vote_mode = 0				// allow votes to change mode
	var/vote_delay = 6000				// minimum time between voting sessions (deciseconds, 10 minute default)
	var/vote_period = 600				// length of voting period (deciseconds, default 1 minute)
	var/vote_autotransfer_initial = 72000 // Length of time before the first autotransfer vote is called
	var/vote_autotransfer_interval = 18000 // length of time before next sequential autotransfer vote
	var/vote_no_default = 0				// vote does not default to nochange/norestart (tbi)
	var/vote_no_dead = 0				// dead people can't vote (tbi)
//	var/enable_authentication = 0		// goon authentication
	var/del_new_on_log = 1				// qdel's new players if they log before they spawn in
	var/feature_object_spell_system = 0 //spawns a spellbook which gives object-type spells instead of verb-type spells for the wizard
	var/traitor_scaling = 0 			//if amount of traitors scales based on amount of players
	var/protect_roles_from_antagonist = 0// If security and such can be tratior/cult/other
	var/continuous_rounds = 0			// Gamemodes which end instantly will instead keep on going until the round ends by escape shuttle or nuke.
	var/allow_Metadata = 0				// Metadata is supported.
	var/popup_admin_pm = 0				//adminPMs to non-admins show in a pop-up 'reply' window when set to 1.
	var/Ticklag = 0.5
	var/clientfps = 65					// Default fps for clients with "0" in prefs. -1 for synced with server.
	var/socket_talk	= 0					// use socket_talk to communicate with other processes
	var/list/resource_urls = null
	var/antag_hud_allowed = 0      // Ghosts can turn on Antagovision to see a HUD of who is the bad guys this round.
	var/antag_hud_restricted = 0                    // Ghosts that turn on Antagovision cannot rejoin the round.
	var/list/mode_names = list()
	var/list/modes = list()				// allowed modes
	var/list/votable_modes = list()		// votable modes
	var/list/probabilities = list()		// relative probability of each mode
	var/list/mode_required_players = list()		// relative required_players of each mode
	var/humans_need_surnames = 0
	var/allow_random_events = 0			// enables random events mid-round when set to 1
	var/allow_ai = 1					// allow ai job
	var/respawn = 0
	var/guest_jobban = 1
	var/panic_bunker_threshold = 150	// above this player count threshold, never-before-seen players are blocked from connecting
	var/usewhitelist = 0
	var/usewhitelist_database = 0
	var/usewhitelist_nojobbanned = FALSE
	var/mods_are_mentors = 0
	var/load_jobs_from_txt = 0
	var/automute_on = 0					//enables automuting/spam prevention
	var/jobs_have_minimal_access = 0	//determines whether jobs use minimal access or expanded access.
	var/round_abandon_penalty_period = 30 MINUTES // Time from round start during which ghosting out is penalized
	var/medal_hub_address = null
	var/medal_hub_password = null

	var/reactionary_explosions = 0 //If we use reactionary explosions, explosions that react to walls and doors

	var/assistantlimit = 0 //enables assistant limiting
	var/assistantratio = 2 //how many assistants to security members

	// The AFK subsystem will not be activated if any of the below config values are equal or less than 0
	var/warn_afk_minimum = 0 // How long till you get a warning while being AFK
	var/auto_cryo_afk = 0 // How long till you get put into cryo when you're AFK
	var/auto_despawn_afk = 0 // How long till you actually despawn in cryo when you're AFK (Not ssd so not automatic)

	var/auto_cryo_ssd_mins = 0
	var/ssd_warning = 0

	var/list_afk_minimum = 5 // How long people have to be AFK before it's listed on the "List AFK players" verb

	var/traitor_objectives_amount = 2
	var/shadowling_max_age = 0

	var/max_maint_drones = 5				//This many drones can spawn,
	var/allow_drone_spawn = 1				//assuming the admin allow them to.
	var/drone_build_time = 1200				//A drone will become available every X ticks since last drone spawn. Default is 2 minutes.

	var/usealienwhitelist = 0
	var/limitalienplayers = 0
	var/alien_to_human_ratio = 0.5

	var/server
	var/banappeals
	var/wikiurl = "http://example.org"
	var/forumurl = "http://example.org"
	var/rulesurl = "http://example.org"
	var/githuburl = "http://example.org"
	var/donationsurl = "http://example.org"
	var/repositoryurl = "http://example.org"
	var/discordurl = "http://example.org"
	var/discordforumurl = "http://example.org"
	var/discordbugreporturl = "http://example.org"

	var/overflow_server_url
	var/tutorial_server_url
	var/forbid_singulo_possession = 0

	var/check_randomizer = 0
	var/proxy_autoban = 0

	//game_options.txt configs

	var/bones_can_break = 1

	var/revival_pod_plants = 1
	var/revival_cloning = 1
	var/revival_brain_life = -1

	var/auto_toggle_ooc_during_round = 0

	var/shuttle_refuel_delay = 12000

	//Used for modifying movement speed for mobs.
	//Unversal modifiers
	var/run_speed = 0
	var/walk_speed = 0

	//Mob specific modifiers. NOTE: These will affect different mob types in different ways
	var/human_delay = 0
	var/robot_delay = 0
	var/monkey_delay = 0
	var/alien_delay = 0
	var/slime_delay = 0
	var/animal_delay = 0

	//IP Intel vars
	var/ipintel_email
	var/ipintel_rating_bad = 1
	var/ipintel_save_good = 12
	var/ipintel_save_bad = 1
	var/ipintel_domain = "check.getipintel.net"
	var/ipintel_maxplaytime = 0
	var/ipintel_whitelist = 0
	var/ipintel_detailsurl = "https://iphub.info/?ip="

	var/forum_link_url
	var/forum_playerinfo_url

	var/admin_legacy_system = 0	//Defines whether the server uses the legacy admin system with admins.txt or the SQL system. Config option in config.txt
	var/ban_legacy_system = 0	//Defines whether the server uses the legacy banning system with the files in /data or the SQL system. Config option in config.txt
	var/use_age_restriction_for_jobs = 0 //Do jobs use account age restrictions? --requires database
	var/use_age_restriction_for_antags = 0 //Do antags use account age restrictions? --requires database

	var/use_exp_tracking = 0
	var/use_exp_restrictions = 0
	var/use_exp_restrictions_admin_bypass = 0

	var/simultaneous_pm_warning_timeout = 100

	var/assistant_maint = 0 //Do assistants get maint access?
	var/gateway_delay = 6000
	var/ghost_interaction = 0

	var/comms_password = ""

	var/default_laws = 0 //Controls what laws the AI spawns with.

	var/list/station_levels = list(1)				// Defines which Z-levels the station exists on.
	var/list/admin_levels= list(2)					// Defines which Z-levels which are for admin functionality, for example including such areas as Central Command and the Syndicate Shuttle
	var/list/contact_levels = list(1, 5)			// Defines which Z-levels which, for example, a Code Red announcement may affect
	var/list/player_levels = list(1, 3, 4, 5, 6, 7)	// Defines all Z-levels a character can typically reach

	var/const/minutes_to_ticks = 60 * 10
	// Event settings
	var/expected_round_length = 60 * 2 * minutes_to_ticks // 2 hours
	// If the first delay has a custom start time
	// No custom time, no custom time, between 80 to 100 minutes respectively.
	var/list/event_first_run   = list(EVENT_LEVEL_MUNDANE = null, 	EVENT_LEVEL_MODERATE = null,	EVENT_LEVEL_MAJOR = list("lower" = 48000, "upper" = 60000))
	// The lowest delay until next event
	// 10, 30, 50 minutes respectively
	var/list/event_delay_lower = list(EVENT_LEVEL_MUNDANE = 6000,	EVENT_LEVEL_MODERATE = 18000,	EVENT_LEVEL_MAJOR = 30000)
	// The upper delay until next event
	// 15, 45, 70 minutes respectively
	var/list/event_delay_upper = list(EVENT_LEVEL_MUNDANE = 9000,	EVENT_LEVEL_MODERATE = 27000,	EVENT_LEVEL_MAJOR = 42000)

	var/starlight = 0	// Whether space turfs have ambient light or not
	var/allow_holidays = 0
	var/player_overflow_cap = 0 //number of players before the server starts rerouting
	var/list/overflow_whitelist = list() //whitelist for overflow

	var/disable_away_missions = 0 // disable away missions
	var/disable_space_ruins = 0 //disable space ruins

	var/extra_space_ruin_levels_min = 4
	var/extra_space_ruin_levels_max = 8

	var/ooc_allowed = 1
	var/looc_allowed = 1
	var/dooc_allowed = 1
	var/dsay_allowed = 1

	var/disable_lobby_music = 0 // Disables the lobby music
	var/disable_cid_warn_popup = 0 //disables the annoying "You have already logged in this round, disconnect or be banned" popup, because it annoys the shit out of me when testing.

	var/max_loadout_points = 5 // How many points can be spent on extra items in character setup

	var/disable_ooc_emoji = 0 // prevents people from using emoji in OOC

	var/shutdown_on_reboot = 0 // Whether to shut down the world instead of rebooting it

	var/disable_karma = 0 // Disable all karma functions and unlock karma jobs by default

	// StonedMC
	var/tick_limit_mc_init = TICK_LIMIT_MC_INIT_DEFAULT	//SSinitialization throttling

	// Highpop tickrates
	var/base_mc_tick_rate = 1
	var/high_pop_mc_tick_rate = 1.1

	var/high_pop_mc_mode_amount = 65
	var/disable_high_pop_mc_mode_amount = 60

	// Nightshift
	var/randomize_shift_time = FALSE
	var/enable_night_shifts = FALSE

	// Developer
	var/developer_express_start = 0

	// Automatic localhost admin disable
	var/disable_localhost_admin = 0

	//Start now warning
	var/start_now_confirmation = 0

	// Lavaland
	var/lavaland_budget = 60

	//cube monkey limit
	var/cubemonkeycap = 20

	//Can cult convert or not
	var/can_cult_convert = TRUE

	// Makes gamemodes respect player limits
	var/enable_gamemode_player_limit = 0

	/// BYOND account age limit for notifcations of new accounts (Any accounts older than this value will not send notifications on first join)
	var/byond_account_age_threshold = 7

	/// Are discord webhooks enabled?
	var/discord_webhooks_enabled = FALSE

	/// Role ID to be pinged for administrative events
	var/discord_admin_role_id = null // Intentional null usage

	/// Webhook URLs for the main public webhook
	var/list/discord_main_webhook_urls = list()

	/// Webhook URLs for the admin webhook
	var/list/discord_admin_webhook_urls = list()

	/// Webhook URLs for the mentor webhook
	var/list/discord_mentor_webhook_urls = list()

	/// Do we want to forward all adminhelps to the discord or just ahelps when admins are offline.
	/// (This does not mean all ahelps are pinged, only ahelps sent when staff are offline get the ping, regardless of this setting)
	var/discord_forward_all_ahelps = FALSE

	/// URL for the CentCom Ban DB API
	var/centcom_ban_db_url = null

	/// Timeout (seconds) for async SQL queries
	var/async_sql_query_timeout = 10 SECONDS

	/// Limit of how many SQL threads can run at once
	var/rust_sql_thread_limit = 50

	// Delay before respawning for players and drones (minutes)
	var/respawn_delay = 20
	var/respawn_delay_drone = 10
	var/respawn_observer = FALSE

	var/restrict_maint = 0

	var/full_day_logs = FALSE

	var/allow_head_of_departaments_assign_civilian = FALSE

	var/tts_enabled = FALSE // Global switch
	var/tts_cache = FALSE // Store generated tts files and reuse them, instead of always requesting new

	/// the amount of players needed to automatically switch gamemode to extended. Doesn't work if set to zero
	var/auto_extended_players_num = 0

	var/map_rotate = "none"
	var/default_map = null
	var/override_map = null

/datum/configuration/New()
	for(var/T in subtypesof(/datum/game_mode))
		var/datum/game_mode/M = T

		if(initial(M.config_tag))
			if(!(initial(M.config_tag) in modes))		// ensure each mode is added only once
				src.modes += initial(M.config_tag)
				src.mode_names[initial(M.config_tag)] = initial(M.name)
				src.probabilities[initial(M.config_tag)] = initial(M.probability)
				src.mode_required_players[initial(M.config_tag)] = initial(M.required_players)
				if(initial(M.votable))
					src.votable_modes += initial(M.config_tag)
	src.votable_modes += "secret"

/datum/configuration/proc/load(filename, type = "config") //the type can also be game_options, in which case it uses a different switch. not making it separate to not copypaste code - Urist
	if(IsAdminAdvancedProcCall())
		to_chat(usr, "<span class='boldannounce'>Config reload blocked: Advanced ProcCall detected.</span>")
		log_and_message_admins("attempted to reload configuration via advanced proc-call")
		return
	var/list/Lines = file2list(filename)

	for(var/t in Lines)
		if(!t)	continue

		t = trim(t)
		if(length(t) == 0)
			continue
		else if(copytext(t, 1, 2) == "#")
			continue

		var/pos = findtext(t, " ")
		var/name = null
		var/value = null

		if(pos)
			name = lowertext(copytext(t, 1, pos))
			value = copytext(t, pos + 1)
		else
			name = lowertext(t)

		if(!name)
			continue

		if(type == "config")
			switch(name)
				if("resource_urls")
					config.resource_urls = splittext(value, " ")

				if("admin_legacy_system")
					config.admin_legacy_system = 1

				if("ban_legacy_system")
					config.ban_legacy_system = 1

				if("use_age_restriction_for_jobs")
					config.use_age_restriction_for_jobs = 1

				if("use_age_restriction_for_antags")
					config.use_age_restriction_for_antags = 1

				if("use_exp_tracking")
					config.use_exp_tracking = 1

				if("use_exp_restrictions")
					config.use_exp_restrictions = 1

				if("use_exp_restrictions_admin_bypass")
					config.use_exp_restrictions_admin_bypass = 1

				if("jobs_have_minimal_access")
					config.jobs_have_minimal_access = 1

				if("shadowling_max_age")
					config.shadowling_max_age = text2num(value)

				if("warn_afk_minimum")
					config.warn_afk_minimum = text2num(value)
				if("auto_cryo_afk")
					config.auto_cryo_afk = text2num(value)
				if("auto_despawn_afk")
					config.auto_despawn_afk = text2num(value)

				if("auto_cryo_ssd_mins")
					config.auto_cryo_ssd_mins = text2num(value)
				if("ssd_warning")
					config.ssd_warning = 1

				if("list_afk_minimum")
					config.list_afk_minimum = text2num(value)

				if("ipintel_email")
					if(value != "ch@nge.me")
						config.ipintel_email = value
				if("ipintel_rating_bad")
					config.ipintel_rating_bad = text2num(value)
				if("ipintel_domain")
					config.ipintel_domain = value
				if("ipintel_save_good")
					config.ipintel_save_good = text2num(value)
				if("ipintel_save_bad")
					config.ipintel_save_bad = text2num(value)
				if("ipintel_maxplaytime")
					config.ipintel_maxplaytime = text2num(value)
				if("ipintel_whitelist")
					config.ipintel_whitelist = 1
				if("ipintel_detailsurl")
					config.ipintel_detailsurl = value

				if("forum_link_url")
					config.forum_link_url = value

				if("forum_playerinfo_url")
					config.forum_playerinfo_url = value

				if("log_ooc")
					config.log_ooc = 1

				if("log_access")
					config.log_access = 1

				if("log_say")
					config.log_say = 1

				if("log_admin")
					config.log_admin = 1

				if("log_debug")
					config.log_debug = 1

				if("log_game")
					config.log_game = 1

				if("log_vote")
					config.log_vote = 1

				if("log_whisper")
					config.log_whisper = 1

				if("log_attack")
					config.log_attack = 1

				if("log_conversion")
					config.log_conversion = 1

				if("log_emote")
					config.log_emote = 1

				if("log_adminchat")
					config.log_adminchat = 1

				if("log_adminwarn")
					config.log_adminwarn = 1

				if("log_pda")
					config.log_pda = 1

				if("log_world_output")
					config.log_world_output = 1

				if("log_hrefs")
					config.log_hrefs = 1

				if("disable_root_log")
					config.disable_root_log = 1

				if("log_runtime")
					config.log_runtimes = 1

				if("log_timers_on_bucket_reset")
					config.log_timers_on_bucket_reset = 1

				if("mentors")
					config.mods_are_mentors = 1

				if("allow_admin_ooccolor")
					config.allow_admin_ooccolor = 1

				if("pregame_timestart")
					config.pregame_timestart = text2num(value)

				if("allow_vote_restart")
					config.allow_vote_restart = 1

				if("allow_vote_mode")
					config.allow_vote_mode = 1

				if("no_dead_vote")
					config.vote_no_dead = 1

				if("vote_autotransfer_initial")
					config.vote_autotransfer_initial = text2num(value)

				if("vote_autotransfer_interval")
					config.vote_autotransfer_interval = text2num(value)

				if("default_no_vote")
					config.vote_no_default = 1

				if("vote_delay")
					config.vote_delay = text2num(value)

				if("vote_period")
					config.vote_period = text2num(value)

				if("allow_ai")
					config.allow_ai = 1

//				if("authentication")
//					config.enable_authentication = 1

				if("norespawn")
					config.respawn = 0

				if("servername")
					config.server_name = value

				if("server_tag_line")
					config.server_tag_line = value

				if("server_extra_features")
					config.server_extra_features = value

				if("serversuffix")
					config.server_suffix = 1

				if("minimum_client_build")
					config.minimum_client_build = text2num(value)

				if("nudge_script_path")
					config.nudge_script_path = value

				if("server")
					config.server = value

				if("banappeals")
					config.banappeals = value

				if("wikiurl")
					config.wikiurl = value

				if("forumurl")
					config.forumurl = value

				if("rulesurl")
					config.rulesurl = value

				if("githuburl")
					config.githuburl = value

				if("discordurl")
					config.discordurl = value

				if("discordforumurl")
					config.discordforumurl = value

				if("discordbugreporturl")
					config.discordbugreporturl = value

				if("donationsurl")
					config.donationsurl = value

				if("repositoryurl")
					config.repositoryurl = value

				if("guest_jobban")
					config.guest_jobban = 1

				if("guest_ban")
					GLOB.guests_allowed = 0

				if("panic_bunker_threshold")
					config.panic_bunker_threshold = text2num(value)

				if("usewhitelist")
					config.usewhitelist = 1

				if("usewhitelist_database")
					config.usewhitelist_database = 1

				if("usewhitelist_nojobbanned")
					config.usewhitelist_nojobbanned = TRUE

				if("minimum_byondacc_age")
					config.minimum_byondacc_age = text2num(value)

				if("feature_object_spell_system")
					config.feature_object_spell_system = 1

				if("allow_metadata")
					config.allow_Metadata = 1

				if("traitor_scaling")
					config.traitor_scaling = text2num(value)

				if("protect_roles_from_antagonist")
					config.protect_roles_from_antagonist = 1

				if("probability")
					var/prob_pos = findtext(value, " ")
					var/prob_name = null
					var/prob_value = null

					if(prob_pos)
						prob_name = lowertext(copytext(value, 1, prob_pos))
						prob_value = copytext(value, prob_pos + 1)
						if(prob_name in config.modes)
							config.probabilities[prob_name] = text2num(prob_value)
						else
							log_config("Unknown game mode probability configuration definition: [prob_name].")
					else
						log_config("Incorrect probability configuration definition: [prob_name]  [prob_value].")

				if("minplayers")
					var/minreq_pos = findtext(value, " ")
					var/minreq_name = null
					var/minreq_value = null

					if(minreq_pos)
						minreq_name = lowertext(copytext(value, 1, minreq_pos))
						minreq_value = copytext(value, minreq_pos + 1)
						if(minreq_name in config.modes)
							config.mode_required_players[minreq_name] = text2num(minreq_value)
						else
							log_config("Unknown game mode minplayers configuration definition: [minreq_name].")
					else
						log_config("Incorrect minplayers configuration definition: [minreq_name]  [minreq_value].")

				if("allow_random_events")
					config.allow_random_events = 1

				if("load_jobs_from_txt")
					load_jobs_from_txt = 1

				if("forbid_singulo_possession")
					forbid_singulo_possession = 1

				if("check_randomizer")
					check_randomizer = 1

				if("proxy_autoban")
					config.proxy_autoban = 1

				if("popup_admin_pm")
					config.popup_admin_pm = 1

				if("allow_holidays")
					config.allow_holidays = 1

				if("ticklag")
					Ticklag = text2num(value)

				if("clientfps")
					clientfps = text2num(value)

				if("socket_talk")
					socket_talk = text2num(value)

				if("allow_antag_hud")
					config.antag_hud_allowed = 1

				if("antag_hud_restricted")
					config.antag_hud_restricted = 1

				if("humans_need_surnames")
					humans_need_surnames = 1

				if("automute_on")
					automute_on = 1

				if("usealienwhitelist")
					usealienwhitelist = 1

				if("alien_player_ratio")
					limitalienplayers = 1
					alien_to_human_ratio = text2num(value)

				if("assistant_maint")
					config.assistant_maint = 1

				if("gateway_delay")
					config.gateway_delay = text2num(value)

				if("continuous_rounds")
					config.continuous_rounds = 1

				if("ghost_interaction")
					config.ghost_interaction = 1

				if("comms_password")
					config.comms_password = value

				if("python_path")
					if(value)
						GLOB.python_path = value
					else
						if(world.system_type == UNIX)
							GLOB.python_path = "/usr/bin/env python2"
						else //probably windows, if not this should work anyway
							GLOB.python_path = "pythonw"

				if("assistant_limit")
					config.assistantlimit = 1

				if("assistant_ratio")
					config.assistantratio = text2num(value)

				if("allow_drone_spawn")
					config.allow_drone_spawn = text2num(value)

				if("drone_build_time")
					config.drone_build_time = text2num(value)

				if("max_maint_drones")
					config.max_maint_drones = text2num(value)

				if("expected_round_length")
					config.expected_round_length = text2num(value) MINUTES

				if("event_custom_start_mundane")
					var/values = text2numlist(value, ";")
					config.event_first_run[EVENT_LEVEL_MUNDANE] = list("lower" = values[1] MINUTES, "upper" = values[2] MINUTES)

				if("event_custom_start_moderate")
					var/values = text2numlist(value, ";")
					config.event_first_run[EVENT_LEVEL_MODERATE] = list("lower" = values[1] MINUTES, "upper" = values[2] MINUTES)

				if("event_custom_start_major")
					var/values = text2numlist(value, ";")
					config.event_first_run[EVENT_LEVEL_MAJOR] = list("lower" = values[1] MINUTES, "upper" = values[2] MINUTES)

				if("event_delay_lower")
					var/values = text2numlist(value, ";")
					config.event_delay_lower[EVENT_LEVEL_MUNDANE] = values[1] MINUTES
					config.event_delay_lower[EVENT_LEVEL_MODERATE] = values[2] MINUTES
					config.event_delay_lower[EVENT_LEVEL_MAJOR] = values[3] MINUTES

				if("event_delay_upper")
					var/values = text2numlist(value, ";")
					config.event_delay_upper[EVENT_LEVEL_MUNDANE] = values[1] MINUTES
					config.event_delay_upper[EVENT_LEVEL_MODERATE] = values[2] MINUTES
					config.event_delay_upper[EVENT_LEVEL_MAJOR] = values[3] MINUTES

				if("starlight")
					config.starlight = 1

				if("player_reroute_cap")
					var/vvalue = text2num(value)
					config.player_overflow_cap = vvalue >= 0 ? vvalue : 0

				if("overflow_server_url")
					config.overflow_server_url = value

				if("tutorial_server_url")
					config.tutorial_server_url = value

				if("disable_away_missions")
					config.disable_away_missions = 1

				if("disable_space_ruins")
					config.disable_space_ruins = 1

				if("disable_lobby_music")
					config.disable_lobby_music = 1

				if("disable_cid_warn_popup")
					config.disable_cid_warn_popup = 1

				if("extra_space_ruin_levels_min")
					var/vvalue = text2num(value)
					config.extra_space_ruin_levels_min = max(vvalue, 0)

				if("extra_space_ruin_levels_max")
					var/vvalue = text2num(value)
					config.extra_space_ruin_levels_max = max(vvalue, 0)

				if("max_loadout_points")
					config.max_loadout_points = text2num(value)

				if("round_abandon_penalty_period")
					config.round_abandon_penalty_period = text2num(value) MINUTES

				if("medal_hub_address")
					config.medal_hub_address = value

				if("medal_hub_password")
					config.medal_hub_password = value

				if("disable_ooc_emoji")
					config.disable_ooc_emoji = 1

				if("shutdown_on_reboot")
					config.shutdown_on_reboot = 1

				if("shutdown_shell_command")
					GLOB.shutdown_shell_command = value

				if("disable_karma")
					config.disable_karma = 1

				if("start_now_confirmation")
					config.start_now_confirmation = 1

				if("tick_limit_mc_init")
					config.tick_limit_mc_init = text2num(value)
				if("base_mc_tick_rate")
					config.base_mc_tick_rate = text2num(value)
				if("high_pop_mc_tick_rate")
					config.high_pop_mc_tick_rate = text2num(value)
				if("high_pop_mc_mode_amount")
					config.high_pop_mc_mode_amount = text2num(value)
				if("disable_high_pop_mc_mode_amount")
					config.disable_high_pop_mc_mode_amount = text2num(value)
				if("developer_express_start")
					config.developer_express_start = 1
				if("disable_localhost_admin")
					config.disable_localhost_admin = 1
				if("enable_gamemode_player_limit")
					config.enable_gamemode_player_limit = 1
				if("byond_account_age_threshold")
					config.byond_account_age_threshold = text2num(value)
				// Discord stuff
				if("enable_discord_webhooks")
					discord_webhooks_enabled = TRUE
				if("discord_webhooks_admin_role_id")
					discord_admin_role_id = "[value]" // This MUST be a string because BYOND doesnt like massive integers
				if("discord_webhooks_main_url")
					discord_main_webhook_urls = splittext(value, "|")
				if("discord_webhooks_admin_url")
					discord_admin_webhook_urls = splittext(value, "|")
				if("discord_webhooks_mentor_url")
					discord_mentor_webhook_urls = splittext(value, "|")
				if("discord_forward_all_ahelps")
					discord_forward_all_ahelps = TRUE
				// End discord stuff
				if("centcom_ban_db_url")
					centcom_ban_db_url = value

				if ("disable_respawn")
					GLOB.abandon_allowed = 0
				if ("respawn_observer")
					config.respawn_observer = TRUE
				if ("respawn_delay")
					config.respawn_delay = text2num(value)
					config.respawn_delay = config.respawn_delay > 0 ? config.respawn_delay : 0
				if ("respawn_delay_drone")
					config.respawn_delay_drone = text2num(value)
					config.respawn_delay_drone = config.respawn_delay_drone > 0 ? config.respawn_delay_drone : 0

				if ("restrict_maint")
					config.restrict_maint = text2num(value)

				if ("full_day_logs")
					config.full_day_logs = TRUE

				if ("allow_head_of_departaments_assign_civilian")
					config.allow_head_of_departaments_assign_civilian = TRUE

				if("topic_filtering_whitelist")
					config.topic_filtering_whitelist = splittext(value, " ")

				if("tts_token_silero")
					tts_token_silero = value

				if("tts_enabled")
					config.tts_enabled = tts_token_silero ? TRUE : FALSE

				if("tts_cache")
					config.tts_cache = TRUE

				if("auto_extended_players_num")
					config.auto_extended_players_num = text2num(value)

				if("ffmpeg_cpuaffinity")
					var/sanitized = regex(@"[^0-9,-]", "g").Replace(value, "")
					if(value != sanitized)
						log_config("Wrong value for setting in configuration: '[name]'. Check out taskset man page.")
					GLOB.ffmpeg_cpuaffinity = value

				if("map_rotate")
					config.map_rotate = value

				if("default_map")
					config.default_map = value

				if("override_map")
					config.override_map = value

				else
					log_config("Unknown setting in configuration: '[name]'")

		else if(type == "twitch_censor")
			twich_censor_list[name] = value

		else if(type == "game_options")
			value = text2num(value)

			switch(name)
				if("revival_pod_plants")
					config.revival_pod_plants = value
				if("revival_cloning")
					config.revival_cloning = value
				if("revival_brain_life")
					config.revival_brain_life = value
				if("auto_toggle_ooc_during_round")
					config.auto_toggle_ooc_during_round	= 1
				if("run_speed")
					config.run_speed = value
				if("walk_speed")
					config.walk_speed = value
				if("human_delay")
					config.human_delay = value
				if("robot_delay")
					config.robot_delay = value
				if("monkey_delay")
					config.monkey_delay = value
				if("alien_delay")
					config.alien_delay = value
				if("slime_delay")
					config.slime_delay = value
				if("animal_delay")
					config.animal_delay = value
				if("bones_can_break")
					config.bones_can_break = value
				if("shuttle_refuel_delay")
					config.shuttle_refuel_delay     = value
				if("traitor_objectives_amount")
					config.traitor_objectives_amount = value
				if("reactionary_explosions")
					config.reactionary_explosions	= 1
				if("bombcap")
					var/BombCap = value
					if(!BombCap)
						continue
					if(BombCap < 4)
						BombCap = 4
					if(BombCap > 128)
						BombCap = 128

					GLOB.max_ex_devastation_range = round(BombCap/4)
					GLOB.max_ex_heavy_range = round(BombCap/2)
					GLOB.max_ex_light_range = BombCap
					GLOB.max_ex_flash_range = BombCap
					GLOB.max_ex_flame_range = BombCap
				if("default_laws")
					config.default_laws = value
				if("randomize_shift_time")
					config.randomize_shift_time = TRUE
				if("enable_night_shifts")
					config.enable_night_shifts = TRUE
				if("lavaland_budget")
					config.lavaland_budget = value
				if("cubemonkey_cap")
					config.cubemonkeycap = value
				if("can_cult_convert")
					config.can_cult_convert = value
				else
					log_config("Unknown setting in configuration: '[name]'")

/datum/configuration/proc/loadsql(filename)  // -- TLE
	if(IsAdminAdvancedProcCall())
		to_chat(usr, "<span class='boldannounce'>SQL configuration reload blocked: Advanced ProcCall detected.</span>")
		log_and_message_admins("attempted to reload SQL configuration via advanced proc-call")
		return
	var/list/Lines = file2list(filename)
	for(var/t in Lines)
		if(!t)	continue

		t = trim(t)
		if(length(t) == 0)
			continue
		else if(copytext(t, 1, 2) == "#")
			continue

		var/pos = findtext(t, " ")
		var/name = null
		var/value = null

		if(pos)
			name = lowertext(copytext(t, 1, pos))
			value = copytext(t, pos + 1)
		else
			name = lowertext(t)

		if(!name)
			continue

		switch(name)
			if("sql_enabled")
				config.sql_enabled = 1
			if("address")
				sqladdress = value
			if("port")
				sqlport = value
			if("feedback_database")
				sqlfdbkdb = value
			if("utility_database")
				sqlfdbkdbutil = value
			if("feedback_login")
				sqlfdbklogin = value
			if("feedback_password")
				sqlfdbkpass = value
			if("feedback_tableprefix")
				sqlfdbktableprefix = value
			if("db_version")
				sql_version = text2num(value)
			if("async_query_timeout")
				async_sql_query_timeout = text2num(value)
			if("rust_sql_thread_limit")
				config.rust_sql_thread_limit = text2num(value)
			else
				log_config("Unknown setting in configuration: '[name]'")

/datum/configuration/proc/loadoverflowwhitelist(filename)
	var/list/Lines = file2list(filename)
	for(var/t in Lines)
		if(!t)	continue

		t = trim(t)
		if(length(t) == 0)
			continue
		else if(copytext(t, 1, 2) == "#")
			continue

		config.overflow_whitelist += t

/datum/configuration/proc/pick_mode(mode_name)
	for(var/T in subtypesof(/datum/game_mode))
		var/datum/game_mode/M = T
		if(initial(M.config_tag) && initial(M.config_tag) == mode_name)
			return new T()
	return new /datum/game_mode/extended()

/datum/configuration/proc/get_runnable_modes()
	var/list/datum/game_mode/runnable_modes = new
	for(var/T in subtypesof(/datum/game_mode))
		var/datum/game_mode/M = new T()
//		to_chat(world, "DEBUG: [T], tag=[M.config_tag], prob=[probabilities[M.config_tag]]")
		if(!(M.config_tag in modes))
			qdel(M)
			continue
		if(probabilities[M.config_tag]<=0)
			qdel(M)
			continue
		if(M.can_start())
			runnable_modes[M] = probabilities[M.config_tag]
//			to_chat(world, "DEBUG: runnable_mode\[[runnable_modes.len]\] = [M.config_tag]")
	return runnable_modes

/datum/configuration/vv_edit_var(var_name, var_value)
	if(findtext(var_name, "log_") && usr?.client?.holder?.rights != R_HOST)
		return FALSE
	return ..()
