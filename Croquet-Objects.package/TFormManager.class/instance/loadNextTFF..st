loader process
loadNextTFF: tff
	| data controller promise sha |
	"Look in the local file cache"
	self log: tff sha, ': Loading texture...'.
	data := cacheMgr find: tff sha.
	data ifNotNil:[
		"See if cache got corrupted"
		self log: tff sha, ': Found in file cache...'.
		sha := TFormManager generateSHA: data.
		sha = tff sha ifFalse:[
			self log: tff sha, ': Cache invalid (SHA mismatch)...'.
			cacheMgr delete: tff sha.
			data := nil]].
	data ifNotNil:[^self loadNextTFF: tff from: data].
	"Try to get data from a controller"
	controller := TIslandController controllerWithID: tff controllerID.
	controller ifNil:[
		"Try to find another controller later - if this texture is still used we'll get around to it"
		self log: tff sha, ': Controller went away...'.
		mutex critical:[
			findList removeKey: tff sha.
			sortedFindList remove: tff
		].
		^self
	].
	"Ask the controller for the data"
	self log: tff sha, ': Requesting sync...'.
	promise := controller sync: tff sha.
	promise wait.
	data := promise result.
	self log: tff sha, ': Sync complete...'.
	data ifNotNil:["Verify SHA"
		sha := TFormManager generateSHA: data.
		sha = tff sha ifFalse:[
			self log: tff sha, ': Data invalid (SHA mismatch)...'.
			data := nil].
	].
	data ifNil:[^self updateForm: nil tff: tff].
	cacheMgr cache: data to: tff sha.
	self log: tff sha, ': Installing texture...'.
	self loadNextTFF: tff from: data.
