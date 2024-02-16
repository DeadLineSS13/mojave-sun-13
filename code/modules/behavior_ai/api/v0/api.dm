/datum/behavior_api/v0
	var/initialized = FALSE

/datum/behavior_api/OnWorldNew()
	initialized = TRUE
	return TRUE
