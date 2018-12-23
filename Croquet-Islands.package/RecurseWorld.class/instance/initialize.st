initialize
initialize

	| frame space cube cube2 portal win number count |

	space := TSpace new.
	space color: (VectorColor r:0.2 g:1.0 b:1.0 a:1.0).
	space registerGlobal:#recurseSpace.
	TLight makeLights: space.
	cube := TCube new.
	space addChild: cube.
	50 timesRepeat:[
		cube2 := TCube new.
		frame := TDemoFish new.
		frame target: cube.
		frame contents: cube2.
		frame translation:((20-(40 atRandom))@(20-(40 atRandom))@(20-(40 atRandom))).
		space addChild: frame.
		frame addRotationAroundX: 360 atRandom.
		frame addRotationAroundY: 360 atRandom.
		frame addRotationAroundZ: 360 atRandom.
	].
	25 timesRepeat:[
		frame := TSpinTest new.
		space addChild: frame.
		frame translation:((10-(20 atRandom))@(10-(20 atRandom))@(10-(20 atRandom))).
		frame addRotationAroundX: 360 atRandom.
		frame addRotationAroundY: 360 atRandom.
		frame addRotationAroundZ: 360 atRandom.
	].

	number := 4.
	count := 1.
	1 to: number do:[:i |
		1 to: number do:[:j |
			1 to: number do:[:k|
				cube := TDragCube new.
				cube rotationAroundY:15.
				cube translation:((i-1-(number/2.0))@(j-1-(number/2.0))@(k-1-(number/2.0))).
				cube setColor: (VectorColor r:number-i/number asFloat g:number-j/number asFloat b:number-k/number asFloat a:1.0).
				cube objectName: count.
				count := count+1.
				space addChild: cube.
			].
		].
	].


	win := TWindow new.
	win translation: 0@0@15.
	space addChild: win.

	portal := TPortal new.
	portal translation: 0@0@0.
	portal registerGlobal:#portal1.
	portal extent:5@5.
	win rotationAroundY:180.
	win contents: portal.

