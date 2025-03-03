
/// Slime Extracts ///

/obj/item/slime_extract
	name = "slime extract"
	desc = "Goo extracted from a slime. Legends claim these to have \"magical powers\"."
	icon = 'icons/mob/slimes.dmi'
	icon_state = "grey slime extract"
	force = 1
	w_class = WEIGHT_CLASS_TINY
	container_type = INJECTABLE | DRAWABLE
	throwforce = 0
	throw_speed = 3
	throw_range = 6
	origin_tech = "biotech=3"
	var/Uses = 1 // uses before it goes inert

/obj/item/slime_extract/attackby(obj/item/O, mob/user)
	if(istype(O, /obj/item/slimepotion/enhancer))
		if(Uses >= 5)
			to_chat(user, "<span class='warning'>You cannot enhance this extract further!</span>")
			return ..()
		to_chat(user, "<span class='notice'>You apply the enhancer to the slime extract. It may now be reused one more time.</span>")
		Uses++
		qdel(O)
	..()

/obj/item/slime_extract/New()
	..()
	create_reagents(100)

/obj/item/slime_extract/grey
	name = "grey slime extract"
	icon_state = "grey slime extract"

/obj/item/slime_extract/gold
	name = "gold slime extract"
	icon_state = "gold slime extract"

/obj/item/slime_extract/silver
	name = "silver slime extract"
	icon_state = "silver slime extract"

/obj/item/slime_extract/metal
	name = "metal slime extract"
	icon_state = "metal slime extract"

/obj/item/slime_extract/purple
	name = "purple slime extract"
	icon_state = "purple slime extract"

/obj/item/slime_extract/darkpurple
	name = "dark purple slime extract"
	icon_state = "dark purple slime extract"

/obj/item/slime_extract/orange
	name = "orange slime extract"
	icon_state = "orange slime extract"

/obj/item/slime_extract/yellow
	name = "yellow slime extract"
	icon_state = "yellow slime extract"

/obj/item/slime_extract/red
	name = "red slime extract"
	icon_state = "red slime extract"

/obj/item/slime_extract/blue
	name = "blue slime extract"
	icon_state = "blue slime extract"

/obj/item/slime_extract/darkblue
	name = "dark blue slime extract"
	icon_state = "dark blue slime extract"

/obj/item/slime_extract/pink
	name = "pink slime extract"
	icon_state = "pink slime extract"

/obj/item/slime_extract/green
	name = "green slime extract"
	icon_state = "green slime extract"

/obj/item/slime_extract/lightpink
	name = "light pink slime extract"
	icon_state = "light pink slime extract"

/obj/item/slime_extract/black
	name = "black slime extract"
	icon_state = "black slime extract"

/obj/item/slime_extract/oil
	name = "oil slime extract"
	icon_state = "oil slime extract"

/obj/item/slime_extract/adamantine
	name = "adamantine slime extract"
	icon_state = "adamantine slime extract"

/obj/item/slime_extract/bluespace
	name = "bluespace slime extract"
	icon_state = "bluespace slime extract"

/obj/item/slime_extract/pyrite
	name = "pyrite slime extract"
	icon_state = "pyrite slime extract"

/obj/item/slime_extract/cerulean
	name = "cerulean slime extract"
	icon_state = "cerulean slime extract"

/obj/item/slime_extract/sepia
	name = "sepia slime extract"
	icon_state = "sepia slime extract"

/obj/item/slime_extract/rainbow
	name = "rainbow slime extract"
	icon_state = "rainbow slime extract"

////Slime-derived potions///

/obj/item/slimepotion
	name = "slime potion"
	var/id
	desc = "A hard yet gelatinous capsule excreted by a slime, containing mysterious substances."
	w_class = WEIGHT_CLASS_TINY
	origin_tech = "biotech=4"

/obj/item/slimepotion/afterattack(obj/item/reagent_containers/target, mob/user, proximity_flag)
	if(!proximity_flag)
		return
	if(istype(target))
		to_chat(user, "<span class='notice'>You cannot transfer [src] to [target]! It appears the potion must be given directly to a slime to absorb.</span>") // le fluff faec
		return

/obj/item/slimepotion/proc/is_aldready_improved(obj/item/clothing/C)
	if(C.slime_potions)
		for(var/Potion as obj in GLOB.slime_potions)
			var/obj/item/slimepotion/S = Potion
			if(S.id == C.slime_potions)
				C.slime_potions = null
				C.name = initial(C.name)
				var/datum/armor/current_armor = C.armor
				C.armor = current_armor.detachArmor(S.armor)
				C.teleportation = initial(C.teleportation)
				return FALSE
	else
		return TRUE

/obj/item/slimepotion/slime/docility
	name = "docility potion"
	desc = "A potent chemical mix that nullifies a slime's hunger, causing it to become docile and tame."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle19"
	var/being_used = FALSE

