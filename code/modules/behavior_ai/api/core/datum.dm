BEHAVIOR_DEFINE_AND_SET_GLOBAL(behavior, null)

/datum/behavior_api
    var/datum/behavior_api_version/version
	var/datum/behavior_event_handler/event_handler

/datum/behavior_api/New(datum/behavior_event_handler/event_handler, datum/behavior_api_version/version)
	. = ..()
	src.event_handler = event_handler
	src.version = version

BEHAVIOR_PROTECT_DATUM(/datum/behavior_api)

/datum/behavior_api/proc/ApiVersion()
	return BEHAVIOR_UNIMPLEMENTED

/datum/behavior_api/proc/OnWorldNew(datum/behavior_event_handler/event_handler)
	return BEHAVIOR_UNIMPLEMENTED

/datum/behavior_api/proc/OnInitializationComplete()
	return BEHAVIOR_UNIMPLEMENTED

/datum/behavior_api/proc/OnTopic(T)
	return BEHAVIOR_UNIMPLEMENTED

/datum/behavior_api/proc/OnReboot()
	return BEHAVIOR_UNIMPLEMENTED

/datum/behavior_api/proc/InstanceName()
	return BEHAVIOR_UNIMPLEMENTED

/datum/behavior_api/proc/EndProcess()
	return BEHAVIOR_UNIMPLEMENTED
