collision
collideFloor: floor

	(self boundSphere globalPosition y)-floor > boundSphere radius ifTrue:[ ^ nil ].

	^ boundSphere collideFloor: floor transform: self globalTransform.