/obj/item/slimepotion/slime/docility/attack(mob/living/simple_animal/slime/M, mob/user)
	if(!isslime(M))
		to_chat(user, "<span class='warning'>The potion only works on slimes!</span>")
		return
	if(M.stat)
		to_chat(user, "<span class='warning'>The slime is dead!</span>")
		return
	if(being_used)
		to_chat(user, "<span class='warning'>You're already using this on another slime!</span>")
		return
	if(M.rabid) //Stops being rabid, but doesn't become truly docile.
		to_chat(M, "<span class='warning'>You absorb the potion, and your rabid hunger finally settles to a normal desire to feed.</span>")
		to_chat(user, "<span class='notice'>You feed the slime the potion, calming its rabid rage.</span>")
		M.rabid = FALSE
		qdel(src)
		return
	M.docile = TRUE
	M.set_nutrition(700)
	to_chat(M, "<span class='warning'>You absorb the potion and feel your intense desire to feed melt away.</span>")
	to_chat(user, "<span class='notice'>You feed the slime the potion, removing its hunger and calming it.</span>")
	being_used = TRUE
	var/newname = sanitize(copytext_char(input(user, "Would you like to give the slime a name?", "Name your new pet", "pet slime") as null|text,1,MAX_NAME_LEN))

	if(!newname)
		newname = "pet slime"
	M.name = newname
	M.real_name = newname
	qdel(src)

/obj/item/slimepotion/sentience
	name = "sentience potion"
	id = "Sentience"
	desc = "A miraculous chemical mix that can raise the intelligence of creatures to human levels."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle19"
	origin_tech = "biotech=6"
	var/list/not_interested = list()
	var/being_used = FALSE
	var/sentience_type = SENTIENCE_ORGANIC

