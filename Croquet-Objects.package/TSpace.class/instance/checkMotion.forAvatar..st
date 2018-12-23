accessing
checkMotion: aVector forAvatar: anAvatar

	"A filtering opportunity for subclasses to enforce motion constraints on avatars
	 (such as confining the avatars to a particular region, or particular paths.)

	 The input is a vector motion to apply to the avatar;
       the return value is the resulting translation for the avatar.
	 All avatar replica driving operations should be filtered through this method.
	 The base implementation simply allows the motion, unaltered.

	 Note that 'goTo' operations (such as are used for landmarks) are not filtered;
	 this allows the creation of viewpoints outside the drivable bounds of a space.
	 As soon as an avatar at such an outside location is moved, 
	 it will be warped back into a space if the space confines the avatar."

	^ anAvatar localTransform translation + aVector