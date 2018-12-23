portals
addToNewSpace: aSpace
	"Add this avatar to aSpace"
	| newIsland spaceClass emap |

	"May get called for a postcard jump to somewhere else in the current space;
	 if so, we needn't do anything."
	(aSpace == self currentSpace) ifTrue: [
		newTransform ifNotNil:[
			replica future localTransform: newTransform.
			newTransform := nil.
		].
		^ self.
	].

	"FIXME: We should know that this is a space..."
	spaceClass := aSpace get: #class.
	(spaceClass includesBehavior: TSpace) ifFalse:[^nil].

	"Remember current space"
	currentSpace := aSpace.

	newIsland := aSpace island.
	replica ifNotNil:[
		self stopScript: #onSnapshot:.
		self costume: nil.
		replica future carryingDrop.
		replica future destroy.
		replica := nil.
	].

	"Create new replicated avatar in aSpace"

	replica := newIsland future new: (replicaClass ifNil:[TAvatarReplica]).
	
	replica wait.
	
	aSpace future addChild: replica.
	aSpace future signal: #avatarEnter with: replica.

	replica future userID: userID.
	replica future viewAngle: viewAngle aspect: viewAspect.
	
	"Reposition in proper location/orientation"
	newTransform ifNotNil:[
		replica future localTransform: newTransform.
		newTransform := nil.
	] ifNil: [
		replica future goToSpaceHome.
	].

	emap := self myEventMap.
	emap ifNotNil: [
		emap keysDo:[:eventName| replica on: eventName notify: self]].

	"Copy costume to new island"
	self installModelData.

	"Create new laser"
	laser := newIsland future new: TLaser.
	laser future translation:(Vector3 x: 0.5 y: -0.3 z: -0.2).
	laser future length: 0.5.
	laserColor ifNil:[
		laserColor := aSpace future nextLaserColor.
		laserColor whenResolved:[laserColor := laserColor value].
	].
	laser future color: laserColor.
	replica future laser: laser.

	"If the space defines an initial translation and/or yaw, use it."
	replica future takeInitialPosition.

	"update the current driving state"
	replica future controlPitch: controlPitch.
	replica future resetPitch.
	replica future speedControl: speedControl.
	driving ifTrue:[replica future startDriving.].
	replica future driveStep.
	replica future selfDestruct.
	lastPosition := nil.
	replica wait.