/obj/item/slimepotion/sentience/afterattack(mob/living/M, mob/user, proximity_flag)
	if(!proximity_flag)
		return
	if(being_used || !ismob(M))
		return
	if(!isanimal(M) && !ismonkeybasic(M)) //работает только на животных и низших формах карбонов
		to_chat(user, "<span class='warning'>[M] is not animal nor lesser life form!</span>")
		return ..()
	if(M.stat)
		to_chat(user, "<span class='warning'>[M] is dead!</span>")
		return ..()

	if(M.ckey && isanimal(M)) //giving sentience to simple mobs under player control
		var/mob/living/simple_animal/SM = M
		if(SM.sentience_type != sentience_type)
			to_chat(user, "<span class='warning'>[src] won't work on [SM].</span>")
			return ..()

		if(SM.master_commander)
			to_chat(user, "<span class='warning'>[SM.name] уже имеет хозяина!</span>")
			return

		being_used = TRUE
		var/response = alert(SM, "Желаете стать питомцем [user.name] и обрести разум подобный человеческому?","Зелье Разума!", "Да","Нет")

		if(response == "Нет")
			to_chat(user, "<span class='warning'>[SM.name] отказался от зелья!</span>")
			being_used = FALSE
			return
		else
			if(!src)
				return

			SM.universal_speak = TRUE
			SM.faction = user.faction
			SM.master_commander = user
			SM.can_collar = TRUE
			to_chat(SM, "<span class='warning'>All at once it makes sense: you know what you are and who you are! Self awareness is yours!</span>")
			to_chat(SM, "<span class='userdanger'>You are grateful to be self aware and owe [user] a great debt. Serve [user], and assist [user.p_them()] in completing [user.p_their()] goals at any cost.</span>")
			if(SM.flags_2 & HOLOGRAM_2) //Check to see if it's a holodeck creature
				to_chat(SM, "<span class='userdanger'>You also become depressingly aware that you are not a real creature, but instead a holoform. Your existence is limited to the parameters of the holodeck.</span>")
			to_chat(user, "<span class='notice'>[M] accepts the potion and suddenly becomes attentive and aware. It worked!</span>")
			after_success(user, SM)
			qdel(src)

			var/new_name = sanitize(copytext_char(input(user, "Назовите вашего питомца, или нажмите \"Закрыть\" чтобы оставить расовое имя.", "Именование", SM.name) as null|text,1,MAX_NAME_LEN))
			if(new_name)
				to_chat(user, "<span class='notice'>Имя питомца - <b>\"[new_name]\"</b>!</span>")
				to_chat(SM, "<span class='notice'>Ваше новое имя - <b>\"[new_name]\"</b>!</span>")
				SM.real_name = new_name
				SM.name = new_name
				if(isslime(SM))
					var/mob/living/simple_animal/slime/SM_slime = SM
					SM_slime.is_renamed = TRUE

			SM.mind.store_memory("<B>Мой хозяин [user.name], выполню [genderize_ru(user.gender, "его", "её", "этого", "их")] цели любой ценой!</B>")
			add_game_logs("стал питомцем игрока [key_name_log(user)]", SM)
			return

	if(isanimal(M))
		var/mob/living/simple_animal/SM = M

		if(SM.sentience_type != sentience_type)
			to_chat(user, "<span class='warning'>[src] won't work on [SM].</span>")
			return ..()

		to_chat(user, "<span class='notice'>You offer [src.name] to [SM]...</span>")
		being_used = TRUE

		var/ghostmsg = "Play as [SM.name], pet of [user.name]?"
		var/list/candidates = SSghost_spawns.poll_candidates(ghostmsg, ROLE_SENTIENT, FALSE, 10 SECONDS, source = M)

		if(!src)
			return

		if(length(candidates))
			var/mob/C = pick(candidates)
			SM.key = C.key
			SM.universal_speak = TRUE
			SM.faction = user.faction
			SM.master_commander = user
			SM.sentience_act()
			SM.can_collar = TRUE
			to_chat(SM, "<span class='warning'>All at once it makes sense: you know what you are and who you are! Self awareness is yours!</span>")
			to_chat(SM, "<span class='userdanger'>You are grateful to be self aware and owe [user] a great debt. Serve [user], and assist [user.p_them()] in completing [user.p_their()] goals at any cost.</span>")
			if(SM.flags_2 & HOLOGRAM_2) //Check to see if it's a holodeck creature
				to_chat(SM, "<span class='userdanger'>You also become depressingly aware that you are not a real creature, but instead a holoform. Your existence is limited to the parameters of the holodeck.</span>")
			to_chat(user, "<span class='notice'>[M] accepts [src] and suddenly becomes attentive and aware. It worked!</span>")
			after_success(user, SM)
			qdel(src)

			var/new_name = sanitize(copytext_char(input(user, "Назовите вашего питомца, или нажмите \"Закрыть\" чтобы оставить расовое имя.", "Именование", SM.name) as null|text,1,MAX_NAME_LEN))
			if(new_name)
				to_chat(user, "<span class='notice'>Имя питомца - <b>\"[new_name]\"</b>!</span>")
				to_chat(SM, "<span class='notice'>Ваше имя - <b>\"[new_name]\"</b>!</span>")
				SM.real_name = new_name
				SM.name = new_name
				if(isslime(SM))
					var/mob/living/simple_animal/slime/SM_slime = SM
					SM_slime.is_renamed = TRUE

			SM.mind.store_memory("<B>Мой хозяин [user.name], выполню [genderize_ru(user.gender, "его", "её", "этого", "их")] цели любой ценой!</B>")
			add_game_logs("стал питомцем игрока [key_name(user)]", SM)
		else
			to_chat(user, "<span class='notice'>[M] looks interested for a moment, but then looks back down. Maybe you should try again later.</span>")
			being_used = FALSE
			..()

		return

	//обработка низших форм: Обезьяны, стока, фарвы, неары, вульпина
	if(ismonkeybasic(M) && !M.ckey)
		var/mob/living/carbon/human/lesser/monkey/LF = M

		if(LF.sentience_type != sentience_type)
			to_chat(user, "<span class='warning'>[LF] совершенно безразлично смотрит на [src.name] в ваших руках.</span>")
			return ..()

		to_chat(user, "<span class='notice'>Вы предлагаете [src] [LF]... Он[genderize_ru(LF.gender, "", "а", "о", "и")] осторожно осматрива[pluralize_ru(LF.gender,"ет","ют")] его</span>")
		being_used = TRUE

		var/ghostmsg = "Play as [LF.name], pet of [user.name]?"
		var/list/candidates = SSghost_spawns.poll_candidates(ghostmsg, ROLE_SENTIENT, FALSE, 10 SECONDS, source = M)

		if(!src)
			return

		if(length(candidates))
			var/mob/C = pick(candidates)
			LF.key = C.key
			LF.faction = user.faction
			LF.master_commander = user
			to_chat(LF, "<span class='warning'>Труд из обезьяны сделал человека! А зелье разума сделало вас осознающим себя в этом мире. Вы по прежнему являетесь обезьяной и вашего ограниченного ума не хватает чтобы осознать всей окружающей вас аппаратуры и продвинутого окружения. Вы знаете что оно как-то работает у людей и вам этого хватает. Ваши желания просты и примитивны, как и вы сами. Но что точно вы знаете лучше всей своей жизни...</span>")
			to_chat(LF, "<span class='userdanger'>Вы самоосознались благодаря [user.name]. В качестве благодарности, теперь вы служите [user.name], и помогаете [genderize_ru(user.gender, "ему", "ей", "этому", "им")] в выполнении [genderize_ru(user.gender, "его", "её", "этого", "их")] целей любой ценой!</span>")
			to_chat(user, "<span class='notice'>[M] бер[pluralize_ru(LF.gender,"ет","ут")] зелье и дела[pluralize_ru(LF.gender,"ет","ют")] глоток. Он[genderize_ru(LF.gender, "", "а", "о", "и")] смотр[pluralize_ru(LF.gender,"ит","ят")] на вас грустными и понимающими глазами. Сработало!</span>")
			qdel(src)

			var/new_name = sanitize(copytext_char(input(user, "Назовите вашего питомца, или нажмите \"Закрыть\" чтобы оставить расовое имя.", "Именование", LF.name) as null|text,1,MAX_NAME_LEN))
			if(new_name)
				to_chat(user, "<span class='notice'>Имя питомца - <b>\"[new_name]\"</b>!</span>")
				to_chat(LF, "<span class='notice'>Ваше имя - <b>\"[new_name]\"</b>!</span>")
				LF.real_name = new_name
				LF.name = new_name

			LF.mind.store_memory("<B>Мой хозяин [user.name], выполню [genderize_ru(user.gender, "его", "её", "этого", "их")] цели любой ценой!</B>")
			add_game_logs("стал питомцем игрока [key_name(user)]", LF)
		else
			to_chat(user, "<span class='notice'>[M] выглядел заинтересованым и даже потянулся к зелью, но его резко что-то отвлекло. Стоит попробовать снова попозже.</span>")
			being_used = FALSE
			. = ..()

		return

