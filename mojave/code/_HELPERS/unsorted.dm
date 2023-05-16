
///Converts a screen loc param to a x,y coordinate pixel on the screen
/proc/params2screenpixel(scr_loc)
	var/list/x_and_y = splittext(scr_loc, ",")
	var/list/x_dirty = splittext(x_and_y[1], ":")
	var/list/y_dirty = splittext(x_and_y[2], ":")
	var/x = (text2num(x_dirty[1])-1)*32 + text2num(x_dirty[2])
	var/y = (text2num(y_dirty[1])-1)*32 + text2num(y_dirty[2])
	return list(x, y)
