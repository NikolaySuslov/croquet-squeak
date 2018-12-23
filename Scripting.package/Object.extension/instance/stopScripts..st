*Scripting-Extensions
stopScripts: scriptList
	scriptList do:[:script| self stopScript: script].