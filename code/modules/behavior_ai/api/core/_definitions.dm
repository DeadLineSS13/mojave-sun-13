#if DM_VERSION < 510
#error The AI API does not support BYOND versions < 510!
#endif

#define BEHAVIOR_UNIMPLEMENTED "___unimplemented"

#ifndef BEHAVIOR_DEBUG_LOG
#define BEHAVIOR_DEBUG_LOG(message)
#endif