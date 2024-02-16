/datum/behavior_api/v0

/datum/behavior_api/v0/New()
    . = ..()
    interop_version = version
	BEHAVIOR_DEBUG_LOG("V0 API created: [json_encode(args)]")