/obj/item/slimepotion/sentience/proc/after_success(mob/living/user, mob/living/simple_animal/SM)
	return

/obj/item/slimepotion/transference
	name = "consciousness transference potion"
	id = "Transference"
	desc = "A strange slime-based chemical that, when used, allows the user to transfer their consciousness to a lesser being."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle19"
	origin_tech = "biotech=6"
	var/prompted = FALSE
	var/animal_type = SENTIENCE_ORGANIC

/obj/item/slimepotion/transference/afterattack(mob/living/M, mob/user, proximity_flag)
	if(!proximity_flag)
		return
	if(prompted || !ismob(M))
		return
	if(!isanimal(M) || M.ckey) //much like sentience, these will not work on something that is already player controlled
		to_chat(user, "<span class='warning'>[M] already has a higher consciousness!</span>")
		return ..()
	if(M.stat)
		to_chat(user, "<span class='warning'>[M] is dead!</span>")
		return ..()
	var/mob/living/simple_animal/SM = M
	if(SM.sentience_type != animal_type)
		to_chat(user, "<span class='warning'>You cannot transfer your consciousness to [SM].</span>") //no controlling machines
		return ..()
	if(jobban_isbanned(user, ROLE_SENTIENT))
		to_chat(user, "<span class='warning'>Your mind goes blank as you attempt to use the potion.</span>")
		return

	prompted = TRUE
	if(alert("This will permanently transfer your consciousness to [SM]. Are you sure you want to do this?",,"Yes","No")=="No")
		prompted = FALSE
		return

	to_chat(user, "<span class='notice'>You drink the potion then place your hands on [SM]...</span>")
	add_attack_logs(user, SM, "mind transference potion")
	user.mind.transfer_to(SM)
	SM.universal_speak = TRUE
	SM.faction = user.faction
	SM.sentience_act() //Same deal here as with sentience
	SM.can_collar = TRUE
	user.death()
	to_chat(SM, "<span class='notice'>In a quick flash, you feel your consciousness flow into [SM]!</span>")
	to_chat(SM, "<span class='warning'>You are now [SM]. Your allegiances, alliances, and roles are still the same as they were prior to consciousness transfer!</span>")
	SM.name = "[SM.name] as [user.real_name]"
	qdel(src)

/obj/item/slimepotion/slime/steroid
	name = "slime steroid"
	desc = "A potent chemical mix that will cause a baby slime to generate more extract."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle16"

/obj/item/slimepotion/slime/steroid/attack(mob/living/simple_animal/slime/M, mob/user)
	if(!isslime(M))//If target is not a slime.
		to_chat(user, "<span class='warning'>The steroid only works on baby slimes!</span>")
		return ..()
	if(M.age_state.age != SLIME_BABY) //Can't steroidify adults
		to_chat(user, "<span class='warning'>Only baby slimes can use the steroid!</span>")
		return ..()
	if(M.stat)
		to_chat(user, "<span class='warning'>The slime is dead!</span>")
		return ..()
	if(M.cores >= 5)
		to_chat(user, "<span class='warning'>The slime already has the maximum amount of extract!</span>")
		return ..()

	to_chat(user, "<span class='notice'>You feed the slime the steroid. It will now produce one more extract.</span>")
	M.cores++
	qdel(src)

/obj/item/slimepotion/enhancer
	name = "extract enhancer"
	id = "Enhancer"
	desc = "A potent chemical mix that will give a slime extract an additional use."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle17"

/obj/item/slimepotion/slime/stabilizer
	name = "slime stabilizer"
	id = "Stabilizer"
	desc = "A potent chemical mix that will reduce the chance of a slime mutating."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle15"

/obj/item/slimepotion/slime/stabilizer/attack(mob/living/simple_animal/slime/M, mob/user)
	if(!isslime(M))
		to_chat(user, "<span class='warning'>The stabilizer only works on slimes!</span>")
		return ..()
	if(M.stat)
		to_chat(user, "<span class='warning'>The slime is dead!</span>")
		return ..()
	if(M.mutation_chance == 0)
		to_chat(user, "<span class='warning'>The slime already has no chance of mutating!</span>")
		return ..()

	to_chat(user, "<span class='notice'>You feed the slime the stabilizer. It is now less likely to mutate.</span>")
	M.mutation_chance = clamp(M.mutation_chance-15,0,100)
	qdel(src)

