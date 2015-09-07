/client/proc/cinematic(var/cinematic as anything in list("explosion",null))
	set name = "Play cinematic"
	set category = "Event"
	set desc = "Shows a cinematic, will work like a normal nuke"	// Intended for testing but I thought it might be nice for events on the rare occasion Feel free to comment it out if it's not wanted.
	if(alert("Are you sure you want to run [cinematic]?","Confirmation","Yes","No")=="No") return
	if(!ticker)	return
	switch(cinematic)
		if("explosion")
			var/parameter = input(src,"station_missed = ?","Enter Parameter",0) as num
			var/override
			switch(parameter)
				if(1)
					override = input(src,"mode = ?","Enter Parameter",null) as anything in list("nuclear emergency","no override")
				if(0)
					override = input(src,"mode = ?","Enter Parameter",null) as anything in list("blob","nuclear emergency","AI malfunction","no override")
			ticker.station_explosion_cinematic(parameter,override)
	return