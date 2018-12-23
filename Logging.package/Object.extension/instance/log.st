*logging-core
log
	"This method provides the univeral entry point for all logging mechanisms"
	 
	^ LogCurrent value
		inSender: thisContext sender 
	
  
	 