/obj/item/slimepotion/slime/mutator
	name = "slime mutator"
	id = "Mutator"
	desc = "A potent chemical mix that will increase the chance of a slime mutating."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle3"

/obj/item/slimepotion/slime/mutator/attack(mob/living/simple_animal/slime/M, mob/user)
	if(!isslime(M))
		to_chat(user, "<span class='warning'>The mutator only works on slimes!</span>")
		return ..()
	if(M.stat)
		to_chat(user, "<span class='warning'>The slime is dead!</span>")
		return ..()
	if(M.mutator_used)
		to_chat(user, "<span class='warning'>This slime has already consumed a mutator, any more would be far too unstable!</span>")
		return ..()
	if(M.mutation_chance == 100)
		to_chat(user, "<span class='warning'>The slime is already guaranteed to mutate!</span>")
		return ..()

	to_chat(user, "<span class='notice'>You feed the slime the mutator. It is now more likely to mutate.</span>")
	M.mutation_chance = clamp(M.mutation_chance+12,0,100)
	M.mutator_used = TRUE
	qdel(src)

/obj/item/slimepotion/speed
	name = "slime speed potion"
	id = "Speed"
	desc = "A potent chemical mix that will remove the slowdown from any item."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle3"
	origin_tech = "biotech=5"

/obj/item/slimepotion/speed/afterattack(obj/O, mob/user, proximity_flag)
	if(!proximity_flag)
		return
	..()
	if(!istype(O))
		to_chat(user, "<span class='warning'>The potion can only be used on items or vehicles!</span>")
		return
	if(isitem(O))
		var/obj/item/I = O
		if(I.slowdown <= 0)
			to_chat(user, "<span class='warning'>[I] can't be made any faster!</span>")
			return ..()
		I.slowdown = 0

	if(istype(O, /obj/vehicle))
		var/obj/vehicle/V = O
		var/vehicle_speed_mod = config.run_speed
		if(V.vehicle_move_delay <= vehicle_speed_mod)
			to_chat(user, "<span class='warning'>[V] can't be made any faster!</span>")
			return ..()
		V.vehicle_move_delay = vehicle_speed_mod

	to_chat(user, "<span class='notice'>You slather the red gunk over [O], making it faster.</span>")
	O.add_atom_colour("#FF0000", WASHABLE_COLOUR_PRIORITY)
	qdel(src)

/obj/item/slimepotion/speed/MouseDrop(obj/over_object)
	if(usr.incapacitated())
		return
	if(loc == usr && loc.Adjacent(over_object))
		afterattack(over_object, usr, TRUE)

/obj/item/slimepotion/fireproof
	name = "slime chill potion"
	id = "Fire Resistance"
	desc = "A potent chemical mix that will fireproof any article of clothing. Has three uses."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle17"
	origin_tech = "biotech=5"
	resistance_flags = FIRE_PROOF
	var/uses = 3

/obj/item/slimepotion/fireproof/afterattack(obj/item/clothing/C, mob/user, proximity_flag)
	..()
	if(!proximity_flag)
		return
	if(!uses)
		qdel(src)
		return
	if(!istype(C))
		to_chat(user, "<span class='warning'>The potion can only be used on clothing!</span>")
		return
	if(C.max_heat_protection_temperature == FIRE_IMMUNITY_MAX_TEMP_PROTECT)
		to_chat(user, "<span class='warning'>[C] is already fireproof!</span>")
		return ..()
	if(istype(C, /obj/item/clothing/neck))
		to_chat(user, "<span class='warning'>The potion can not be used on that!'</span>")
		return
	if(C.is_improoved_by_potion)
		to_chat(user, "<span class='warning'>[C] was already improoved by some potion! You washed away previous potion</span>")
		return ..()

	C.slime_potions = id
	C.name = "fireproofed [C.name]"
	C.add_atom_colour("#000080", WASHABLE_COLOUR_PRIORITY)
	C.max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	C.heat_protection = C.body_parts_covered
	C.resistance_flags |= FIRE_PROOF
	C.is_improoved_by_potion = TRUE
	uses --
	if(!uses)
		qdel(src)

/obj/item/slimepotion/fireproof/MouseDrop(obj/over_object)
	if(usr.incapacitated())
		return
	if(loc == usr && loc.Adjacent(over_object))
		afterattack(over_object, usr, TRUE)

/obj/item/slimepotion/acidproof
	name = "slime acidproof potion"
	id = "Acid Proof"
	desc = "A potent chemical mix that will increase acid resistance of any article of clothing"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 25)
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle8"
	origin_tech = "biotech=5"

