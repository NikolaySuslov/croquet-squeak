render
renderWorld
	| mutexSet oldCam randomList |

	avatar newPostcard  ifNil:[
		"@@@@ FIXME: This is screwed up - we should really know which space we're in @@@@"
		avatar currentSpace == self activeSpace
			ifFalse:[
				avatar addToNewSpace: self activeSpace.
				avatar updateCamera: ogl camera.
			].
	] ifNotNil:[
		avatar addToNewSpace: (avatar newPostcard resolveViewpoint:ogl).
"@@@@ FIXME: This is screwed up, too - the following should use a proper future send not an immediate #send:. @@@@"
		viewPortal send:[ :vp | vp postcardLink: avatar newPostcard.].
		avatar newPostcard:nil.
		avatar updateCamera: ogl camera.
	"	ogl camera localTransform: avatar globalTransform."
	].

	"We use activeSpace (the instance variable) only as memory
	 to detect space transitions. If activeSpace has changed, signal the event."

	(activeSpace ~= self activeSpace) ifTrue: [
		activeSpace := self activeSpace.
		self signal: #activeSpaceChanged with: activeSpace.
	].

	mutexSet := TMutexSet withAll: (controllers collect:[:cc| cc mutex]).
	mutexSet critical:[
		readyToRender wait.
		"Temporarily, force any attempt to creat OIDs to fail"
		randomList := (controllers select:[:cc| cc island notNil]) 
			collect:[:cc| cc island -> (cc island get: #randomStream)].
		randomList do:[:a| a key send:[:x| x randomStream: nil]].
		ogl ifNotNil:[
			formMgr updateList: ogl.
			avatar updateCamera: ogl camera.
			avatar driveStep.
			self aboutToRender.
			ogl makeCurrent.
			ogl glLoadIdentity.
			event avatar: avatar replica.
			event camera: ogl camera.
			eventPointer resetSelected: event.
			ogl eventPointer: eventPointer.
			(redButtonPressed and:[task noPickWhileDown])ifTrue:[
				eventPointer selection target ifNotNil:[
					eventPointer selectedRayTransform: eventPointer localTransform.
					eventPointer selection target send:[ :tgt | tgt pickSelf: ogl .].
				].
				ogl eventPointer: nil.
			].
			viewPortal send:[ :vp | vp renderView: ogl with:{systemOverlayPortal}.].
			overlays do:[:each| each renderOverlay: ogl].
			ogl swapBuffers.
			"render snapshots"
			oldCam := ogl camera.
			snapshots do:[:snap| 
				snap update ifTrue:[self renderSnapshot: snap]].
			ogl camera: oldCam.
			ogl camera initFrustum: ogl.
		].
		randomList do:[:a| a key send:[:x| x randomStream: a value]].
	 ].
	ogl eventPointer: eventPointer.
