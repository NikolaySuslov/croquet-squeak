initialize
initialize
	super initialize.
	self color: 0.7@0.9@1.0@1.0.	
	lightFrames := OrderedCollection new: 0.
	portalFrames := OrderedCollection new: 0.
	rayFrames := OrderedCollection new: 0.
	savedAlphaObjects := OrderedCollection new: 0. "alpha save stack"
	alphaObjects := OrderedCollection new: 0.
	cullBackFaces := true.
	fogOn := false.
	fogStart := 1.0.
	fogEnd := 100.0.
	fogDensity := 0.05.
	testRays := true.
	frameChanged := false.
	alphaObjects := OrderedCollection new: 0. 
	tframes := Dictionary new.
	self register.
	defaultMaterial := TMaterial new.
	(self future:100)primitiveStep.
	defaultLaserColors := ReadStream on: (#(
		(0.95 0.1 0.1)
		(0.85 0.85 0.1)
		(0.1 0.9 0.2)
		(0.1 0.9 0.9)
		(0.2 0.1 1.0)
		(0.9 0.04 0.9)
		(0.6 0.25 0.05)
		(0.95 0.5 0.05)
	) collect:[:each| each asVectorColor]) shuffled.