/obj/item/slimepotion/acidproof/afterattack(obj/item/clothing/C, mob/user, proximity_flag)
	..()
	if(!proximity_flag)
		return
	if(!istype(C))
		to_chat(user, "<span class='warning'>The potion can only be used on clothing!</span>")
		return
	if(istype(C, /obj/item/clothing/neck))
		to_chat(user, "<span class='warning'>The potion can not be used on that!'</span>")
		return
	if(istype(C.armor) && C.armor.acid == 100)
		to_chat(user, "<span class='warning'>[C] is already acidproof!</span>")
		return ..()
	if(!is_aldready_improved(C))
		to_chat(user, "<span class='warning'>[C] was already improoved by some potion! You washed away previous potion</span>")

	C.slime_potions = id
	C.name = "acidproof [C.name]"
	C.add_atom_colour("#022202", WASHABLE_COLOUR_PRIORITY)
	C.is_improoved_by_potion = TRUE
	var/datum/armor/current_armor = C.armor
	C.armor = current_armor.attachArmor(armor)
	to_chat(user, "<span class='notice'>You slather the green gunk over [C], acidproofing it.</span>")
	qdel(src)

/obj/item/slimepotion/acidproof/MouseDrop(obj/over_object)
	if(usr.incapacitated())
		return
	if(loc == usr && loc.Adjacent(over_object))
		afterattack(over_object, usr, TRUE)

/obj/item/slimepotion/laserresistance
	name = "laser resistance slime potion"
	id = "Laser Resistance"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 5,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	desc = "A potent chemical mix that will increase laser resistance of any article of clothing."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle4"
	origin_tech = "biotech=5"
	var/uses = 1

/obj/item/slimepotion/laserresistance/afterattack(obj/item/clothing/C, mob/user, proximity_flag)
	..()
	if(!proximity_flag)
		return
	if(!istype(C))
		to_chat(user, "<span class='warning'>The potion can only be used on clothing!</span>")
		return
	if(istype(C, /obj/item/clothing/neck))
		to_chat(user, "<span class='warning'>The potion can not be used on that!'</span>")
		return
	if(istype(C.armor) && C.armor.laser == 100)
		to_chat(user, "<span class='warning'>[C] is already laser proof!</span>")
		return ..()
	if(!is_aldready_improved(C))
		to_chat(user, "<span class='warning'>[C] was already improoved by some potion! You washed away previous potion</span>")

	C.slime_potions = id
	C.name = "laserproof [C.name]"
	C.add_atom_colour("#91723a", WASHABLE_COLOUR_PRIORITY)
	C.is_improoved_by_potion = TRUE
	var/datum/armor/current_armor = C.armor
	C.armor = current_armor.attachArmor(armor)
	to_chat(user, "<span class='notice'>You slather the green gunk over [C], making it more laserproofing.</span>")
	qdel(src)

/obj/item/slimepotion/laserresistance/MouseDrop(obj/over_object)
	if(usr.incapacitated())
		return
	if(loc == usr && loc.Adjacent(over_object))
		afterattack(over_object, usr, TRUE)

/obj/item/slimepotion/radiation
	name = "radiation resistance slime potion"
	id = "Radiation Resistance"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 40, "fire" = 0, "acid" = 0)
	desc = "A potent chemical mix that will increase radiation resistance of any article of clothing."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle6"
	origin_tech = "biotech=5"
	var/uses = 1

/obj/item/slimepotion/radiation/afterattack(obj/item/clothing/C, mob/user, proximity_flag)
	..()
	if(!proximity_flag)
		return
	if(!istype(C))
		to_chat(user, "<span class='warning'>The potion can only be used on clothing!</span>")
		return
	if(istype(C, /obj/item/clothing/neck))
		to_chat(user, "<span class='warning'>The potion can not be used on that!'</span>")
		return
	if(istype(C.armor) && C.armor.rad == 100)
		to_chat(user, "<span class='warning'>[C] is already Radiation proof!</span>")
		return ..()
	if(!is_aldready_improved(C))
		to_chat(user, "<span class='warning'>[C] was already improoved by some potion! You washed away previous potion</span>")

	C.slime_potions = id
	C.name = "radiationproof [C.name]"
	C.add_atom_colour("#e6e205", WASHABLE_COLOUR_PRIORITY)
	C.is_improoved_by_potion = TRUE
	var/datum/armor/current_armor = C.armor
	C.armor = current_armor.attachArmor(armor)
	to_chat(user, "<span class='notice'>You slather the green gunk over [C], making it more radiationproof.</span>")
	qdel(src)

/obj/item/slimepotion/radiation/MouseDrop(obj/over_object)
	if(usr.incapacitated())
		return
	if(loc == usr && loc.Adjacent(over_object))
		afterattack(over_object, usr, TRUE)

/obj/item/slimepotion/bio
	name = "bio resistance slime potion"
	id = "Bio Resistance"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 40, "rad" = 0, "fire" = 0, "acid" = 0)
	desc = "A potent chemical mix that will increase bio resistance of any article of clothing."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle7"
	origin_tech = "biotech=5"
	var/uses = 1

