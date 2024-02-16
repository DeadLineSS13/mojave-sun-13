/world/BehaviorNew(datum/behavior_event_handler/event_handler)
	var/current_api = BEHAVIOR_READ_GLOBAL(behavior)
	if(current_api)
		BEHAVIOR_ERROR_LOG("API datum already set (\ref[current_api] ([current_api]))! Was BehaviorNew() called more than once?")
		return

	var/api_datum = /datum/behavior_api/v0

	BEHAVIOR_INFO_LOG("Activating API for version 0")

	if(event_handler && !istype(event_handler))
		BEHAVIOR_ERROR_LOG("Invalid parameter for event_handler: [event_handler]")
		event_handler = null

	var/datum/behavior_api/new_api = new api_datum(event_handler, version)

	BEHAVIOR_WRITE_GLOBAL(behavior, new_api)

	var/result = new_api.OnWorldNew()
	if(!result || result == BEHAVIOR_UNIMPLEMENTED)
		BEHAVIOR_WRITE_GLOBAL(behavior, null)
		BEHAVIOR_ERROR_LOG("Failed to activate API!")

/world/BehaviorMaximumApiVersion()
	return new /datum/behavior_api_version("1.x.x")

/world/BehaviorMinimumApiVersion()
	return new /datum/behavior_api_version("0.0.1")

/world/BehaviorInitializationComplete()
	var/datum/behavior_api/api = BEHAVIOR_READ_GLOBAL(behavior)
	if(api)
		api.OnInitializationComplete()

/world/proc/BehaviorTopic(T)
	var/datum/behavior_api/api = BEHAVIOR_READ_GLOBAL(behavior)
	if(api)
		var/result = api.OnTopic(T)
		if(result != BEHAVIOR_UNIMPLEMENTED)
			return result

/world/BehaviorAvailable()
	return BEHAVIOR_READ_GLOBAL(behavior) != null

/world/BehaviorVersion()
	var/datum/behavior_api/api = BEHAVIOR_READ_GLOBAL(behavior)
	if(api)
		return api.version

/world/BehaviorApiVersion()
	var/datum/behavior_api/api = BEHAVIOR_READ_GLOBAL(behavior)
	if(api)
		return api.ApiVersion()

/world/BehaviorEndProcess()
	var/datum/behavior_api/api = BEHAVIOR_READ_GLOBAL(behavior)
	if(api)
		api.EndProcess()
