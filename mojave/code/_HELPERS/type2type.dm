
#define MAX_BITFIELD_BITS 24
//Converts a bitfield to a list of numbers
/proc/bitfield2list(bitfield = 0, list/L)
	var/list/r = list()
	if(islist(L))
		var/max = min(length(L), MAX_BITFIELD_BITS)
		for(var/i in 0 to max-1)
			if(bitfield & (1 << i))
				r += L[i+1]
	else
		for(var/i in 0 to MAX_BITFIELD_BITS-1)
			if(bitfield & (1 << i))
				r += (1 << i)

	return r