/obj/item/slimepotion/bio/afterattack(obj/item/clothing/C, mob/user, proximity_flag)
	..()
	if(!proximity_flag)
		return
	if(!istype(C))
		to_chat(user, "<span class='warning'>The potion can only be used on clothing!</span>")
		return
	if(istype(C, /obj/item/clothing/neck))
		to_chat(user, "<span class='warning'>The potion can not be used on that!'</span>")
		return
	if(istype(C.armor) && C.armor.bio == 100)
		to_chat(user, "<span class='warning'>[C] is already bio proof!</span>")
		return ..()
	if(!is_aldready_improved(C))
		to_chat(user, "<span class='warning'>[C] was already improoved by some potion! You washed away previous potion</span>")

	C.slime_potions = id
	C.name = "bioproof [C.name]"
	C.add_atom_colour("#068a06", WASHABLE_COLOUR_PRIORITY)
	C.is_improoved_by_potion = TRUE
	var/datum/armor/current_armor = C.armor
	C.armor = current_armor.attachArmor(armor)
	to_chat(user, "<span class='notice'>You slather the green gunk over [C], making it more bioproof.</span>")
	qdel(src)

/obj/item/slimepotion/bio/MouseDrop(obj/over_object)
	if(usr.incapacitated())
		return
	if(loc == usr && loc.Adjacent(over_object))
		afterattack(over_object, usr, TRUE)

/obj/item/slimepotion/explosionresistencte
	name = "explosion resistance slime potion"
	id = "Explosion Resistance"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 15, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	desc = "A potent chemical mix that will increase explosion resistance of any article of clothing."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle9"
	origin_tech = "biotech=5"
	var/uses = 1

/obj/item/slimepotion/explosionresistencte/afterattack(obj/item/clothing/C, mob/user, proximity_flag)
	..()
	if(!proximity_flag)
		return
	if(!istype(C))
		to_chat(user, "<span class='warning'>The potion can only be used on clothing!</span>")
		return
	if(istype(C, /obj/item/clothing/neck))
		to_chat(user, "<span class='warning'>The potion can not be used on that!'</span>")
		return
	if(istype(C.armor) && C.armor.bomb == 100)
		to_chat(user, "<span class='warning'>[C] is already explosion proof!</span>")
		return ..()
	if(!is_aldready_improved(C))
		to_chat(user, "<span class='warning'>[C] was already improoved by some potion! You washed away previous potion</span>")

	C.slime_potions = id
	C.name = "explosionproof [C.name]"
	C.add_atom_colour("#2b2b2a", WASHABLE_COLOUR_PRIORITY)
	C.is_improoved_by_potion = TRUE
	var/datum/armor/current_armor = C.armor
	C.armor = current_armor.attachArmor(armor)
	to_chat(user, "<span class='notice'>You slather the green gunk over [C], making it more explosionproof.</span>")
	qdel(src)

/obj/item/slimepotion/explosionresistencte/MouseDrop(obj/over_object)
	if(usr.incapacitated())
		return
	if(loc == usr && loc.Adjacent(over_object))
		afterattack(over_object, usr, TRUE)

/obj/item/slimepotion/teleportation
	name = "teleportation slime potion"
	id = "Teleportation Resistance"
	desc = "A potent chemical mix that provides a small chance to teleport when taking damage."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle5"
	origin_tech = "biotech=5"
	var/uses = 1

/obj/item/slimepotion/teleportation/afterattack(obj/item/clothing/C, mob/user, proximity_flag)
	..()
	if(!proximity_flag)
		return
	if(!istype(C))
		to_chat(user, "<span class='warning'>The potion can only be used on clothing!</span>")
		return
	if(istype(C, /obj/item/clothing/neck))
		to_chat(user, "<span class='warning'>The potion can not be used on that!'</span>")
		return
	if(C.teleportation)
		to_chat(user, "<span class='warning'>[C] is already with teleportation slime potion on it!</span>")
		return ..()
	if(!is_aldready_improved(C))
		to_chat(user, "<span class='warning'>[C] was already improoved by some potion! You washed away previous potion</span>")

	C.slime_potions = id
	C.name = "teleportational [C.name]"
	C.add_atom_colour("#def1de", WASHABLE_COLOUR_PRIORITY)
	C.is_improoved_by_potion = TRUE
	C.teleportation = TRUE
	to_chat(user, "<span class='notice'>You slather the white gunk over [C], making it teleportable.</span>")
	qdel(src)


