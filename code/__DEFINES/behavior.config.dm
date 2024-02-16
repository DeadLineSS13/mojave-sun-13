#define BEHAVIOR_EXTERNAL_CONFIGURATION
#define BEHAVIOR_DEFINE_AND_SET_GLOBAL(Name, Value) GLOBAL_VAR_INIT(##Name, ##Value); GLOBAL_PROTECT(##Name)
#define BEHAVIOR_READ_GLOBAL(Name) GLOB.##Name
#define BEHAVIOR_WRITE_GLOBAL(Name, Value) GLOB.##Name = ##Value
#define BEHAVIOR_INFO_LOG(message) log_world("Behavior Info: [##message]")
#define BEHAVIOR_WARNING_LOG(message) log_world("Behavior Warn: [##message]")
#define BEHAVIOR_ERROR_LOG(message) log_world("Behavior Error: [##message]")
#define BEHAVIOR_PROTECT_DATUM(Path) GENERAL_PROTECT_DATUM(##Path)