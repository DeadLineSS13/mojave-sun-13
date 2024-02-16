// AI API

#define BEHAVIOR_API_VERSION "0.0.1"

/// Create this define if you want to do AI configuration outside of this file.
#ifndef BEHAVIOR_EXTERNAL_CONFIGURATION

// Comment this out once you've filled in the below.
#error BEHAVIOR API unconfigured

// Required interfaces (fill in with your codebase equivalent):

/// Create a global variable named `Name` and set it to `Value`.
#define BEHAVIOR_DEFINE_AND_SET_GLOBAL(Name, Value)

/// Read the value in the global variable `Name`.
#define BEHAVIOR_READ_GLOBAL(Name)

/// Set the value in the global variable `Name` to `Value`.
#define BEHAVIOR_WRITE_GLOBAL(Name, Value)

/// Disallow ANYONE from reflecting a given `path`, security measure to prevent in-game use of DD -> AI capabilities.
#define BEHAVIOR_PROTECT_DATUM(Path)

/// Write an info `message` to a server log.
#define BEHAVIOR_INFO_LOG(message)

/// Write an warning `message` to a server log.
#define BEHAVIOR_WARNING_LOG(message)

/// Write an error `message` to a server log.
#define BEHAVIOR_ERROR_LOG(message)

/// Get the number of connected /clients.
#define BEHAVIOR_CLIENT_COUNT

#endif

/// Before a reboot mode change, extras parameters are the current and new reboot mode enums.
#define BEHAVIOR_EVENT_REBOOT_MODE_CHANGE -1
/// Before a port change is about to happen, extra parameters is new port.
#define BEHAVIOR_EVENT_PORT_SWAP -2
/// Before the instance is renamed, extra parameter is the new name.
#define BEHAVIOR_EVENT_INSTANCE_RENAMED -3
/// When the watchdog sends a health check to DD. No parameters.
#define BEHAVIOR_EVENT_HEALTH_CHECK -4

//REQUIRED HOOKS

/**
 * Call this somewhere in [/world/proc/New] that is always run. This function may sleep!
 *
 * * event_handler - Optional user defined [/datum/behavior_event_handler].
 */
/world/proc/BehaviorNew(datum/behavior_event_handler/event_handler)
	return

/**
 * Call this when your initializations are complete and your game is ready to play before any player interactions happen.
 *
 * This may use [/world/var/sleep_offline] to make this happen so ensure no changes are made to it while this call is running.
 * Afterwards, consider explicitly setting it to what you want to avoid this BYOND bug: http://www.byond.com/forum/post/2575184
 * This function should not be called before ..() in [/world/proc/New].
 */
/world/proc/BehaviorInitializationComplete()
	return

/// Put this at the start of [/world/proc/Topic].
#define BEHAVIOR_TOPIC var/ai_topic_return = BehaviorTopic(args[1]); if(ai_topic_return) return ai_topic_return

/**
 * Call this as late as possible in [world/proc/Reboot] (BEFORE ..()).
 */
/world/proc/BehaviorReboot()
	return

/// Represents a version.
/datum/behavior_api_version
	/// The suite/major version number.
	var/suite

	// This group of variables can be null to represent a wild card.
	/// The minor version number. null for wildcards.
	var/minor
	/// The patch version number. null for wildcards.
	var/patch

	/// Legacy version number. Generally null.
	var/deprecated_patch

	/// Unparsed string value.
	var/raw_parameter
	/// String value minus prefix.
	var/deprefixed_parameter


/// User definable handler for AI events.
/datum/behavior_event_handler
	var/receive_health_checks = FALSE

/**
 * User definable callback for handling AI events.
 *
 * event_code - One of the BEHAVIOR_EVENT_ defines. Extra parameters will be documented in each.
 */
/datum/behavior_event_handler/proc/HandleEvent(event_code, ...)
	set waitfor = FALSE
	return

// API FUNCTIONS

/// Returns the maximum supported [/datum/behavior_api_version] of the DMAPI.
/world/proc/BehaviorMaximumApiVersion()
	return

/// Returns the minimum supported [/datum/behavior_api_version] of the DMAPI.
/world/proc/BehaviorMinimumApiVersion()
	return

/**
 * Returns [TRUE] if DreamDaemon was launched under AI, the API matches, and was properly initialized. [FALSE] will be returned otherwise.
 */
/world/proc/BehaviorAvailable()
	return

// No function below this succeeds if it BehaviorAvailable() returns FALSE or if BehaviorNew() has yet to be called.

/**
 * Forces a hard reboot of DreamDaemon by ending the process. This function may sleep!
 *
 * Unlike del(world) clients will try to reconnect.
 * If AI has not requested a [BEHAVIOR_REBOOT_MODE_SHUTDOWN] DreamDaemon will be launched again.
 */
/world/proc/BehaviorEndProcess()
	return