/obj/item/slimepotion/damage
	name = "Physical damage resistance slime potion"
	id = "Damage Resistance"
	armor = list("melee" = 5, "bullet" = 5, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	desc = "A potent chemical mix that will increase impact and gunshot resistance of any article of clothing."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle10"
	origin_tech = "biotech=5"

/obj/item/slimepotion/damage/afterattack(obj/item/clothing/C, mob/user, proximity_flag)
	..()
	if(!proximity_flag)
		return
	if(!istype(C))
		to_chat(user, "<span class='warning'>The potion can only be used on clothing!</span>")
		return
	if(istype(C, /obj/item/clothing/neck))
		to_chat(user, "<span class='warning'>The potion can not be used on that!'</span>")
		return
	if(istype(C.armor) && C.armor.melee == 100 && C.armor.bullet == 100)
		to_chat(user, "<span class='warning'>[C] is already damage proof!</span>")
		return ..()
	if(!is_aldready_improved(C))
		to_chat(user, "<span class='warning'>[C] was already improoved by some potion! You washed away previous potion</span>")

	C.slime_potions = id
	C.name = "damageproof [C.name]"
	C.add_atom_colour("#00d9ffff", WASHABLE_COLOUR_PRIORITY)
	C.is_improoved_by_potion = TRUE
	var/datum/armor/current_armor = C.armor
	C.armor = current_armor.attachArmor(armor)
	to_chat(user, "<span class='notice'>You slather the green gunk over [C], making it more damageproof!.</span>")
	qdel(src)

/obj/effect/timestop
	anchored = 1
	name = "chronofield"
	desc = "ZA WARUDO"
	icon = 'icons/effects/160x160.dmi'
	icon_state = "time"
	layer = FLY_LAYER
	pixel_x = -64
	pixel_y = -64
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	var/mob/living/immune = list() // the one who creates the timestop is immune
	var/list/stopped_atoms = list()
	var/freezerange = 2
	var/duration = 140
	alpha = 125

/obj/effect/timestop/New()
	..()
	for(var/mob/living/M in GLOB.player_list)
		for(var/obj/effect/proc_holder/spell/aoe_turf/conjure/timestop/T in M.mind.spell_list) //People who can stop time are immune to timestop
			immune |= M


/obj/effect/timestop/proc/timestop()
	playsound(get_turf(src), 'sound/magic/timeparadox2.ogg', 100, 1, -1)
	for(var/i in 1 to duration-1)
		for(var/A in orange (freezerange, loc))
			if(isliving(A))
				var/mob/living/M = A
				if(M in immune)
					continue
				M.notransform = 1
				M.anchored = 1
				if(istype(M, /mob/living/simple_animal/hostile))
					var/mob/living/simple_animal/hostile/H = M
					H.AIStatus = AI_OFF
					H.LoseTarget()
				stopped_atoms |= M
			else if(istype(A, /obj/item/projectile))
				var/obj/item/projectile/P = A
				P.paused = TRUE
				stopped_atoms |= P

		for(var/mob/living/M in stopped_atoms)
			if(get_dist(get_turf(M),get_turf(src)) > freezerange) //If they lagged/ran past the timestop somehow, just ignore them
				unfreeze_mob(M)
				stopped_atoms -= M
		sleep(1)

	//End
	for(var/mob/living/M in stopped_atoms)
		unfreeze_mob(M)

	for(var/obj/item/projectile/P in stopped_atoms)
		P.paused = FALSE
	qdel(src)
	return

/obj/effect/timestop/proc/unfreeze_mob(mob/living/M)
	M.notransform = 0
	M.anchored = 0
	if(istype(M, /mob/living/simple_animal/hostile))
		var/mob/living/simple_animal/hostile/H = M
		H.AIStatus = initial(H.AIStatus)

/obj/effect/timestop/wizard
	duration = 100

/obj/effect/timestop/wizard/New()
	..()
	timestop()

/obj/effect/timestop/clockwork/Initialize(mapload)
	. = ..()
	for(var/mob/living/M in GLOB.player_list)
		if(isclocker(M))
			immune |= M
	timestop()

/obj/item/stack/tile/bluespace
	name = "bluespace floor tile"
	singular_name = "floor tile"
	desc = "Through a series of micro-teleports, these tiles let people move at incredible speeds."
	icon_state = "tile-bluespace"
	w_class = WEIGHT_CLASS_NORMAL
	force = 6
	materials = list(MAT_METAL=500)
	throwforce = 10
	throw_speed = 3
	throw_range = 7
	flags = CONDUCT
	max_amount = 60
	turf_type = /turf/simulated/floor/bluespace


/turf/simulated/floor/bluespace
	slowdown = -1
	icon_state = "bluespace"
	desc = "Through a series of micro-teleports, these tiles let people move at incredible speeds."
	floor_tile = /obj/item/stack/tile/bluespace

/obj/item/stack/tile/sepia
	name = "sepia floor tile"
	singular_name = "floor tile"
	desc = "Time seems to flow very slowly around these tiles."
	icon_state = "tile-sepia"
	w_class = WEIGHT_CLASS_NORMAL
	force = 6
	materials = list(MAT_METAL=500)
	throwforce = 10
	throw_speed = 3
	throw_range = 7
	flags = CONDUCT
	max_amount = 60
	turf_type = /turf/simulated/floor/sepia

/obj/item/areaeditor/blueprints/slime
	name = "cerulean prints"
	desc = "A one use set of blueprints made of jelly like organic material. Extends the reach of the management console."
	color = "#2956B2"

/obj/item/areaeditor/blueprints/slime/edit_area()
	..()
	var/area/A = get_area(src)
	for(var/turf/T in A)
		T.color = "#2956B2"
	A.xenobiology_compatible = TRUE
	qdel(src)

/turf/simulated/floor/sepia
	slowdown = 2
	icon_state = "sepia"
	desc = "Time seems to flow very slowly around these tiles."
	floor_tile = /obj/item/stack/tile/sepia
